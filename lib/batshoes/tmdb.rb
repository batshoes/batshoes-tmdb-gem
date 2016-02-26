require_relative 'tmdb_id_request'

module BatShoes
  module Tmdb
    class GetSomeContent
      def initialize
      end

      def tmdb_request(payload_parameters)
        tmdb_request_response = TmdbIdRequest.new(payload_parameters).call
        tmdb_request_response
      end

      private
    end
  end
end
