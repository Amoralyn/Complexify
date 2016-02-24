require_relative "../Complexify/complex_num.rb"

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
    puts "How many operands will you be using?"
    operand_num = gets.chomp.to_i

    result = ""
    operand_num.times do
        operand_num_real = get_number("Enter the 're' part of no. #{operand_num} complex number ")
        operand_num_imag = get_number("Enter the  part of first complex number ")
        @real = operand_num_real
        @imaginary = operand_num_imag
     result = Math::Complexify::Complex.new(operand_num_real, operand_num_imag)
    end
  end

  def get_number(prompt)
    result = nil
    loop do
      puts number
      result = gets.chomp.to_i
      break if result.class != "Fixnum"
    end
  end
end
