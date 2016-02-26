require 'rest-client'
require 'json'

class TmdbIdRequest
  def initialize(parameters)
    @media_type = parameters[:media_type]
    @media_id  = parameters[:media_id]
    @token  = parameters[:token]
    
  end

  def call
    response = JSON.parse RestClient.get endpoint
    response   
  end

  def endpoint
    return "https://api.themoviedb.org/3/#{@media_type}/#{@media_id}?api_key=#{@token}"
  end
end