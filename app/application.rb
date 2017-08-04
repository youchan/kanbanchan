require 'opal'
require 'native'
require 'opal/drb'
require 'hyalite'
#require 'menilite'
require_relative 'models/remote/fusen'
require_relative 'views/kanban'

Hyalite.render(Hyalite.create_element(Kanban::AppView), $document['.content'])

