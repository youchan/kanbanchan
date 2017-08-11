module Kanban
  class FusenManager
    def initialize
      @collection = [
        Kanban::Fusen.new('Fusen1', 100, 100),
        Kanban::Fusen.new('Fusen2' , 150, 150)
      ]
    end

    def collection
      @collection
    end
  end
end
