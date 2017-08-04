require_relative './fusen_meta'

class Fusen < Menilite::Model
  field :title, :string
  field :description, :string
  field :meta, :reference, class: ::FusenMeta
end
