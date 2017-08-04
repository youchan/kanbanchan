module Kanban
  class BoardView
    include Hyalite::Component

    def handleDrop(event)
      (id, x, y) = event.data['fusen'].split(',').map(&:to_i)
      x = store[:fusens][id].x + event.client.x - x
      y = store[:fusens][id].y + event.client.y - y
      actions[:move_fusen].call(id, x, y)
    end

    def render
      div({
        class: 'kanban',
        onDragOver: -> (event) { event.prevent_default },
        onDrop: self.method(:handleDrop)
      }) do
        store[:fusens].each_with_index do |fusen, index|
          FusenView.el(index: index, fusen: fusen, actions: actions)
        end
      end
    end
  end
end
