class Restaurant
  include Mongoid::Document
  field :name, :type => String

  def self.find_by_name name
    find(:first, :conditions => {:name => Regexp.new(name, true)})
  end
end
