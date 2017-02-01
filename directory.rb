class Array
  def each_new(arr)
    count = 0
    while count < arr.length
      yield arr[count], count
      count += 1
    end
  end
end

def interactive_menu
  students = []
  loop do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    selection = gets.chomp
    case selection
    when "1"
      students = input_students
    when "2"
      print_header
      print_details(students)
      print_footer(students)
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
    end
  end
end


def input_students
  puts "Please enter details of the students."
  puts "To finish, just hit return twice"
  students = []
  # get the first name
  puts "Student name:"
  name = gets.gsub(/ *\n+/, "")
  index = 0
  # while the name is not empty, repeat this code
  while !name.empty? do
    puts "Cohort month:"
    cohort = gets.gsub(/ *\n+/, "")
    cohort_months = [:january, :february, :march, :april, :may, :june, :july,
                    :august, :september, :october, :december]
    # require valid cohort month
    while !cohort_months.include? cohort.downcase.to_sym do
      puts "Please re-enter cohort:"
      cohort = gets.gsub(/ *\n+/, "")
    end
    puts "Country of birth:"
    country = gets.gsub(/ *\n+/, "")
    puts "Height (metres):"
    height = gets.gsub(/ *\n+/, "")
    puts "And the student's hobbies? Comma separated please:"
    hobbies = gets.gsub(/ *\n+/, "")
    students << {
    name: name,
    country: country,
    height: height,
    hobbies: hobbies,
    cohort: cohort,
    }
    puts "Now we have #{students.count} students"
    puts "Next student's name please:"
    name = gets.gsub(/ *\n+/, "")
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
  if names.count > 1
    puts "Overall, we have #{names.count} great students."
  else names.count == 1
    puts "Overall, we have just the #{names.count} great student."
  end
end


interactive_menu
if students.length > 0
  print_header
  print_details(students)
  print_footer(students)
else
  puts "No students at the academy"
end
