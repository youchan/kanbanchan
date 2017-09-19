require 'drb/drb'
require 'drb/websocket/server'
require_relative 'app/models/remote/session'
require_relative 'app/models/remote/fusen'

class RemoteManager
  # def self.fusen_manager
  #   @manager ||= Kanban::FusenManager.new
  #   DRb::DRbObject.new(@manager)
  # end

  def self.start
    @sessions ||= {}
    session = Kanban::Session.new(:default)
    @sessions[session.key] = session
    session
  end
end

DRb.start_service("ws://127.0.0.1:8081", RemoteManager)
#DRb.thread.join
