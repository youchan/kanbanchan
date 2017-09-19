require "drb"
require "drb/websocket/server"

class Remote
  def register(&block)
    puts ">>>>>> registered"
    p block
    10.times do |i|
      print "#{i} "
      yield i
      sleep(1)
    end
    puts
  end
end

DRb::WebSocket::RackApp.config.callback_url = 'ws://127.0.0.1:2345/callback'

DRb.start_service('ws://127.0.0.1:2345', Remote.new)
puts ">>>>>>>>>>>>>>>>>>>"
p Thread.current
DRb.thread.join
