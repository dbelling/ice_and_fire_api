module IceAndFireApi
  class Character
    attr_reader :url, :name, :gender, :culture,
                :born, :died, :titles, :aliases,
                :father, :mother, :spouse, :allegiances,
                :books, :pov_books, :tv_series, :played_by

    def initialize(attributes)
      @url = attributes['url']
      @name = attributes['name']
      @gender = attributes['gender']
      @culture = attributes['culture']
      @born = attributes['born']
      @died = attributes['died']
      @titles = attributes['titles']
      @aliases = attributes['aliases']
      @father = attributes['father']
      @mother = attributes['mother']
      @spouse = attributes['spouse']
      @allegiances = attributes['allegiances']
      @books = attributes['books']
      @pov_books = attributes['povBooks']
      @tv_series = attributes['tvSeries']
      @played_by = attributes['playedBy']
    end

    def self.find(id)
      response = Faraday.get("#{IceAndFireApi::API_URL}/characters/#{id}")
      attributes = JSON.parse(response.body)
      new(attributes)
    end

    def self.find_by(query_parameters)
      character_query = URI.encode_www_form(query_parameters)
      response = Faraday.get("#{IceAndFireApi::API_URL}/characters?#{character_query}")
      attributes_response = JSON.parse(response.body)
      attributes_array = []
      attributes_response.each do |attributes|
        attributes_array << new(attributes)
      end
      attributes_array
    end
  end
end
