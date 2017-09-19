require 'opal/drb'
require_relative '../models/remote/session'

module Kanban
  class AppView
    include Hyalite::Component

    state :store, { fusens: [] }

    after_mount do
      remote = DRb::DRbObject.new_with_uri "ws://127.0.0.1:8081"
      DRb.start_service "ws://127.0.0.1:8081/callback"

      begin
        remote.start.then do |session|
          @session = session
          session.manager.add_listener(DRb::DRbObject.new(self))
          session.manager.initial_data.then do |collection|
            store = { fusens: collection }
            update_state(store: store)
          end
        end
      rescue Exception => e
        puts ">> Exception"
        pp e
      end
    end

    def updated(fusen)
      current = @state.store[:fusens].find {|f| f.id == fusen.id }
      if current.x != fusen.x || current.y != fusen.y
        move_fusen(fusen.id, fusen.x, fusen.y)
      end
    end

    def move_fusen(id, x, y)
      @state.store[:fusens].find {|f| f.id == id }.move(x, y)
      update_state(store: @state.store)
    end

    def new_fusen(desc)
      @manager.new_fusen
    end

    def render
      # このへんは仕組み化したい。いまのところRedux的なactionとstoreで構成している
      actions = {
        move_fusen: self.method(:move_fusen),
        new_fusen: self.method(:new_fusen)
      }

      store = @state.store

      div(nil) do
        h2(nil, 'Kanban-chan')
        BoardView.el({actions: actions, store: store})
      end
    end
  end
end
