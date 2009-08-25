require "embedded_url"

ActiveRecord::Base.class_eval do
  include EmbeddedURL
end