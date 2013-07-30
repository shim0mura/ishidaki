require "eventmachine"
require "em-http"

module Ishidaki
  module Http_client

    def self.get(url, header = {})
      EM.run do
        http = EM::HttpRequest.new(url).get :head => header
        http.callback {
          yield http if block_given?
          EM.stop
        }
      end
    end

    def self.concurrent_get(urls, concurrency, header = {})
      EM.kqueue = true
      successes = 0
      failures = 0
      time = Time.now
      EM.run do
        pending = 0
        EM.add_periodic_timer(1) do
          EM::Iterator.new(urls, 100).each do |url,iter|
            http = EM::HttpRequest.new(url, :connect_timeout => 3, :inactivity_timeout => 5).get
            http.callback {
              puts "#{url} - #{http.response_header['SERVER']}"
              successes += 1
              puts "#{successes} request complete..." if success % 500
              pending -= 1
              #iter.next
              EM.stop if successes > 1000
            }

            http.errback {
              puts "#{url}\n - #{http.error}"
              failures += 1
              pending -= 1
              #iter.next
              #EM.stop if pending < 1
            }
            pending += 1
            iter.next
          end
          puts "#{pending} pending. #{successes} successful, #{failures} failures"
        end
      end
    end

  end
end
