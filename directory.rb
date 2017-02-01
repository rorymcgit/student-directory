@students = []

class Array
  def each_new(arr)
    count = 0
    while count < arr.length
      yield arr[count], count
      count += 1
    end
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit
  else
    puts "I don't know what you mean, try again"
  end
end

def input_students
  puts "Please enter details of the students."
  puts "To finish, just hit return twice"
  # get the first name
  puts "Student name:"
  name = STDIN.gets.chomp
  index = 0
  # while the name is not empty, repeat this code
  while !name.empty? do
    puts "Cohort month:"
    cohort = STDIN.gets.chomp
    cohort_months = [:january, :february, :march, :april, :may, :june, :july,
                    :august, :september, :october, :december]
    # require valid cohort month
    while !cohort_months.include? cohort.downcase.to_sym do
      puts "Please re-enter cohort:"
      cohort = STDIN.gets.chomp
    end
    puts "Country of birth:"
    country = STDIN.gets.chomp
    puts "Height (metres):"
    height = STDIN.gets.chomp
    puts "And the student's hobbies? Comma separated please:"
    hobbies = STDIN.gets.chomp
    @students << {
    name: name,
    country: country,
    height: height,
    hobbies: hobbies,
    cohort: cohort,
    }
    puts "Now we have #{@students.count} students"
    puts "Next student's name please:"
    name = STDIN.gets.chomp
    index += 1
  end
  puts "...end of user input.".rjust(100)
  #return array of students
end

def show_students
  print_header
  print_students_list
  print_footer
end

def save_students
  # open file for writing
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:country],
                    student[:height], student[:hobbies]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def try_load_students
  filename = ARGV.first # first argument from command line
  return if filename.nil? # exits this method if no filename given
  if File.exist?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exit."
    exit
  end
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort, country, height, hobbies = line.chomp.split(',')
      @students << {
        name: name,
        cohort: cohort.to_sym,
        country: country,
        height: height,
        hobbies: hobbies
      }
  end
  file.close
end

def print_header
  puts "The students of Villains Academy".center(100)
  puts "-------------".center(100)
end

def print_students_list
  cohorts = @students.map { |student| student[:cohort] }
  cou = 0
  while cou < cohorts.length
    puts cohorts[cou].to_s.capitalize + " students:"
    puts "\tName: #{@students[cou][:name]}"
    puts "\tCountry: #{@students[cou][:country]}"
    puts "\tHeight: #{@students[cou][:height]}"
    puts "\tHobbies: #{@students[cou][:hobbies]}"
    cou +=1
  end
end

def print_footer
  if @students.count > 1
    puts "Overall, we have #{@students.count} great students."
  elsif @students.count == 1
    puts "Overall, we have just the #{@students.count} great student."
  else
    puts "No students at the academy"
  end
end

try_load_students
interactive_menu
