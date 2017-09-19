class FusenActions
  include Action

  action :move_fusen do |id, x, y|
    @state.store[:fusens][id].move(x, y)
    update_state(store: @state.store)
  end
end
