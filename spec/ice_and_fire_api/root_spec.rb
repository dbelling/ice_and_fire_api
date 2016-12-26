require 'spec_helper'

describe IceAndFireApi::Root do
  describe 'fetch' do
    it 'fetches the root url metadata' do
      VCR.use_cassette('root_find') do
        root = IceAndFireApi::Root.fetch
        expect(root).to be_instance_of IceAndFireApi::Root
        expect(root.books).to eq('http://www.anapioficeandfire.com/api/books')
        expect(root.characters).to eq('http://www.anapioficeandfire.com/api/characters')
        expect(root.houses).to eq('http://www.anapioficeandfire.com/api/houses')
      end
    end
  end
end
