require 'rubygems'
require 'httparty'

require File.join(File.dirname(__FILE__), 'embedded_url/gist')
require File.join(File.dirname(__FILE__), 'embedded_url/slideshare')
require File.join(File.dirname(__FILE__), 'embedded_url/youtube')
require File.join(File.dirname(__FILE__), 'embedded_url/vimeo')

EmbeddedURL::SlideShare.configure do |config|
  config.api_key = 'JmLgvuBr'
  config.shared_secret = '3azbdDAi'
end

# p EmbeddedURL::SlideShare.embedded('http://www.slideshare.net/MackCollier/what-rockstars-can-teach-you-about-kicking-ass-with-social-media')

print EmbeddedURL::Gist.new('http://gist.github.com/173149').to_embedded

print EmbeddedURL::Youtube.new('http://www.youtube.com/watch?v=bZvSD1O86M8').to_embedded

print EmbeddedURL::Vimeo.new('http://vimeo.com/2927154').to_embedded

