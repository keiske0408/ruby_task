class Person
  @@records = []
  attr_accessor :name, :national_id, :age

  def initialize (name, national_id, age)
    @name = name
    @national_id = national_id
    @age = age
  end

  def save_instance
    person_record = {
      name: @name,
      national_id: @national_id,
      age: @age
    }
    @@records << person_record
  end

  def self.display_instance
    @@records
  end

  def self.first_instance
    @@records.first
  end

  def self.last_instance
    @@records.last
  end

  def self.find_id
    print "\nSearch a user by national ID or name: "
    input = gets.chomp.downcase

    search = @@records.find do |person|
      person[:national_id].downcase == input || person[:name].downcase == input

    end
    if search
      puts search
      puts "ID found!"
    else
      puts "User not found."
    end
  end
end

# Example usage:
person1 = Person.new("Alice", "id105", 30)
person1.save_instance
person2 = Person.new("Jonathan", "id104", 25)
person2.save_instance
person3 = Person.new("Lopez", "id103", 20)
person3.save_instance

puts Person.find_id


