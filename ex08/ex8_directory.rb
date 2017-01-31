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
  puts "Please enter details of the students."
  puts "To finish, just hit return twice"
  students = []
  # get the first name
  puts "Student name:"
  name = gets.chomp
  index = 0
  # while the name is not empty, repeat this code
  while !name.empty? do
    puts "Cohort month:"
    cohort = gets.chomp
    while cohort.empty? do
      puts "Please re-enter cohort:"
      cohort = gets.chomp
     end
    puts "Country of birth:"
    country = gets.chomp
    puts "Height (metres):"
    height = gets.chomp
    puts "And the student's hobbies? Comma separated please:"
    hobbies = gets.chomp
    students << {
    name: name,
    country: country,
    height: height,
    hobbies: hobbies,
    }
    # add student hash to array
    if cohort.downcase.include?("no") || cohort.downcase.include?("v")
      students[index][:cohort] = :november
    elsif cohort.downcase.include?("d") || cohort.downcase.include?("ec")
      students[index][:cohort] = :december
    elsif cohort.downcase.include?("j") && cohort.downcase.include?("a")
      students[index][:cohort] = :january
    elsif cohort.downcase.include?("f")
      students[index][:cohort] = :february
    elsif cohort.downcase.include?("c") && cohort.downcase.include?("h")
      students[index][:cohort] = :march
    elsif cohort.downcase.include?("ap") && cohort.downcase.include?("r")
      students[index][:cohort] = :april
    elsif cohort.downcase.include?("m") && cohort.downcase.include?("y")
      students[index][:cohort] = :may
    elsif cohort.downcase.include?("j") && cohort.downcase.include?("u") &&
    cohort.downcase.include?("e")
      students[index][:cohort] = :june
    elsif cohort.downcase.include?("j") && cohort.downcase.include?("l")
      students[index][:cohort] = :july
    elsif cohort.downcase.include?("a") && cohort.downcase.include?("g")
      students[index][:cohort] = :august
    elsif cohort.downcase.include?("s") || cohort.downcase.include?("pt")
      students[index][:cohort] = :september
    elsif cohort.downcase.include?("o") && cohort.downcase.include?("t")
      students[index][:cohort] = :october
    else
      students[index][:cohort] = cohort.to_sym
    end
    puts "Now we have #{students.count} students"
    puts "Next student's name please:"
    name = gets.chomp
    index += 1
  end
  puts "...end of user input.".rjust(100)
  #return array of students
  students
end

def print_header
  puts "The students of Villains Academy".center(100)
  puts "-------------".center(100)
end

def print_details(students)
  cohorts = students.map { |student| student[:cohort] }
  cou = 0
  while cou < cohorts.length
    puts cohorts[cou].to_s.capitalize + " students:"
    puts "\tName: #{students[cou][:name]}"
    puts "\tCountry: #{students[cou][:country]}"
    puts "\tHeight: #{students[cou][:height]}"
    puts "\tHobbies: #{students[cou][:hobbies]}"
    cou +=1
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students."
end


students = input_students
print_header
print_details(students)
print_footer(students)
