class BikeShareApp < Sinatra::Base

  get '/' do
    erb :'home/index'
  end


  get '/stations/index' do
    @stations = Station.all
    erb :'stations/index'
  end

  get '/stations/new' do
    @station = Station.new
    erb :'stations/new'
  end

  post '/stations/new' do
    @station = Station.create(params[:station])
  redirect "/stations/#{@station.id}"
  end

  get '/stations/:id' do
      @station = Station.find(params[:id])
    erb :'stations/show'
  end

  get '/stations/:id/edit' do
    @station = Station.find(params[:id])
    erb :'stations/edit'
  end

  put '/stations/:id' do
      @station = Station.update(params[:id], params[:station])
      redirect "/stations/#{@station.id}"
  end


  delete '/stations/:id' do
    @station = Station.destroy(params[:id])
    redirect "/stations/index"
  end

  get '/home/station_dashboard' do
    @stations = Station.all
    erb :'home/station_dashboard'
  end
  
  get '/trips' do
    @trips = Trip.all
    erb :'trips/index'
  end

  get '/trips/new' do
    @trip = Trip.new
    erb :'trips/new'
  end

  post '/trips/new' do
    @trip= Trip.create(params[:trip])
    redirect "trips/#{@trip.id}"
  end

  get '/trips/:id' do
    @trip = Trip.find(params[:id])
    erb :"/trips/show"
  end

  get '/trips/:id/edit' do
    @trip = Trip.find(params[:id])
    erb :'trips/edit'
  end

  put '/trips/:id' do
    @trip = Trip.update(params[:id], params[:trip])
    redirect "trips/#{@trip.id}"
  end

  delete '/trips/:id' do
    @trip = Trip.destroy(params[:id])
    redirect "/trips"
  end
end
