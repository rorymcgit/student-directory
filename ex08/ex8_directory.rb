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
  # while the name is not empty, repeat this code
  while !name.empty? do
    puts "Cohort month (November used as default if not entered):"
    cohort = gets.chomp
    puts "Country of birth:"
    country = gets.chomp
    puts "Height (metres):"
    height = gets.chomp
    puts "And the student's hobbies? Comma separated please:"
    hobbies = gets.chomp
    # add student hash to array
    if cohort.empty? || cohort.downcase.include?("no") || cohort.downcase.include?("v")
      students << {
      name: name,
      cohort: :november,
      country: country,
      height: height,
      hobbies: hobbies,
    }
    elsif cohort.downcase.include?("d") || cohort.downcase.include?("ec")
      students << {
      name: name,
      cohort: :december,
      country: country,
      height: height,
      hobbies: hobbies,
    }
    elsif cohort.downcase.include?("j") && cohort.downcase.include?("a")
      students << {
      name: name,
      cohort: :january,
      country: country,
      height: height,
      hobbies: hobbies,
    }
    elsif cohort.downcase.include?("f")
      students << {
      name: name,
      cohort: :february,
      country: country,
      height: height,
      hobbies: hobbies,
    }
    elsif cohort.downcase.include?("c") && cohort.downcase.include?("h")
      students << {
      name: name,
      cohort: :march,
      country: country,
      height: height,
      hobbies: hobbies,
    }
    elsif cohort.downcase.include?("ap") && cohort.downcase.include?("r")
      students << {
      name: name,
      cohort: :april,
      country: country,
      height: height,
      hobbies: hobbies,
    }
    elsif cohort.downcase.include?("m") && cohort.downcase.include?("y")
      students << {
      name: name,
      cohort: :may,
      country: country,
      height: height,
      hobbies: hobbies,
    }
    elsif cohort.downcase.include?("j") && cohort.downcase.include?("u") &&
    cohort.downcase.include?("e")
      students << {
      name: name,
      cohort: :june,
      country: country,
      height: height,
      hobbies: hobbies,
    }
    elsif cohort.downcase.include?("j") && cohort.downcase.include?("l")
      students << {
      name: name,
      cohort: :july,
      country: country,
      height: height,
      hobbies: hobbies,
    }
    elsif cohort.downcase.include?("a") && cohort.downcase.include?("g")
      students << {
      name: name,
      cohort: :august,
      country: country,
      height: height,
      hobbies: hobbies,
    }
    elsif cohort.downcase.include?("s") || cohort.downcase.include?("pt")
      students << {
      name: name,
      cohort: :september,
      country: country,
      height: height,
      hobbies: hobbies,
    }
    elsif cohort.downcase.include?("o") && cohort.downcase.include?("t")
      students << {
      name: name,
      cohort: :october,
      country: country,
      height: height,
      hobbies: hobbies,
    }
    else
      students << {
      name: name,
      cohort: cohort.to_sym,
      country: country,
      height: height,
      hobbies: hobbies,
    }
    end
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

def print_details(students)
  students.each_new(students) do |student, index|
    puts "#{index+1}. #{student[:name]} (#{student[:cohort].capitalize} cohort) \
is from #{student[:country]}, #{student[:height].to_f}m tall and enjoys #{student[:hobbies]}."
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students."
end


students = input_students
print_header
print_details(students)
print_footer(students)
