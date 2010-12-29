class Restaurant
  include Mongoid::Document
  field :name, :type => String
  field :owner, :type => String
  field :address, :type => String
  embeds_many :sections

  def self.find_by_name name
    find(:first, :conditions => {:name => Regexp.new(name, true)})
  end

  def owner_name
    return nil if owner == nil or owner == ""
    User.find(owner).name
  end
end
