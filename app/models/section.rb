class Section
  include Mongoid::Document
  embedded_in :restaurant, :inverse_of => :sections
  field :name, :type => String

  embeds_many :menuitems
end
