module Slugifiable

  module ClassMethods
    include Titleize
    Titleize::SMALL_WORDS << "with"

    def find_by_slug(slug)
      unslug = slug.split("-").join(" ").titleize
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