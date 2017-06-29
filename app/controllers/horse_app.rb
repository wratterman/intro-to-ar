class HorseApp < Sinatra::Base

  get '/' do
    erb :dashboard
  end

  get '/horses' do
    @horses = Horse.all
    erb :"horses/index"
  end

  post '/horses' do
    horse = Horse.new(params[:horse])
    horse.save
    redirect '/horses'
    erb :layout
  end

  get '/horses/new' do
    erb :new_horse
  end

  get '/horses/:id' do
    @horse = Horse.find(params[:id])
    erb :show
  end

  get '/horses/:id/edit' do
    @horse = Horse.find(params[:id])
    erb :edit
  end

  put '/horses/:id' do |id|
    Horse.update(id.to_i, params[:horse])
    redirect "/horses/#{id}"
  end

  delete '/horses/:id' do |id|
   Horse.destroy(id.to_i)
   redirect '/horses'
 end

  get '/jockeys' do
    @jockeys = Jockey.all
    erb :"jockeys/index"
  end

  get '/jockeys/:id' do
    @jockey = Jockey.find(params[:id])
    @total_winnings = @jockey.horses.total_winnings
    @average_winngings = @jockey.horses.average_winngings
    erb :"jockeys/show"
  end
end
