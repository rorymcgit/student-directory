require 'CSV'

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
  puts "\n1. Input the students"
  puts "2. Show the students"
  puts "3. Save the directory to csv"
  puts "4. Load existing directory"
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
    puts "You have selected '1: INPUT'"
    input_students
  when "2"
    puts "You have selected '2: SHOW STUDENTS'"
    show_students
  when "3"
    puts "You have selected '3: SAVE TO CSV'"
    save_students
  when "4"
    puts "You have selected '4: LOAD FROM CSV'"
    custom_load
  when "9"
    puts "You have selected '9: EXIT PROGRAM'"
    puts "Goodbye!"
    exit
  else
    puts "I don't know what you mean, try again:"
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
    cohort = STDIN.gets.chomp.downcase
    cohort_months = [:january, :february, :march, :april, :may, :june, :july,
                    :august, :september, :october, :november, :december]
    # require valid cohort month
    while !cohort_months.include? cohort.to_sym do
      puts "Please re-enter cohort:"
      cohort = STDIN.gets.chomp
    end
    puts "Country of birth:"
    country = STDIN.gets.chomp
    puts "Height (metres):"
    height = STDIN.gets.chomp
    puts "And the student's favourite hobby?"
    hobbies = STDIN.gets.chomp
    push_to_array(name, cohort, country, height, hobbies)
    puts "Now we have #{@students.count} student#{plural}."
    puts "Next student's name please:"
    name = STDIN.gets.chomp
    index += 1
  end
  puts "...end of user input.".rjust(100)
end

def push_to_array(name, cohort, country, height, hobbies)
  @students << {
  name: name,
  cohort: cohort.to_sym,
  country: country,
  height: height,
  hobbies: hobbies,
  }
end

def try_load_students
  filename = ARGV.first || "students.csv"
  load_students(filename)
end

def custom_load
  puts "Please enter filename to load..."
  load_name = STDIN.gets.chomp
  load_students(load_name)
end

def load_students(filename = "students.csv")
  if File.exists?(filename)
    File.open(filename, "r") do |file|
      count = 0
      file.readlines.each do |line|
        name, cohort, country, height, hobbies = line.chomp.split(',')
        push_to_array(name, cohort, country, height, hobbies)
        count += 1
      end
    puts "#{count} students loaded from #{filename}"
  end
  else
    puts "no file found"
    interactive_menu
  end
end

def show_students
  print_header
  print_students_list
  print_footer
end

def save_students
  puts "Save as..."
  save_name = STDIN.gets.chomp
  # open file for writing
  File.open(save_name, "w") do |file|
  @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:country],
                    student[:height], student[:hobbies]]
    csv_line = student_data.join(",")
    file.puts csv_line
    end
  end
  puts "Successfully saved to #{save_name}"
end

def print_header
  if @students.length > 0
    puts "The students of Villains Academy".center(100)
    puts "-------------".center(100)
  end
end

def print_students_list
  cohort_list = @students.group_by{|student| student[:cohort]}
  cohort_list.keys.each do |key|
    puts "#{key.capitalize} student#{plural(cohort_list[key].count)}:"
    cohort_list[key].each do |student|
      puts "\tName: #{student[:name]}"
      puts "\tCountry: #{student[:country]}"
      puts "\tHeight: #{student[:height]}m"
      puts "\tHobbies: #{student[:hobbies]}\n\n"
    end
  end
end

def plural(count = @students.count)
  count > 1 ? "s" : ""
end

def print_footer
  if @students.count > 0
    puts "Overall, we have #{@students.count} great student#{plural}."
  else
    puts "\nNo students at the academy"
  end
end

try_load_students
interactive_menu
