class GemExist::Cli

  attr_accessor :gem_search, :detail

  def begin_new_search
    puts "-------------------------------------------"
    puts "Enter a term to search on rubygems.org."
    puts "(You may type \"exit\" at any time to quit)"
    puts "-------------------------------------------"
    search_term = gets.strip
    binding.pry
    if search_term != "exit"
      @gem_search = GemExist::SearchRubygems.new(search_term)
      select_detail
    end
  end

  def select_detail
    if FoundGem.all.size < 1
      puts "No search results found. Congratulations?"
      loop_no_back
    else
      puts "Please enter the number of the gem you want to see more information about."
      @detail = gets.strip.to_i
      if detail != 0
        FoundGem.all[detail - 1].get_data
        print_detail
      end
    end
  end

  def print_detail
    puts "-------------------------------------------"
    puts "Gem Name: #{FoundGem.all[detail - 1].name}"
    puts "Gem Description: #{FoundGem.all[detail - 1].desc}"
    puts "Gem Author: #{FoundGem.all[detail - 1].author}"
    puts "Gem Downloads: #{FoundGem.all[detail - 1].downloads}"
    puts "-------------------------------------------"
    loop_or_quit?
  end

  def loop_or_quit?
    puts "Please type \"back\", \"new search\", or \"exit\"."
    choice = gets.strip
    case choice
    when "back"
      @gem_search.display_names
      select_detail
    when "new search"
      FoundGem.destroy_all
      begin_new_search
    when "exit"
      puts "Goodbye!"
    else 
      puts "Invalid entry, please try again."
      loop_or_quit?
    end
  end

  def loop_no_back
    puts "Please type \"new search\", or \"exit\"."
    choice = gets.strip
    case choice
    when "new search"
      begin_new_search
    when "exit"
      puts "Goodbye!"
    else 
      puts "Invalid entry, please try again."
      loop_or_quit?
    end
  end

end

