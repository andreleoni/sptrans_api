# require 'rest-client'
require 'httparty'
require 'json'
#
require 'sptrans_api/version'

module SptransApi
  class Call
    include HTTParty
    base_uri 'http://api.olhovivo.sptrans.com.br/v0'

    attr_accessor :token, :access_uri

    def initialize(token)
      self.token = token
      self.access_uri = 'http://api.olhovivo.sptrans.com.br/v0'

      @status = self.authenticate_with_api
    end

    def authenticate_with_api
      self.class.post("#{self.access_uri}/Login/Autenticar?token=#{self.token}")
    end

    def to_search_lines(search_terms)
      result = self.class.get("#{self.access_uri}/Linha/Buscar?termosBusca=#{search_terms}")

      raise result.inspect
    end

    def stop_search(search_terms)
      result = self.class.get("#{self.access_uri}/Parada/Buscar?termosBusca=#{search_terms}")

      raise result.inspect
    end
  end
end
