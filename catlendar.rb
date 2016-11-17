 #!/usr/bin/env ruby
require 'prawn'
require 'date'

puts "How many days from now on you want to print?"
days = STDIN.gets.strip
puts "Thank you. The PDF will be generated in a second."

start_date = Date.today
end_date = start_date + days.to_i

Prawn::Document.generate("hello.pdf") do

  repeat :all do
    stroke do
      vertical_line 0, bounds.height, :at => 80
      vertical_line 0, bounds.height, :at => 360
    end
  end

  column_box([0, cursor],:columns => 2, :width => bounds.width) do
    start_date.upto end_date do |date|
      text date.strftime(("%a %e.%m.%y"))
      pad_bottom(5) { stroke_horizontal_rule }
    end
  end
end
