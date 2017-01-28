class BikeShareApp < Sinatra::Base

  get '/' do
    erb :"home/index"
  end

  get '/stations' do
    @stations = Station.all
    erb :"stations/index"
  end

  get 'stations/index' do
  end

  get 'stations/new' do
    @station = Station.new
    erb :'stations/new'
  end

  post '/stations/new' do
  @station = Station.create(params[:station])
  redirect "/stations/#{@station.id}"
  end
end
