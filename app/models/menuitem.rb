class Menuitem
  include Mongoid::Document

  field :name, :type => String
  field :price, :type => Float
  field :description, :type => String
end
