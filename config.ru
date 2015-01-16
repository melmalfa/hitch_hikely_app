require 'pry'
require 'redis'
require 'httparty'
require 'json'
require 'sinatra/base'
require 'sinatra/reloader'

require_relative 'database_helper'
require_relative 'maps_api_helper'
require_relative 'server'

run HitchHikely::Server
