module Kanban
  class FusenManager
    def initialize
      @remote = DRb::DRbObject.new(self)
    end

    def collection
      ::Fusen.all.map{|f| Kanban::Fusen.new(@remote, f) }
    end

    def move(id, x, y)
      ::Fusen.find(id).update!(x: x, y: y)
    end
  end
end
