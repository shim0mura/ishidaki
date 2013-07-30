require 'thor'

module Ishidaki
  class CLI < Thor

    desc "http [option] [http://]hostname[port]/path", "benchmark to httpd"
    option :ssh_server, :type => :string, :aliases => "-s", :desc => "ssh server hostname or ip-address"
    option :rate, :type => :numeric, :aliases => "-r", :desc => "creating connection per second" 
    option :connections, :type => :numeric, :aliases => "-c", :desc => "total number of connections to create"
    option :time, :type => :numeric, :aliases => "-t", :desc => "total seconds to create connection"
    option :concurrent, :type => :numeric, :aliases => "-cc", :desc => "concurrent connections to create"
    option :extra_config, :type => :string, :aliases => "-e", :desc => "config file"
    def http
      Ishidaki::Http_client.concurrent_get(["http://www.yahoo.co.jp"], 100) 
    end

  end
end
