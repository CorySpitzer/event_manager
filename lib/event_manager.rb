require 'csv'
puts "EventManager initialized!"

contents = CSV.open("event_attendees.csv", headers: true, header_converters: :symbol)
contents.each do |row|
    name = row[:first_name]
    zipcode = row[:zipcode]
    # If zipcode is blank, put in 00000
    # else if not 5 digits pad the front with 0's 
    zc_length = zipcode.to_s.length
    unless zc_length == 5
        # add leading 0's until it has 5 digits
        zipcode = '0'*(5-zc_length) + zipcode.to_s
    end
    puts name, zipcode
    #puts '-----------'
end
