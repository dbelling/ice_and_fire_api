require 'spec_helper'

describe IceAndFireApi::House do
  describe 'find' do
    it 'pulls information on house baratheon' do
      VCR.use_cassette('house_find') do
        house = IceAndFireApi::House.find(17)
        expect(house).to be_instance_of IceAndFireApi::House
        expect(house.name).to eq("House Baratheon of Storm's End")
        expect(house.region).to eq('The Stormlands')
      end
    end
  end

  describe 'find_by' do
    context 'name' do
      it 'pulls information on house hawthorne' do
        VCR.use_cassette('house_find_by_name') do
          house = IceAndFireApi::House.find_by(name: 'House Hawthorne')
          expect(house.first).to be_instance_of IceAndFireApi::House
          expect(house.first.name).to eq('House Hawthorne')
          expect(house.first.region).to eq('The Westerlands')
        end
      end
    end

    context 'region with page size' do
      it 'filters houses in a given region with a page size' do
        VCR.use_cassette('house_find_by_region') do
          house = IceAndFireApi::House.find_by(region: 'The North', pageSize: 5)
          expect(house.first).to be_instance_of IceAndFireApi::House
          expect(house.first.name).to eq('House Amber')
        end
      end
    end
  end
end
