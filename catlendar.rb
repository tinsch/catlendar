require 'prawn'
require 'date'

date_today = Date.today

Prawn::Document.generate("hello.pdf") do

  repeat :all do
    stroke do
      vertical_line 0, bounds.height, :at => 80
      vertical_line 0, bounds.height, :at => 360
    end
  end

  column_box([0, cursor],:columns => 2, :width => bounds.width) do
    date_today.upto(Date.new(2017, 4, 3)) do |date|
      text date.strftime(("%a %e.%m.%y"))
      pad_bottom(5) { stroke_horizontal_rule }
    end
  end
end
