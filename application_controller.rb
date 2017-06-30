require 'bundler'
Bundler.require
require_relative 'models/model.rb'
class MyApp < Sinatra::Base

  get '/' do
    erb :index
  end

 post '/product' do
    user_search=params[:search]
    user_tag=params[:hello]
    puts user_tag
    @answer=makeupproduct(user_search, user_tag)
    @name=@answer[0]
    @price=@answer[1]
    @description=@answer[2]
    @image_link=@answer[3]
    @product_link=@answer[4]
    erb :results
  end
end




