require 'sinatra'
require 'sinatra/reloader'
require 'typhoeus'
require 'json'

MY_DB = []

get "/" do

	redirect "/animals"
end

# the INDEX METHOD/ROUTE for an Animal
get "/animals" do
	@animals = MY_DB

	erb :index
end

# the CREATE METHOD/ROUTE for an Animal
post "/animals" do
  search_str = params[:movie]
  request = Typhoeus.get("www.omdbapi.com", :params => {:s => search_str})
  movies = JSON.parse(request.body)["Search"]
end

# the SHOW METHOD/ROUTE for 
get "/animals/:id" do
	id = params[:id].to_i

	@animal = MY_DB[id]

	erb :show
	
end



# post '/result' do
#   search_str = params[:movie]
#   request = Typhoeus.get("www.omdbapi.com", :params => {:s => search_str})
#   movies = JSON.parse(request.body)["Search"]
#   html_str = "<html><head><title>Movie Search Results</title></head><body><h1>Movie Results</h1>\n<ul>"
#   if movies.nil?
#     html_str += "NO MOVIE!!!!"
#   else
#   movies = JSON.parse(request.body)["Search"].sort_by { |x| x["Year"]}.reverse
#   movies.each do |x|

#     html_str += "<li><a href=/poster/#{x["imdbID"]}>#{x['Title']}, #{x['Year']}</a></li>"
#   end
  
#   end

#   html_str += "</ul><br><a href='/'>New Search</a></body></html>"
# end






# MY_DB = []

# get "/" do

# 	redirect "/animals"
# end

# # the INDEX METHOD/ROUTE for an Animal
# get "/animals" do
# 	@animals = MY_DB

# 	erb :index
# end

# # the CREATE METHOD/ROUTE for an Animal
# post "/animals" do
# 	animal = params[:animal]
# 	MY_DB << animal
# 	id = MY_DB.length() -1
# 	redirect "/animals/#{id}"
# end

# # the SHOW METHOD/ROUTE for 
# get "/animals/:id" do
# 	id = params[:id].to_i

# 	@animal = MY_DB[id]

# 	erb :show
	
# end

