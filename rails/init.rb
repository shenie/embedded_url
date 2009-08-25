require "embedded_url"

module EmbeddedUrl
  def self.included(base)
    base.extend(ClassMethods)
  end
  
  module ClassMethods

    def embedded_url(field)
      
      define_method("embedded_#{field}") do

        link = send(field)
        
        begin
          Gist.new(link).to_embedded || Youtube.new(link).to_embedded || Vimeo.new(link).to_embedded || 
            SlideShare.new(link).to_embedded ||
        rescue
        end
        
      end
      
    end

  end
end

ActiveRecord::Base.class_eval do
  include EmbeddedURL
end