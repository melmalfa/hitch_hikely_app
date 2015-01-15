module HitchHikely
  class Server < Sinatra::Base

    helpers HitchHikely
    #what is a helper as opposed to another type of file?


    enable :logging

    configure :development do
      register Sinatra::Reloader
      $redis = Redis.new
    end

    get('/') do
      redirect to('/stories')
    end

    get('/stories') do

      render(:erb, :index, :layout => :default)
    end

    get('/stories/new') do
      render(:erb, :new, :layout => :default)
    end

    get('/stories/:id') do
      render(:erb, :show, :layout => :default)
    end

    post('/stories')  do
      redirect to('/stories/new')
    end

    #i want the following to create a list of all

  end
end
