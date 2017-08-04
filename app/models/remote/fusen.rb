class Fusen
  attr_accessor :title, :x, :y

  def initialize(title, x, y)
    @title = title
    @x = x
    @y = y
  end

  def move(x, y)
    @x = x
    @y = y
  end
end
