require 'spec_helper'

describe IceAndFireApi::Character do
  describe 'find' do
    it 'pulls information on tyrion lannister' do
      VCR.use_cassette('character_find') do
        character = IceAndFireApi::Character.find(1052)
        expect(character).to be_instance_of IceAndFireApi::Character
        expect(character.name).to eq('Tyrion Lannister')
        expect(character.gender).to eq('Male')
        expect(character.died).to eq('')
      end
    end
  end

  describe 'find_by_name' do
    it 'pulls information on jon snow' do
      VCR.use_cassette('character_find_by_name') do
        character = IceAndFireApi::Character.find_by_name('Jon Snow')
        expect(character.first).to be_instance_of IceAndFireApi::Character
        expect(character.first.name).to eq('Jon Snow')
        expect(character.first.gender).to eq('Male')
        expect(character.first.died).to eq('')
      end
    end
  end
end
