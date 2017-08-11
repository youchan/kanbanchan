require 'opal'
require 'native'
require 'opal/drb'
require 'hyalite'
require_relative 'models/remote/fusen'
require_relative 'models/remote/fusen_manager'
require_relative 'views/kanban'

Hyalite.render(Hyalite.create_element(Kanban::AppView), $document['.content'])

