class Menu
  include Mongoid::Document
  embeds_many :menuitems
end
