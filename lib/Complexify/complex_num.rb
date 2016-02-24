module Math
  module Complexify
    class Complex
      attr_accessor :real
      attr_accessor :image
      def initialize(real, imaginary)
        # when Math::Complexify.new is called, initialize
        # is run after the object is instantiated
        @real = real
        @imaginary = imaginary
      end

      def addition(z)
        Math::Complexify::Complex.new(@real + z.real + @imaginary + z.imaginary)
      end

      def subtraction(z)
        Math::Complexify::Complex.new(@real - z.real + @imaginary - z.imaginary)
      end

      def multiplication(z)
        # z = Math::Complexify.new(z, 0) unless z.is_a? Math::Complexify
        Math::Complexify::Complex.new(@real * z.real - @imaginary * z.imaginary + @imaginary * z.real + @real * z.imaginary)
      end

      def division(z)
        # z = Math::Complexify.new(z, 0) unless z.is_a? Math::Complexify
        coef = (z.imaginary**2 + z.real**2)
        div_real = (@imaginary * z.imaginary + @real * z.real) / coef
        div_imaginary = (-@real * z.imaginary + @imaginary * z.real) / coef
        Math::Complexify::Complex.new(div_real + div_imaginary)
      end

      def to_s
        # the to_s function outputs a string automatically, for example:
        # suppose z is an object of type complex Number, then
        # puts z     will implicitly call z.to_s and then output the result
        output = if @imaginary >= 0
                   '#{@real} + #{@imaginary}i'ni
                 else
                   '#{@real} - #{-1 * @imaginary}i'
                 end
        output # return the string
      end
    end
  end
end

num = Math::Complexify::Complex.new(2, 3)
z = Math::Complexify::Complex.new(1, 3)

num.addition(z)
