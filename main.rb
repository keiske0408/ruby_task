people = [
  { national_id: 'ID001', name: 'Alice Johnson', age: 30 },
  { national_id: 'ID002', name: 'Bob Smith', age: 45 },
  { national_id: 'ID003', name: 'Carol White', age: 28 },
  { national_id: 'ID004', name: 'David Brown', age: 34 },
  { national_id: 'ID005', name: 'Eva Green', age: 29 },
]

people.each do |person|
  puts person
end

def delete_person(people)
  print "enter national id: "
  ni = gets.chomp

  index_to_delete = people.find_index { |person| person[:national_id] == ni }

  if index_to_delete.nil?
    puts "ID not found."
  else
    people.delete_at(index_to_delete)
    puts people
    puts "Successfully deleted."
  end
end

def add_person(people)
  print "Add a national ID: "
  national_id = gets.chomp
  print "Input name: "
  input_name = gets.chomp
  print "Age: "
  age = gets.chomp.to_i

  hash_insert = { national_id: national_id, name: input_name, age: age }

  if people.any? { |person| person[:national_id] == national_id }
    puts "Failed to add: National ID already exists."
  else
    people.unshift(hash_insert)
    puts people
    puts "User added successfully."
  end
end

def search_person(people)
  print "\nSearch a user by national ID or name: "
  input = gets.chomp.downcase

  search = people.find do |person|
    person[:national_id].downcase == input || person[:name].downcase == input

  end
  if search
    puts search
  else
    puts "User not found."
  end
end

def edit_person(people)
  print "Enter national ID to edit: "
  national_id = gets.chomp

  person = people.find { |person| person[:national_id] == national_id }

  if person
    print "Editing user: #{person}"
    print "Enter new name (leave blank to keep '#{person[:name]}'): "
    new_name = gets.chomp
    print "Enter new age (leave blank to keep '#{person[:age]}'): "
    new_age = gets.chomp

    # Update the person's details if new values are provided
    person[:name] = new_name unless new_name.empty?
    person[:age] = new_age.to_i unless new_age.empty?

    puts people
    puts "User updated successfully."
  else
    puts "ID not found."
  end
end

def exit_program
  puts "Exiting the program."
  print "Are you sure you want to exit (y/n)?"
  answer = gets.chomp.downcase
  if answer == "y"
    puts "Exiting now..."
    exit
  else
    puts "Continuing..."
  end
end

while true
  puts " "
  print "select an option: add/delete/exit/search/edit: "
  option = gets.chomp.to_s.downcase

  case option

  when "add"
    add_person(people)
  when "delete"
    delete_person(people)
  when "search"
    search_person(people)
  when "exit"
    exit_program
  else
    puts "Invalid option. Please select 'add', 'delete', or 'exit'.,'edit','search'"
  end
end
