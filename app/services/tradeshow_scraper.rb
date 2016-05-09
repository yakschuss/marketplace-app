require 'nokogiri'
require 'mechanize'
require 'open-uri'

class TradeshowScraper
   attr_reader :url

   def initialize(url)
      @url = url
   end

#doc = Nokogiri::HTML(open(url))
url = "http://www.eventsinamerica.com/trade-shows/technology/"

agent = Mechanize.new
agent.get(url)
selected = agent.page.forms.first
selected.ipp = 10000
selected.submit
agent.page.search('.vevent').each do |event|
   event_title = event.at_css('a.url.summary').text
   inner_website_event_link = event.at_css('a.url.summary')[:href]
   attributes = []
   #inner_agent = Mechanize.new
   doc = Nokogiri::HTML(open("http://www.eventsinamerica.com" + inner_website_event_link))
     doc.css('#event-details tr').each do |tr|
        puts tr.css("td").first.text.gsub(/:/,"") + " | " + tr.css("td").last.text

      hash = {

      }

   end

end
end
