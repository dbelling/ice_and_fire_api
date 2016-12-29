require 'spec_helper'

describe IceAndFireApi do
  it 'has a version number' do
    expect(IceAndFireApi::VERSION).to eq('1.1.0')
  end

  it 'contains an api url' do
    expect(IceAndFireApi::API_URL).to eq('http://www.anapioficeandfire.com/api')
  end
end
