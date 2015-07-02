module Checkable
  module ClassMethods
    
  end
  
  module InstanceMethods
    def checked_genre?(genre)
      if self.genres.include?(genre)
        "checked"
      end
    end
  end
  
  def self.included(receiver)
    receiver.extend         ClassMethods
    receiver.send :include, InstanceMethods
  end
end