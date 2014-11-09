puts "EventManager initialized!"

path = "/home/coriander/code/event_manager/event_attendees.csv"
lines = File.readlines(path)
lines.each do |line|
    puts line
end
