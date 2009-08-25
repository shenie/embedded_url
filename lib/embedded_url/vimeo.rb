module EmbeddedURL
  
  class Vimeo
    attr_accessor :url
    
    def initialize(url)
      self.url = url
    end
    
    def to_embedded
      if url =~ /vimeo\.com/
        video_id = url.split("/").last
        "<object type=\"application/x-shockwave-flash\" width=\"400\" height=\"300\" data=\"http://vimeo.com/moogaloop.swf?clip_id=#{video_id}&amp;server=vimeo.com&amp;fullscreen=1&amp;show_title=1&amp;show_byline=0&amp;show_portrait=0&amp;color=00ADEF\"><param name=\"quality\" value=\"best\" /><param name=\"allowscriptaccess\" value=\"always\" /><param name=\"allowfullscreen\" value=\"true\" /><param name=\"scale\" value=\"showAll\" /><param name=\"movie\" value=\"http://vimeo.com/moogaloop.swf?clip_id=#{video_id}&amp;server=vimeo.com&amp;fullscreen=1&amp;show_title=1&amp;show_byline=0&amp;show_portrait=0&amp;color=00ADEF\" /><embed src=\"http://www.vimeo.com/moogaloop.swf?clip_id=#{video_id}&amp;server=www.vimeo.com&amp;show_title=1&amp;show_byline=0&amp;show_portrait=0&amp;color=00ADEF&amp;fullscreen=1\" type=\"application/x-shockwave-flash\" allowfullscreen=\"true\" allowscriptaccess=\"always\" width=\"400\" height=\"300\"></embed></object>"      
      end
    end
  end
  
end