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
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  #return array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each_with_index do |student, index|
    if student[:name][0].start_with?("D")
      puts "#{index+1}. #{student[:name]} (#{student[:cohort].capitalize} cohort)"
    end
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students."
end


students = input_students
print_header
print(students)
print_footer(students)
