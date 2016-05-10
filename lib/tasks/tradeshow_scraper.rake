desc "scrape events in america"
task :scrape_eia => :environment do
require 'nokogiri'
require 'mechanize'
require 'open-uri'
            attribute_check = []
      url = "http://www.eventsinamerica.com/trade-shows"

      agent = Mechanize.new
      inner_agent = Mechanize.new

      agent.get(url)
      inner_agent.get(url)

      agent.page.search('.sub-section li:nth-child(1) a').each do |link|
       inner_agent.page.link_with(href: link[:href]).click

            selected = inner_agent.page.forms.first
            selected.ipp = 10000
            selected.submit




            inner_agent.page.search('.vevent').each do |event|

               event_title = event.at_css('a.url.summary').text
               inner_website_event_link = event.at_css('a.url.summary')[:href]

               tradeshow_hash = {}
               booth_hash = {}

               tradeshow_hash[:title] = event_title

                doc = Nokogiri::HTML(open("http://www.eventsinamerica.com/" + inner_website_event_link))

                       doc.css('#event-details tr').each do |tr|

                          key = tr.css("td").first.text.gsub(/:/,"")
                          value = tr.css("td").last.text.strip
                          case key
                              when "Website"
                                    tradeshow_hash[:website] = value
                              when "Conference/Event Dates"
                                    tradeshow_hash[:conference_event_dates] = value
                              when "Expo/Exhibit Dates"
                                    tradeshow_hash[:expo_exhibit_dates] = value
                              when "Expo/Exhibit Hours"
                                    tradeshow_hash[:expo_exhibit_hours] = value
                              when "Classification"
                                    tradeshow_hash[:classification] = value
                              when "Primary Industry"
                                    tradeshow_hash[:primary_industry] = value
                              when "Other Industries"
                                    tradeshow_hash[:other_industries] = value
                              when "Estimated Attendance"
                                    tradeshow_hash[:estimated_attendance] = value
                              when "Cost to Attend"
                                    tradeshow_hash[:cost_to_attend] = value
                              when "Audience"
                                    tradeshow_hash[:audience] = value
                              when "Notes"
                                    tradeshow_hash[:notes] = value
                              when "Venue"
                                    tradeshow_hash[:venue_name] = value
                                    unless value == "Venue TBD"
                                          venue = Venue.create!(address: value)
                                          tradeshow_hash[:venue_id] = venue.id
                                    end
                              when "Venue Phone"
                                    tradeshow_hash[:venue_phone_number] = value
                              when "Venue Type"
                                    tradeshow_hash[:venue_type] = value
                              when "Official Conference Hotel"
                                    tradeshow_hash[:official_conference_hotel] = value
                              when "Conference Hotel URL"
                                    tradeshow_hash[:conference_hotel_url] = value
                              when "Show Owner"
                                    tradeshow_hash[:show_owner] = value
                              when "Exhibitor Prospectus"
                                    tradeshow_hash[:exhibitor_prospectus] = value
                              when "Sponsorship"
                                    tradeshow_hash[:sponsorship] = value
                              when "Sponsorship Details"
                                    tradeshow_hash[:sponsorship_details] = value
                              when "Conference/Event Hours"
                                    tradeshow_hash[:conference_event_hours] = value
                              when "Number of Exhibitors"
                                    tradeshow_hash[:number_of_exhibitors] = value
                              when "Show Manager"
                                    tradeshow_hash[:show_manager] = value
                              when "Exhibit Floorplan"
                                    tradeshow_hash[:exhibit_floor_plan] = value
                              when "Event Square Footage"
                                    tradeshow_hash[:event_square_footage] = value
                              when "Prospectus PDF"
                                    tradeshow_hash[:prospectus_pdf] = value
                              when "Previous Attendance"
                                    tradeshow_hash[:previous_attendance] = value
                              when "SIC Code(s)"
                                    tradeshow_hash[:sic_code] = value
                              when "NAICS Code(s)"
                                    tradeshow_hash[:naics_code] = value
                              when "First Move-In Date"
                                    tradeshow_hash[:first_move_in_date] = value
                              when "Exhibit Floorplan PDF"
                                    tradeshow_hash[:exhibit_floor_plan_pdf] = value
                              else
                                    next
                        end
                     end
              tradeshow = Tradeshow.create!(tradeshow_hash)

                    doc.css('#event-booth table tr').each do |tr|
                           if tr.css("td").first.text.match(/^[0-9]/)
                              booth_hash[:incomplete_size] = tr.css("td").first.text
                              booth_hash[:cost] = tr.css("td")[1].text
                           else
                                next
                           end
                           booth_hash[:tradeshow_id] = tradeshow.id
                           booth = Booth.create!(booth_hash)
                    end


             end

       inner_agent.get(url)
       end


end
