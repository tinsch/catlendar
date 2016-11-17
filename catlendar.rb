 #!/usr/bin/env ruby
require 'prawn'
require 'date'

puts "How many days from now on you want to print?"
days = STDIN.gets.strip
puts "How many columns do you want to have?"
columns = STDIN.gets.strip
puts "Thank you. The PDF will be generated in a second."

start_date = Date.today
end_date = start_date + days.to_i
columns = columns.to_i

Prawn::Document.generate("catlendar.pdf") do

  FULL_COLUMN_WIDTH = 264
  FIRST_COLUMN_LINE =  80
  SECOND_COLUMN_LINE = 360
  COLUMN_WIDTH = FULL_COLUMN_WIDTH - FIRST_COLUMN_LINE

  repeat :all do
    stroke do
      vertical_line 0, bounds.height, :at => FIRST_COLUMN_LINE
      vertical_line 0, bounds.height, :at => SECOND_COLUMN_LINE
      vertical_line 0, bounds.height, :at => FULL_COLUMN_WIDTH
      vertical_line 0, bounds.height, :at => bounds.width
    end
    for i in 1...columns do 
      stroke do
        vertical_line 0, bounds.height, :at => FIRST_COLUMN_LINE + (COLUMN_WIDTH/columns) * i
        vertical_line 0, bounds.height, :at => SECOND_COLUMN_LINE + (COLUMN_WIDTH/columns) * i
      end
    end
  end

  column_box([0, cursor],:columns => 2, :width => bounds.width) do
    start_date.upto end_date do |date|
      text date.strftime(("%a %e.%m.%y"))
      pad_bottom(5) { stroke_horizontal_rule }
    end
  end
end
