class Array
  def each_new(arr)
    count = 0
    while count < arr.length
      yield arr[count], count
      count += 1
    end
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add student hash to array
    puts "Country of birth:"
    country = gets.chomp
    puts "Height please, in metres:"
    height = gets.chomp
    puts "And the student's hobbies? Comma separated please"
    hobbies = gets.chomp
    students << {
      name: name,
      cohort: :november,
      country: country,
      height: height,
      hobbies: hobbies,
    }
    puts "Now we have #{students.count} students"
    puts "Next student's name please:"
    name = gets.chomp
  end
  #return array of students
  students
end

def print_header
  puts "The students of Villains Academy".center(70)
  puts "-------------".center(70)
end

def print(students)
  students.each_new(students) do |student, index|
    puts "#{index+1}. #{student[:name]} (#{student[:cohort].capitalize} cohort) \
is from #{student[:country]}, #{student[:height]}m tall and enjoys #{student[:hobbies]}."
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students."
end


students = input_students
print_header
print(students)
print_footer(students)
