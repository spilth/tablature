require 'tablature/version'
require 'victor'

module Tablature
  class << self
    LINE_STYLE = {
        stroke: :black,
        stroke_width: 1
    }

    def svg(tablature)
      height = 10
      width = tablature.length * 10
      svg = Victor::SVG.new template: :html, width: width, height: height, viewBox: "0 0 #{width} #{height}"

      svg.line x1: 5, y1: 5, x2: (width - 10), y2: 5, style: LINE_STYLE

      tablature.chars.each_with_index do |character, index|
        offset = index * 10

        if character == "|" && index == 0
          svg.line x1: 5, y1: 0, x2: 5, y2: 10, style: LINE_STYLE
          svg.line x1: 5, y1: 5, x2: 10, y2: 5, style: LINE_STYLE
        end

        if character == "|" && index > 0 && index < (tablature.length - 1)
          svg.line x1: offset + 5, y1: 0, x2: offset + 5, y2: 10, style: LINE_STYLE
          svg.line x1: offset, y1: 5, x2: offset + 10, y2: 5, style: LINE_STYLE
        end

        if character =~ /\d/
          svg.line x1: offset + 1, y1: 5, x2: offset + 8, y2: 5, style: { stroke: :white,
              stroke_width: 1}

          svg.text character, x: offset + 5, y: 9, text_anchor: :middle, style: {font_size: 11}
        end

        if character == "|" && index == (tablature.length - 1)
          svg.line x1: offset + 5, y1: 0, x2: offset + 5, y2: 10, style: LINE_STYLE
          svg.line x1: offset, y1: 5, x2: offset + 5, y2: 5, style: LINE_STYLE
        end
      end

      svg
    end
  end
end
