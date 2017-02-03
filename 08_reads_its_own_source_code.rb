
def read_myself
  File.open($PROGRAM_NAME, "r") do |file|
    puts $PROGRAM_NAME
    file.readlines.each do |line|
      puts line
    end
  end
end

read_myself
