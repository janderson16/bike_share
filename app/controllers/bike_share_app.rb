require 'will_paginate'
require 'will_paginate/active_record'
require 'pry'

class BikeShareApp < Sinatra::Base
  include WillPaginate::Sinatra::Helpers


  get '/' do
    erb :'home/index'
  end

#Routes for stations
  get '/stations/index' do
    stations = Station.all
    @stations = stations.paginate(:page => params[:page], :per_page => 10)
    erb :'stations/index'
  end

  get '/stations/new' do
    @station = Station.new
    erb :'stations/new'
  end

  post '/stations/new' do
    @station = Station.user_gen_station(params[:station])
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
    @station = Station.update(params[:id].to_i, params[:station])
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

#Routes for Trips
  get '/trips' do
    trips = Trip.all
    @trips = trips.paginate(:page => params[:page], :per_page => 30)
    erb :'trips/index'
  end

  get '/trips/new' do
    @stations = Station.all.order(:name)
    @trips = Trip.new
    erb :'trips/new'
  end

  post '/trips/new' do
    @trip = Trip.user_gen_trip(params[:trip])
    redirect "trips/#{@trip.id}"
  end

  get '/trips/:id' do
    @trip = Trip.find(params[:id])
    erb :"/trips/show"
  end

  get '/trips/:id/edit' do
    @stations = Station.all.order(:name)
    @trip = Trip.find(params[:id])
    erb :'trips/edit'
  end

  put '/trips/:id' do
    @trip = Trip.update(params[:id].to_i, params[:trip])
    redirect "trips/#{@trip.id}"
  end

  delete '/trips/:id' do
    @trips = Trip.destroy(params[:id])
    redirect "/trips"
  end

  get '/home/trip-dashboard' do
    @trips = Trip.all
    erb :'home/trip-dashboard'
  end

#Routes for condition Conditions
  get '/conditions' do
    weathers = Weather.all
    @weathers = weathers.paginate(:page => params[:page], :per_page => 10)
    erb :'conditions/index'
  end

  get '/conditions/new' do
    @weathers = Weather.new
    erb :'conditions/new'
  end

  post '/conditions/new' do
    @weather = Weather.create(params[:weather])
    redirect "conditions/#{@weather.id}"
  end

  get "/conditions/:id" do
    @weather = Weather.find(params[:id])
    erb :"/conditions/show"
  end

  get '/conditions/:id/edit' do
    @weather = Weather.find(params[:id])
    erb :'conditions/edit'
  end

  put '/conditions/:id' do
    @weathers = weather.update(params[:id], params[:weather])
    redirect "conditions/#{@weather.id}"

  delete '/conditions/:id'
    @weathers = weather.destroy(params[:id])
    redirect "/conditions"
  end

  get '/home/weather-dashboard' do
    @weathers = Weather.all
    erb :'home/weather-dashboard'
  end

  put '/home/weather-dashboard' do
    Weather.average_rides_in_temp_range(cars)
    erb :'home/weather-dashboard'
  end
end
