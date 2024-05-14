require 'date'



# Parse the given date strings into Date objects
date1 = Date.strptime('Tue, 29 Aug 2023', '%a, %d %b %Y')
date2 = Date.strptime('Mon, 14 May 2023', '%a, %d %b %Y')

# Compare the dates and print false if date1 is before date2
if date1 < date2
  puts false
else
  puts true
end
