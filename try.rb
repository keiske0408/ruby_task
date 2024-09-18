class Person
  @@records = []
  attr_accessor :name, :national_id, :age

  def save
    @@records << self
  end

  def self.all
    @@records
  end

  def self.first(num = nil)
    return @@records.first(num) if num
    @@records.first
  end

  def self.first_five
    first(5).each do |person|
      person.details
    end
  end

  def self.last_instance
    @@records.last
  end

  def self.destroy(person)
    @@records.delete(person)
  end

  def self.find_id(national_id)
    @@records.find { |person| person.national_id == national_id }
  end

  def self.find_name(name)
    @@records.find { |person| person.name == name }
  end

  def details
    puts "National ID: #{@national_id}, Name: #{@name}, Age: #{@age}"
  end
end

# Populate initial records
people_data = [
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

people_data.each do |person_data|
  person = Person.new
  person.national_id = person_data[:national_id]
  person.name = person_data[:name]
  person.age = person_data[:age]
  person.save
end

puts "List of Persons"
Person.first_five