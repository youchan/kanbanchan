require_relative './fusen_manager'

module Kanban
  class Session
    attr_reader :manager, :key

    def initialize(key)
      @manager = Kanban::Session.manager(key)
      @key = "test"
    end

    def marshal_dump
      [@key, DRb::DRbObject.new(@manager)]
    end
    
    def marshal_load(obj)
      @key = obj[0]
      @manager = obj[1]
    end

    def self.manager(key)
      @managers ||= {}
      unless @managers.has_key?(key)
        @managers[key] = Kanban::FusenManager.new
      end

      @managers[key]
    end
  end
end
