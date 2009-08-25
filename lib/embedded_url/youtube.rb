module EmbeddedURL
  
  class Youtube
    attr_accessor :url
    
    def initialize(url)
      self.url = url
    end
    
    def to_embedded
      if url =~ /youtube\.com/
        video_id = url.split("v=").last
        "<object width=\"400\" height=\"325\"><param name=\"movie\" value=\"http://www.youtube.com/v/#{video_id}\"></param><param name=\"allowFullScreen\" value=\"true\"></param><embed src=\"http://www.youtube.com/v/#{video_id}\" type=\"application/x-shockwave-flash\" allowfullscreen=\"true\" width=\"400\" height=\"325\"></embed></object>"
      end
      
    end
  end
  
end