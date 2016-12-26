require 'ice_and_fire_api/version'
require 'ice_and_fire_api/book'
require 'ice_and_fire_api/character'
require 'ice_and_fire_api/house'
require 'ice_and_fire_api/root'
require 'json'
require 'faraday'
require 'uri'

module IceAndFireApi
  API_URL = 'http://www.anapioficeandfire.com/api'.freeze
end
