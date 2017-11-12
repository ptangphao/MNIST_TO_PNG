require_relative 'mnist_to_png'

generator = MnistPNGGenerator.new
puts "How many images would you like to generate?"
begin generator.generate_images(gets.chomp.to_i) rescue puts "Invalid input" end
