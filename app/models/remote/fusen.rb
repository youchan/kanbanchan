module Kanban
  class Fusen
    attr_reader :x, :y, :title, :id

    def initialize(manager, fusen)
      @manager = manager
      @id = fusen.id
      @x = fusen.x
      @y = fusen.y
      @title = fusen.title
    end

    def move(x, y)
      @x = x
      @y = y
      @manager.move(id, x, y)
      @manager.updated(self)
    end
  end
end
