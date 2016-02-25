require_relative "Complexify/complex_num"

class StartApp
  def start
    puts "\n\n Welcome to Complexify"
    puts "\n\n What is Complexify \n\n" \
         "Complexify is a Complexify Number Library that\n\n"\
         "helps you perform basic mathematical operations\n\n"\
         "on Complex Numbers.\n\n"\
         "Here are some helpful keys to navigate the app:\n\n"\
         "'re' - real\n\n"\
         "'img' - imaginary\n\n"
    get_operand_num
    get_complex_num
  end

  def get_operand_num
    puts "How many operands will you be using?"
  end

  def get_complex_num
    loop do
      operand_num = gets.chomp.to_i
      result = ""
      if operand_num > 1
        count = 1
        operand_num.times do
          operand_num_real = get_number("Enter the 're' part of no. #{count} complex number ")
          operand_num_imag = get_number("Enter the 'img' part of no. #{count} complex number ")
          @real = operand_num_real
          @imaginary = operand_num_imag
          result = Math::Complexify::Complex.new(operand_num_real, operand_num_imag)
          count += 1
        end
      elsif operand_num <= 1
        puts "You cannot have #{operand_num} operand"
        get_operand_num
        break
      end
      puts result
    end
  end

  def get_number(prompt)
    result = nil
    loop do
      puts prompt
      result = gets.chomp.to_i
      break if result.class != "Fixnum"
    end
  end
end

StartApp.new.start
