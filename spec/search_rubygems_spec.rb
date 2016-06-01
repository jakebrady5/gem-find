require 'spec_helper'

describe GemFind::SearchRubygems do
  let(:data) {[
      {"name":"learn_words","downloads":5230,"version":"0.1.2","version_downloads":1885,"platform":"ruby","authors":"Vladimir Parfinenko","info":"Simple script for learning foreign language words","licenses": nil,"metadata":{},"sha":"32f47ede7957d766f1c008d7b4a1a6a2ed69a51075ede9ad51cf9a9bea8c7191","project_uri":"https://rubygems.org/gems/learn_words","gem_uri":"https://rubygems.org/gems/learn_words-0.1.2.gem","homepage_uri":"http://github.com/cypok/learn_words","wiki_uri":"","documentation_uri":"http://www.rubydoc.info/gems/learn_words/0.1.2","mailing_list_uri":"","source_code_uri":"http://github.com/cypok/learn_words/","bug_tracker_uri":"http://github.com/cypok/learn_words/issues","dependencies":{"development":[],"runtime":[{"name":"highline","requirements":"\u003e= 0"}]}},
      {"name":"learn_gem","downloads":5850,"version":"0.0.4","version_downloads":1600,"platform":"ruby","authors":"Guten, Bob","info":"hello","licenses": nil,"metadata":{},"sha":"1843e1f85230107e949db0ad3fc35b719380cec79238d6340aa2a9fe0bfe372f","project_uri":"https://rubygems.org/gems/learn_gem","gem_uri":"https://rubygems.org/gems/learn_gem-0.0.4.gem","homepage_uri":"http://g.cn","wiki_uri": nil,"documentation_uri":"http://www.rubydoc.info/gems/learn_gem/0.0.4","mailing_list_uri": nil,"source_code_uri": nil,"bug_tracker_uri": nil,"dependencies":{"development":[],"runtime":[{"name":"pa","requirements":"\u003e= 0"}]}}
    ]}

  it 'is defined' do
    expect(GemFind::SearchRubygems).to be_truthy
  end

  it 'loads the JSON for the search term on initialization' do
    allow($stdout).to receive(:puts)
    expect(JSON).to receive(:load).and_return(data)
    search = GemFind::SearchRubygems.new("learn")
  end

  it 'narrow_results reduces num of results if over 7' do
    allow($stdout).to receive(:puts)
    much_data = Array.new(50, {})
    expect(JSON).to receive(:load).and_return(much_data)
    search = GemFind::SearchRubygems.new("learn")
    expect(search.narrow_results.size).to eq(10)
  end

  it 'create_gem_data initializes several FoundGem objects' do
    FoundGem.destroy_all
    allow($stdout).to receive(:puts)
    expect(JSON).to receive(:load).and_return(data)
    search = GemFind::SearchRubygems.new("learn")
    expect(FoundGem.all.size).to eq(2)
  end

end






