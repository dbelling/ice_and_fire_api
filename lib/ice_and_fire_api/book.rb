module IceAndFireApi
  class Book
    attr_reader :url, :name, :isbn, :authors,
                :numberOfPages, :publisher, :country,
                :mediaType, :released, :characters, :povCharacters

    def initialize(attributes)
      @url = attributes['url']
      @name = attributes['name']
      @isbn = attributes['isbn']
      @authors = attributes['authors']
      @number_of_pages = attributes['numberOfPages']
      @publisher = attributes['publisher']
      @country = attributes['country']
      @media_type = attributes['mediaType']
      @released = attributes['released']
      @characters = attributes['characters']
      @pov_characters = attributes['povCharacters']
    end

    def self.find(id)
      response = Faraday.get("#{IceAndFireApi::API_URL}/books/#{id}")
      attributes = JSON.parse(response.body)
      new(attributes)
    end

    def self.find_by(query_parameters)
      book_query = URI.encode_www_form(query_parameters)
      response = Faraday.get("#{IceAndFireApi::API_URL}/books?#{book_query}")
      attributes_response = JSON.parse(response.body)
      attributes_array = []
      attributes_response.each do |attributes|
        attributes_array << new(attributes)
      end
      attributes_array
    end
  end
end
