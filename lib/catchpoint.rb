#!/usr/bin/env ruby

require 'oauth2'
require 'base64'
require 'json'

module OAuth2
  class AccessToken
    # Oauth2 does not base64 encode the token (which Catchpoint wants), so we do it instead:
    def headers
      {'Authorization' => options[:header_format] % Base64.urlsafe_encode64(token)}
    end
  end
end

class Catchpoint
  def initialize opts={}
    @key    = opts["key"] || ENV['CATCHPOINT_KEY']
    @secret = opts["secret"] || ENV['CATCHPOINT_SECRET']
    @token_url = '/ui/api/token'
    @prefix = '/ui/api/v1'
    @host = 'https://io.catchpoint.com'
    @version = 1
    @token = nil
  end

  def fetch_token
    client = OAuth2::Client.new(@key,@secret, site: @host, :token_url => @token_url)
    @token = client.client_credentials.get_token()
  end

  def get endpoint,opts={}
    fetch_token unless @token
    res = @token.get("#{@prefix}#{endpoint}",opts)
    JSON.parse(res.body)
  end

  def post endpoint,opts={}
    fetch_token unless @token
    res = @token.post("#{@prefix}#{endpoint}",opts)
    JSON.parse(res.body)
  end
  def put endpoint,opts={}
    fetch_token unless @token
    res = @token.put("#{@prefix}#{endpoint}",opts)
    JSON.parse(res.body)
  end
  def delete endpoint,opts={}
    fetch_token unless @token
    res = @token.delete("#{@prefix}#{endpoint}",opts)
    JSON.parse(res.body)
  end
end
