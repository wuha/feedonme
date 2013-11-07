require 'nokogiri'
require 'open-uri'
require 'net/http'
require 'uri'
require 'set'

module FeedsHelper

	def discover_feeds(url_input)	
		if url_input.last == "/"		
			else
				url_input+="/"
			end
	
			if url_input.first(4) == "http"		
			else
				url_input="http://"+url_input
			end
	
			begin
				url = URI.parse(url_input)
				req = Net::HTTP.new(url.host, url.port)
				res = req.request_head(url.path)
				
				if res.code=="200" or res.code=="301"
					@feed_list=Array.new
					page=Nokogiri::HTML(open(url))
						
					page.css('link[type*=rss]').each do |link|
						if link.attribute("href").to_str.first=="/"
							@feed_list<< [url_input[0..-2]+link.attribute("href").to_str, link.attribute("title").to_str]
						else
							@feed_list<< [link.attribute("href").to_str, link.attribute("title").to_str]
						end
							
					end
					
					
				end
			
			rescue
				@feed_list=nil
			end			
			@feed_list				
	end

end
