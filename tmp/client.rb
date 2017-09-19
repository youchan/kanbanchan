require "drb"
require "drb/websocket/server"

remote = DRbObject.new_with_uri('ws://127.0.0.1:2345')

DRb.start_service('ws://127.0.0.1:2345/callback')

remote.register do |i|
  puts ">>>>>>> #{i}"
end
