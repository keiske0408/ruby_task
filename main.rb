class Person
  @@records = []
  attr_accessor :name, :national_id, :age

  def save
    @@records << self
  end

  def self.all
    return @@records
  end

  def self.first(num = nil)
    return @@records.first(num) if num
    @@records.first
  end

  def self.last_instance
    @@records.last
  end

  def self.destroy
    @@records.delete(self)
  end

  def self.find_id(national_id)
    @@records.find { |person| person.national_id == national_id }
  end

  def self.find_name(name)
    @@records.find { |person| person.name == name }
  end

  def details
     "National ID: #{@national_id}, Name: #{@name}, Age: #{@age}"
  end

  def self.first_five
    first(5).each do |person|
      p person.details
    end
  end

  def self.destroy
    @@records.clear
  end
end


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
]
people.each do|person|
  new_person = Person.new
  new_person.national_id = person[:national_id]
  new_person.name = person[:name]
  new_person.age = person[:age]
  new_person.save
end

puts "List of Person"
Person.first_five


def delete_person(people)
  print "enter national id: "
  person = Person.find_id(gets.chomp.downcase)

  if person
    person.destroy
    puts "Successfully deleted."
    Person.first_five
  else
    "ID not found"
  end
end

def add_person(people)
  new_person = Person.new
  print "Add a national ID: "
  new_person.national_id = gets.chomp
  print "Input name: "
  new_person.name = gets.chomp
  print "Age: "
  new_person.age = gets.chomp.to_i


  if Person
    puts "Failed to add: National ID already exists."
  else
    puts "User added successfully."
    new_person.save
    Person.first_five
  end
end

def search_person(people)
  print "\nSearch a user by national ID or name: "
  input = gets.chomp
  person =  Person.find_name(input) || Person.find_id(input)

  if person
    puts person.details + " user found!"
  else
    puts "User not found."
  end
end

def edit_person(people)
  print "Enter national ID to edit: "
  person = Person.find_id(gets.chomp)

  if person
    person_index = Person.all.find_index(person)
    print "Editing user: #{person}"
    print "Enter new name:"
    person.name = gets.chomp
    print "Enter new age: "
    person.age = gets.chomp.to_i

    # Update the person's details if new values are provided
    # person[:name] = new_name unless new_name.empty?
    # person[:age] = new_age.to_i unless new_age.empty?
    #
    # puts people
    Person.all[person_index] = person
    Person.first_five
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
  when "edit"
    edit_person(people)
  when "exit"
    exit_program
  else
    puts "Invalid option. Please select 'add', 'delete', or 'exit'.,'edit','search'"
  end
end