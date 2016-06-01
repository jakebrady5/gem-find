require 'spec_helper'

describe FoundGem do

  it 'get_data populates desc, author, downloads with non nil values' do

    allow($stdout).to receive(:puts)

    search = GemFind::SearchRubygems.new("learn")
    FoundGem.all[0].get_data
    expect(FoundGem.all[0].desc).not_to eq(nil)
    expect(FoundGem.all[0].author).not_to eq(nil)
    expect(FoundGem.all[0].downloads).not_to eq(nil)

  end

end