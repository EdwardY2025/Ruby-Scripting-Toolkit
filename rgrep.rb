#Edward Yeboah
#SBU ID: 114385084
#netid: eyeboah


#!/usr/bin/env ruby

#Text searching tool used to locate files
def Rgrep(filename, options, pattern)
  #Checks if the file exits
  unless File.exist?(filename)
    puts "File not found: #{filename}"
    return
  end
  #Read all the lines from the file
  lines = File.readlines(filename)
  #Store matching lines here
  matching_lines = []
  #Checks each line one by one
  lines.each do |line|
    case options
    when '-w' #Search for whole words only
      if line.split.any? { |word| word =~ /^#{pattern}$/ }
        matching_lines << line
      end

    when '-p' #Normal search for any pattern
      if line =~ /#{pattern}/
        matching_lines << line
      end

    when '-v' #Show lines that don't match
      unless line =~ /#{pattern}/
        matching_lines << line
      end

    else # Default to normal search if no option given
      if line =~ /#{pattern}/
        matching_lines << line
      end
    end
  end
  # Now handle how to show results
  if options.include?('-c') #Just count matches
    puts matching_lines.size
  elsif options.include?('-m') #Show only matching parts

    matching_lines.each do |line|
      if line =~ /#{pattern}/
        puts line.match(/#{pattern}/).to_s
      end
    end
    else #Show full matching lines
      matching_lines.each { |line| puts line}
    end
end

def main_method
  filename = nil #stores filename
  options = [] #stores search options
  pattern = nil #stores what to search for

  #Examines each user given command
  ARGV.each do |arg|
    if arg.start_with?('-')
    case arg
    when '-p', '-w', '-v', '-c', '-m' then options << arg
    else
      puts "Invalid option"
      return
    end
    elsif filename.nil? #First non-option is filename
      filename = arg
    else #Next non-option is search term
      pattern = arg
    end
  end
  #Checks if user provided what is needed
  if filename.nil? || pattern.nil?
    puts "Missing required arguments"
    return
  end
  #if no search type given, use normal search
  options << '-p' if options.empty?

  #Checks for option conflicts
  has_v = options.include?('-v')
  has_m = options.include?('-m')


  if has_v && has_m
    puts "Invalid combination of options"
    return
  end
  #Figure out which main search option to use
  primary_options = options & ['-p', '-w', '-v']
  if primary_options.size > 1
    puts "Invalid combination of options"
    return
  end
  #Performs the search with the chosen options
  Rgrep(filename, primary_options.first, pattern)
end

#Starts the program
main_method
