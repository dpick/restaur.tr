class Section
  include Mongoid::Document
  field :name, :type => String

  embeds_many :menuitems
end
