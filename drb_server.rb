require 'drb/drb'
require 'drb/websocket/server'
require_relative 'app/models/remote/fusen_manager'
require_relative 'app/models/remote/fusen'

class RemoteManager
  def self.fusen_manager
    @manager ||= Kanban::FusenManager.new
    DRb::DRbObject.new(@manager)
  end
end

DRb.start_service("ws://127.0.0.1:9292", RemoteManager)
#DRb.thread.join
