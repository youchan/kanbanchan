module Kanban
  class AppView
    include Hyalite::Component

    state :store, {
      fusens: [
        ::Fusen.new('Fusen1', 100, 100),
        ::Fusen.new('Fusen2' , 150, 150)
      ]
    }

    def render
      actions = {
        move_fusen: Proc.new {|id, x, y|
          @state.store[:fusens][id].move(x, y)
          update_state(store: @state.store)
        }
      }

      store = @state.store

      div(nil) do
        h2(nil, 'Welcome!!!')
        BoardView.el({actions: actions, store: store})
      end
    end
  end
end
