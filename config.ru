require 'pry'
require 'redis'
require 'sinatra/base'
require 'sinatra/reloader'
# require 'google/api_client'

require_relative 'database_helper'
require_relative 'server'

run HitchHikely::Server
