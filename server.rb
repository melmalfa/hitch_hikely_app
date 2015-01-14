

module HitchHiker
  class Server < Sinatra::Base

    enable :logging

    configure :development do
      register Sinatra::Reloader
      $redis = Redis.new
    end

    get('/') do
      render(:erb, :index)
    end

    get('/new') do
      render(:erb, :new)
    end

    get('/show') do
      render(:erb, :show)
    end

      get('/create')  do
    render(:erb, :create)
    end

  end
end
