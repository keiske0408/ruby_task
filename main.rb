people = [
  { national_id: 'ID001', name: 'Alice Johnson', age: 30 },
  { national_id: 'ID002', name: 'Bob Smith', age: 45 },
  { national_id: 'ID003', name: 'Carol White', age: 28 },
  { national_id: 'ID004', name: 'David Brown', age: 34 },
  { national_id: 'ID005', name: 'Eva Green', age: 29 },
  { national_id: 'ID006', name: 'Frank Adams', age: 52 },
  { national_id: 'ID007', name: 'Grace Lee', age: 41 },
  { national_id: 'ID008', name: 'Hank Wilson', age: 38 },
  { national_id: 'ID009', name: 'Ivy Clark', age: 27 },
  { national_id: 'ID010', name: 'Jack Martinez', age: 33 },
  { national_id: 'ID011', name: 'Karen Taylor', age: 26 },
  { national_id: 'ID012', name: 'Larry Anderson', age: 47 },
  { national_id: 'ID013', name: 'Mona Scott', age: 36 },
  { national_id: 'ID014', name: 'Nate King', age: 50 },
  { national_id: 'ID015', name: 'Olivia Harris', age: 31 },
  { national_id: 'ID016', name: 'Paul Turner', age: 42 },
  { national_id: 'ID017', name: 'Quinn Nelson', age: 55 },
  { national_id: 'ID018', name: 'Rachel Walker', age: 40 },
  { national_id: 'ID019', name: 'Sam Robinson', age: 29 },
  { national_id: 'ID020', name: 'Tina Young', age: 60 }
]

people.each do |person|
  puts person
end

puts "\nSearch a user by national ID or name: "
input = gets.chomp.downcase

search = people.find do |person|
  person[:national_id].downcase == input || person[:name].downcase == input
end

if search
  puts search
else
  puts "User not found."
end
