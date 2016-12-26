module IceAndFireApi
  class Root
    attr_reader :books, :characters, :houses

    def initialize(attributes)
      @books = attributes['books']
      @characters = attributes['characters']
      @houses = attributes['houses']
    end

    def self.fetch
      response = Faraday.get(IceAndFireApi::API_URL.to_s)
      attributes = JSON.parse(response.body)
      new(attributes)
    end
  end
end
