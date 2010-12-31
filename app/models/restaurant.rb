class Restaurant
  include Mongoid::Document

  field :name, :type => String
  field :address, :type => String
  field :phone_num, :type => String
  field :about, :type => String

  embeds_many :sections
  references_one :owner, :class_name => "User"

  def self.find_by_name name
    find(:first, :conditions => {:name => Regexp.new(name, true)})
  end

  def owner_name
    return nil if owner == nil
    owner.name
  end
end
