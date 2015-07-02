module Slugifiable

  module ClassMethods

    def find_by_slug(slug)
      unslug = slug.split("-").collect{|word| word.capitalize}.join(" ")
      self.find_by(name: unslug)
    end

  end
  
  module InstanceMethods
    def slug
      self.name.downcase.gsub(" ", "-")
    end
  end
  
  def self.included(receiver)
    receiver.extend         ClassMethods
    receiver.send :include, InstanceMethods
  end
end