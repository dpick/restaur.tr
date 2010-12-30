class Section
  include Mongoid::Document
  field :name, :type => String

  embeds_many :menu_items
end
