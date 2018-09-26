require('pry')
require_relative('../models/student')
require_relative('../models/house')

Student.delete_all
House.delete_all

house1 = House.new({
  "name" => "Gryffindor",
  "logo" => "lion"
  })

house2 = House.new({
  "name" => "Slytherin",
  "logo" => "snake"
  })

house3 = House.new({
  "name" => "Hufflepuff",
  "logo" => "pig"
  })

house4 = House.new({
  "name" => "Ravenclaw",
  "logo" => "bird"
  })

house1.save()
house2.save()
house3.save()
house4.save()

student1 = Student.new({
  "first_name" => "Harry",
  "last_name" => "Potter",
  "house_id" => house1.id,
  "age" => 14
  })

student2 = Student.new({
    "first_name" => "Ron",
    "last_name" => "Weasley",
    "house_id" => house1.id,
    "age" => 15
    })

student1.save()
student2.save()

tst = Student.find(1)

binding.pry
nil
