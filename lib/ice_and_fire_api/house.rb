module IceAndFireApi
  class House
    attr_reader :url, :name, :region, :coat_of_arms,
                :words, :titles, :seats, :current_lord,
                :heir, :overlord, :founded, :founder,
                :died_out, :ancestral_weapons, :cadet_branches,
                :sworn_members

    def initialize(attributes)
      @url = attributes['url']
      @name = attributes['name']
      @region = attributes['region']
      @coat_of_arms = attributes['coatOfArms']
      @words = attributes['words']
      @titles = attributes['titles']
      @seats = attributes['seats']
      @current_lord = attributes['currentLord']
      @heir = attributes['heir']
      @overlord = attributes['overlord']
      @founded = attributes['founded']
      @founder = attributes['founder']
      @died_out = attributes['diedOut']
      @ancestral_weapons = attributes['ancestralWeapons']
      @cadet_branches = attributes['cadetBranches']
      @sworn_members = attributes['swornMembers']
    end

    def self.find(id)
      response = Faraday.get("#{IceAndFireApi::API_URL}/houses/#{id}")
      attributes = JSON.parse(response.body)
      new(attributes)
    end

    def self.find_by_name(name)
      name_query = URI.encode_www_form_component(name.to_s)
      response = Faraday.get("#{IceAndFireApi::API_URL}/houses?name=#{name_query}")
      attributes_response = JSON.parse(response.body)
      attributes_array = []
      attributes_response.each do |attributes|
        attributes_array << new(attributes)
      end
      attributes_array
    end
  end
end
