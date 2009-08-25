require "digest/sha1"

module EmbeddedURL
  
  class SlideShare
    include HTTParty
    base_uri 'http://www.slideshare.net/api/2'
    format :xml

    def self.configure
      yield self
    end
    
    def self.api_key=(key)
      default_params :api_key => key
    end
    
    def self.shared_secret=(secret)
      @@shared_secret = secret
    end
    
    def self.embedded(url)
      now = Time.now.to_i.to_s
      hashed = Digest::SHA1.hexdigest("#{@@shared_secret}#{now}")
      result = get('/get_slideshow', :query => {:ts => now, :hash => hashed, :slideshow_url => url})
      result['Slideshow']['Embed']
    end
    
  end
end