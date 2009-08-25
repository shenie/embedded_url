module EmbeddedURL
  
  class Gist
    attr_accessor :url
    
    def initialize(url)
      self.url = url
    end
    
    def to_embedded
      if url =~ /gist\.github\.com/
        '<script src="' + url + '.js"></script>'
      end
    end
  end
  
end