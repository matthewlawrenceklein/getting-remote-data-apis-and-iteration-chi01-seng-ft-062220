require 'rest-client'
require 'json'
require 'pry'
require 'awesome_print'

def get_character_movies_from_api(character_name)
  #make the web request


  response_string = RestClient.get('http://swapi.dev/api/people')
  response_hash = JSON.parse(response_string)

  character_data = response_hash["results"].find { |data| data["name"] == character_name }
  film_urls = character_data["films"]
  film_data = film_urls.collect { |data| JSON.parse(RestClient.get(data)) }
  
  

end

def print_movies(films)
  films.each do |data|
    ap data["title"]
  end
end

def print_producer(films)
  films.each do |data|
    ap data["producer"]
  end
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
  print_producer(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?


