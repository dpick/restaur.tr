class Menuitem
  include Mongoid::Document
  embedded_in :section, :inverse_of => :menuitems

  field :name, :type => String
  field :price, :type => Float
  field :description, :type => String
end
