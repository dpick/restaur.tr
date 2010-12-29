class Section
  include Mongoid::Document
  embeds_many :menu_items
end
