require 'opal/drb'

module Kanban
  class AppView
    include Hyalite::Component

    state :store, { fusens: [] }

    after_mount do
      remote = DRb::DRbObject.new_with_uri "ws://127.0.0.1:9292"

      remote.fusen_manager.then do |manager|
        manager.collection.then do |collection|
          store = { fusens: collection }
          update_state(store: store)
        end
      end
    end

    def render
      # このへんは仕組み化したい。いまのところRedux的なactionとstoreで構成している
      actions = {
        move_fusen: -> (id, x, y) {
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
