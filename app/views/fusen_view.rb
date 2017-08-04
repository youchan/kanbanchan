module Kanban
  class FusenView
    include Hyalite::Component

    def render
      div({
        class: 'fusen',
        draggable: 'true',
        onClick: -> (event) { puts "## shift: #{event.shift_key}" },
        onDragStart: -> (event) { event.data['fusen'] = "#{index},#{event.client.x},#{event.client.y}" },
        onDragEnd: -> (event) {  },
        style: { top: "#{fusen.y}px", left: "#{fusen.x}px" }
      }, fusen.title)
    end
  end
end
