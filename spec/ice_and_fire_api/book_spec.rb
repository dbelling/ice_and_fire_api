require 'spec_helper'

describe IceAndFireApi::Book do
  describe 'find' do
    it 'pulls information on a game of thrones' do
      VCR.use_cassette('book_find') do
        book = IceAndFireApi::Book.find(1)
        expect(book).to be_instance_of IceAndFireApi::Book
        expect(book.name).to eq('A Game of Thrones')
        expect(book.authors).to include('George R. R. Martin')
      end
    end
  end

  describe 'find_by' do
    context 'name' do
      it 'pulls information on a storm of swords' do
        VCR.use_cassette('book_find_by_name') do
          book = IceAndFireApi::Book.find_by(name: 'A Storm Of Swords')
          expect(book.first).to be_instance_of IceAndFireApi::Book
          expect(book.first.name).to eq('A Storm of Swords')
          expect(book.first.authors).to include('George R. R. Martin')
        end
      end
    end

    context 'latest releases' do
      it 'filters books only released after 2010' do
        VCR.use_cassette('book_find_by_release_date') do
          book = IceAndFireApi::Book.find_by(fromReleaseDate: '2010-09-22T00:00:00')
          expect(book[1]).to be_instance_of IceAndFireApi::Book
          expect(book[1].name).to eq('A Dance with Dragons')
          expect(book[1].released).to eq('2011-07-12T00:00:00')
        end
      end
    end
  end
end
