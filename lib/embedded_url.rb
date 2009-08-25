require 'rubygems'
require 'httparty'

require File.join(File.dirname(__FILE__), 'embedded_url/gist')
require File.join(File.dirname(__FILE__), 'embedded_url/slideshare')
require File.join(File.dirname(__FILE__), 'embedded_url/youtube')
require File.join(File.dirname(__FILE__), 'embedded_url/vimeo')

module EmbeddedURL
  def self.included(base)
    base.extend(ClassMethods)
  end
  
  module ClassMethods

    def with_embedded(field)
      
      define_method("embedded_#{field}") do

        link = send(field)
        
        begin
          Gist.new(link).to_embedded || 
            Youtube.new(link).to_embedded || 
            Vimeo.new(link).to_embedded || 
            SlideShare.new(link).to_embedded ||
            (link =~ /^http/ ? link : "http://#{link}")
        rescue
        end
        
      end
      
    end

  end
end
