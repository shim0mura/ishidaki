require 'eventmachine'
require 'em-http-request'
 
# Reference:
# https://github.com/igrigorik/em-http-request/wiki/Parallel-Requests
# http://rdoc.info/github/eventmachine/eventmachine/master/EventMachine/Iterator
 
 urls = ['http://www.google.com', 'http://www.cloudamqp.com']
 
# always have 100 open request at any given time

# urls = ["http://192.168.100.115:8080"]*10 #using this as an example
# EventMachine.run do
#   EM.add_periodic_timer(1) do
#     puts "sssssss"
#     i = 0
#   EM::Iterator.new(urls, 1).map(proc { |url, iter|
#     res = EventMachine::HttpRequest.new(url).get
#     res.callback {
#       i += 1
#       puts "#{i} #{res.req.uri} #{res.response_header.status}"
#     }
#     res.errback{
#       puts "Err => #{res.req.uri} #{res.response_header.status}"
#     }}, proc { |responses|
#     all = responses.flatten
#     puts 'all done!'
#     EM.stop
#   })
#   end
# end


EM.run{ EM.system('top'){ |output,status| puts output if status.exitstatus == 0 } }


