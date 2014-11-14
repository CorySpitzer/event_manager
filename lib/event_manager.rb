require 'csv'
puts "EventManager initialized!"

contents = CSV.open("event_attendees.csv", headers: true, header_converters: :symbol)
contents.each do |row|
    name = row[:first_name]
    zipcode = row[:zipcode].to_s
    # If zipcode is blank, put in 00000
    # else if not 5 digits pad the front with 0's 
    zc_length = zipcode.length
    if zipcode.nil?
        zipcode = '0'*5
    elsif zc_length > 5
        # Truncate it to first 5 digits
        zipcode = zipcode[0..4]
    elsif zc_length < 5
        # add leading 0's until it has 5 digits
        zipcode = zipcode.rjust(5, '0') # this fails for empty zip: nil
        #zipcode = '0'*(5-zc_length) + zipcode
    end
    puts name, zipcode
    #puts '-----------'
end
