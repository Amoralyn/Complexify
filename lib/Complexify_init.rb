require_relative "Complexify/complex_num"
require "colorize"

class StartApp
  def start
    puts "\n\n Welcome to Complexify!!!".green
    puts "\n\n What is Complexify ".green
    puts "\n Complexify is a Complex Number Library that".red
    puts "\n helps you perform basic mathematical operations".red
    puts "\n on Complex Numbers.".red
    puts "\n ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts "\n At any point in the program, use CTRL-C to end the program".red
    puts "\n ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

    @result = []
    get_operation_type
    # operation_guide
  end

  def get_operation_type
    puts "\n Will you be performing a Single or Multiple Operation?".green
    puts "\n Enter 'S' or 'Single' for Single or"\
         " 'M' or 'multiple' for Multiple".blue
    op_type = gets.chomp.downcase
    if op_type == "s" || op_type == "single"
      get_copmlex_num_single
    elsif op_type == "m" || op_type == "multiple"
      puts "\n How many operands will you be using?".green
      get_complex_num_multiple
    else
      puts "Enter a valid option"
      get_operation_type
    end
  end

  def get_copmlex_num_single
    2.times do |i|
      position = case i + 1
                 when 1
                   "1st"
                 else
                   "2nd"
                 end

      puts "\n Enter the real part of your #{position}"\
           " complex number".yellow
      real = gets.chomp.to_i
      puts "\n Enter the imaginary part of your #{position}"\
           " complex number".yellow
      imaginary = gets.chomp.to_i
        # require "pry"; binding.pry
      @result.push(Math::Complexify::Complex.new(real, imaginary))
      puts "\n Your #{position} complex number is #{@result[i]} "
    end
    operation_guide
    operation
    # operation_guide
  end

  def get_complex_num_multiple
    loop do
      operand_num = gets.chomp.to_i
      if operand_num > 2
        count = 1
        operand_num.times do |i|
          position = case i + 1
                     when 1
                       "1st"
                     when 2
                       "2nd"
                     when 3
                       "3rd"
                     else
                       "#{count}th"
                     end

          puts "Enter the real part of your #{position}"\
               " complex number".yellow
          real = gets.chomp.to_i
          puts "Enter the Imaginary part of your #{position}"\
               " complex number".yellow
          imaginary = gets.chomp.to_i
          @result.push(Math::Complexify::Complex.new(real, imaginary))
          puts "Your #{position} complex number is #{@result[i]} "
          # operation_guide
          # operation
          count += 1
        end
        # break
      elsif operand_num == 2
        puts "This is a Single operation".blue
        get_operation_type
      else
        puts "You cannot have #{operand_num} operand".red
        get_operation_type
      end
      break
    end
    operation_guide
    operation
    # operation_guide
  end

  def operation_guide
    puts "\n\nOPERATORS: \n\n".blue
    puts "** To add enter, 'ADD'**".blue
    puts "** To subtract, enter 'SUBTRACT' **".blue
    puts "** To multiply, enter 'MULTIPLY' **".blue
    puts "** To divide, enter 'DIVIDE' **".blue
    puts "** To exit, enter 'EXIT' **".blue
  end

  def operation
      @result.each do |ech|
        complex_num_count = @result.index(ech)
        count = 1 + @result.index(ech)
        break if count >= @result.length
        # operation_guide
        user_choice = gets.chomp.upcase

        if complex_num_count == 0 && count == 1
          case user_choice
          when "ADD"
            puts "#{@result[0]}  +  #{@result[1]} is :\n\n"
            @temp = @result[0].addition(@result[1])
            puts @temp
          when "SUBTRACT"
            puts "#{@result[0]}  -  #{@result[1]} is :\n\n"
            @temp = @result[0].subtraction(@result[1])
            puts @temp
          when "MULTIPLY"
            puts "#{@result[0]}  *  #{@result[1]} is :\n\n"
            @temp = @result[0].multiplication(@result[1])
            puts @temp
          when "DIVIDE"
            puts "#{@result[0]}  /  #{@result[1]} is :\n\n"
            @temp = @result[0].division(@result[1])
            puts @temp
          when "EXIT"
            break
          else
            puts "Enter a valid Operator".red
            redo
            operation_guide
          end
        else
          case user_choice
          when "ADD"
            puts "#{@temp}  +  #{@result[count]} is :\n\n"
            @temp = @temp.addition(@result[count])
            puts @temp
          when "SUBTRACT"
            puts "#{@temp}  -  #{@result[count]} is :\n\n"
            @temp = @temp.subtraction(@result[count])
            puts @temp
          when "MULTIPLY"
            puts "#{@temp}  *  #{@result[count]} is :\n\n"
            @temp = @temp.multiplication(@result[count])
            puts @temp
          when "DIVIDE"
            puts "#{@temp}  /  #{@result[count]} is :\n\n"
            @temp = @temp.division(@result[count])
            puts @temp
          when "EXIT"
            break
          else
            puts "Enter a valid Operator".red
            redo
          end
        end
      # end
    end
  end
end

StartApp.new.start
