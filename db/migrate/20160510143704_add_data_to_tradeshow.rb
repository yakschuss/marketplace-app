class AddDataToTradeshow < ActiveRecord::Migration
  def change
    add_column :tradeshows, :website, :string
    add_column :tradeshows, :conference_event_dates, :string
    add_column :tradeshows, :expo_exhibit_dates, :string
    add_column :tradeshows, :expo_exhibit_hours, :string
    add_column :tradeshows, :classification, :string
    add_column :tradeshows, :primary_industry, :string
    add_column :tradeshows, :other_industries, :string
    add_column :tradeshows, :estimated_attendance, :string
    add_column :tradeshows, :cost_to_attend, :string
    add_column :tradeshows, :audience, :string
    add_column :tradeshows, :notes, :string
    add_column :tradeshows, :venue, :string
    add_column :tradeshows, :venue_phone_number, :string
    add_column :tradeshows, :venue_type, :string
    add_column :tradeshows, :official_conference_hotel, :string
    add_column :tradeshows, :conference_hotel_url, :string
    add_column :tradeshows, :show_owner, :string
    add_column :tradeshows, :exhibitor_prospectus, :string
    add_column :tradeshows, :sponsorship, :string
    add_column :tradeshows, :sponsorship_details, :string
    add_column :tradeshows, :conference_event_hours, :string
    add_column :tradeshows, :number_of_exhibitors, :string
    add_column :tradeshows, :show_manager, :string
    add_column :tradeshows, :exhibit_floor_plan, :string
    add_column :tradeshows, :event_square_footage, :string
    add_column :tradeshows, :prospectus_pdf, :string
    add_column :tradeshows, :previous_attendance, :string
    add_column :tradeshows, :sic_code, :string
    add_column :tradeshows, :naics_code, :string
    add_column :tradeshows, :first_move_in_date, :string
    add_column :tradeshows, :exhibit_floor_plan_pdf, :string
  end
end
