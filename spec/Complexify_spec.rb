require_relative "../lib/Complexify/complex_num"
require "spec_helper"

# describe Complexify do
#   it "has a version number" do
#     expect(Complexify::VERSION).not_to be nil
#   end

#   it "does something useful" do
#     expect(false).to eq(true)
#   end
# end


RSpec.describe Math::Complexify::Complex do
	subject(:complex) { Math::Complexify::Complex }
	# subject(:complex_obj) { complex.new(2, 3) }

	describe '#initialize' do
	  it "accepts two arguments" do
	  	expect {complex.new}.to raise_error ArgumentError
	  	expect {complex.new(2)}.to raise_error ArgumentError
	  	expect {complex.new(2,3)}.not_to raise_error
	  end

	  it "returns an Instance of Complex" do
	  	expect(complex.new(2,3)).to be_an_instance_of complex
	  end
	end

	describe '#addition' do
  		it 'performs addition on two operands' do
  			expect(complex.new(2,3).addition(complex.new(3,4))).to eql '5 + 7i'
  			
  		end

  		it 'accepts two arguments' do
  		    expect {complex.new}.to raise_error ArgumentError
	  	    expect {complex.new(2)}.to raise_error ArgumentError
	  	    expect {complex.new(2,3)}.not_to raise_error 
  		end
	end

	describe '#subtraction' do
		it "accepts two arguments" do
		  	expect {complex.new}.to raise_error ArgumentError
		  	expect {complex.new(2)}.to raise_error ArgumentError
		  	expect {complex.new(2,3)}.not_to raise_error
	  	end
	  
	  	it 'performs subtraction on two operands' do
  			expect(complex.new(2,3).subtraction(complex.new(3,4))).to eql '-1 - i'
	  	end
	end

	describe '#multiplication' do
	  	it "accepts two arguments" do
		  	expect {complex.new}.to raise_error ArgumentError
		  	expect {complex.new(2)}.to raise_error ArgumentError
		  	expect {complex.new(2,3)}.not_to raise_error
	  	end
	  
	  	it 'performs multiplication on two operands' do
  			expect(complex.new(2,3).multiplication(complex.new(3,4))).to eql '-6 + 17i'
	  	end
	end
  
  	describe '#division' do
	  	it "accepts two arguments" do
		  	expect {complex.new}.to raise_error ArgumentError
		  	expect {complex.new(2)}.to raise_error ArgumentError
		  	expect {complex.new(2,3)}.not_to raise_error
	  	end
	  
	  	it 'performs division on two operands' do
  			expect(complex.new(2,3).division(complex.new(3,4))).to eql '0.72 - -0.04i'
	  	end
	end
end