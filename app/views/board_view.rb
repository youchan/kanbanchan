module Kanban
  class BoardView
    include Hyalite::Component

    def handleDrop(event)
      (id, x, y) = event.data['fusen'].split(',').map(&:to_i)
      fusen = store[:fusens].find{|f| f.id == id }
      x = fusen.x + event.client.x - x
      y = fusen.y + event.client.y - y
      actions[:move_fusen].call(id, x, y)
    end

    def render
      div({
        class: 'kanban',
        onDragOver: -> (event) { event.prevent_default },
        onDrop: self.method(:handleDrop),
        onClick: -> { actions[:new_fusen].call("test") }
      }) do
        store[:fusens].each_with_index do |fusen, index|
          FusenView.el(index: index, fusen: fusen, actions: actions)
        end
      end
    end
  end
end
