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
while true
  puts " "
  puts "select an option: add/delete/exit: "
  option = gets.chomp.to_s.downcase
  case option
  when "delete"
    puts "enter national id: "
    ni = gets.chomp

    index_to_delete = people.find_index { |person| person[:national_id] == ni }

    if index_to_delete.nil?
      puts "ID not found."
    else
      people.delete_at(index_to_delete)
      puts people
      puts "Successfully deleted."
    end

  when "add"
    puts "Add a national ID: "
    national_id = gets.chomp
    puts "Input name: "
    input_name = gets.chomp
    puts "Age: "
    age = gets.chomp.to_i

    hash_insert = { national_id: national_id, name: input_name, age: age }

    if people.any? { |person| person[:national_id] == national_id }
      puts "Failed to add: National ID already exists."
    else
      people.push(hash_insert)
      puts people
      puts "User added successfully."
    end
  when "exit"
    puts "Exiting the program."
    break

  else
    puts "Invalid option. Please select 'add', 'delete', or 'exit'."
  end
end





