module Kanban
  class FusenManager
    def initialize
      @remote = DRb::DRbObject.new self
      @listeners = []
    end

    def add_listener(listener)
      @listeners << listener
    end

    def initial_data
      ::Fusen.all.map{|f| Kanban::Fusen.new(@remote, f) }
    end

    def updated(fusen)
      @listeners.each do |listener|
        listener.updated(fusen)
      end
    end

    def move(id, x, y)
      ::Fusen.find(id).update!(x: x, y: y)
    end

    def create(desc)
      ::Fusen.create!(desc: desc, x: 10, y:10)
    end
  end
end
