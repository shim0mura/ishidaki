require "mechanize"

module Ishidaki
  class Scenario

    attr_reader :urls

    def initialize(url)
      # TODO:check valid url
      #@urls = get_assets_urls(url)
      @urls << url
    end

    def get_assets_urls(url)
      # TODO:mechanize
      Http_Client.get(url) do
      end
    end

  end
end
