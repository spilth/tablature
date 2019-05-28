require 'nokogiri'

RSpec.describe Tablature do
  context 'when it is 3 characters long' do
    it 'draws a line with a width of 30' do
      svg = Tablature.svg('|-|')

      expect(svg.svg_attributes[:width]).to eq 30
      expect(svg.svg_attributes[:height]).to eq 10

      svg.save('3')
    end
  end

  context 'when it is 5 characters long' do
    it 'draws a line with a width of 50' do
      svg = Tablature.svg('|---|')

      expect(svg.svg_attributes[:width]).to eq 50
      expect(svg.svg_attributes[:height]).to eq 10

      svg.save('5')
    end
  end

  context 'when it contains fret numbers' do
    it 'draws the fret number on the line' do
      svg = Tablature.svg('|-3-|')

      expect(svg.svg_attributes[:width]).to eq 50
      expect(svg.svg_attributes[:height]).to eq 10

      svg.save('basic')
    end
  end

  context 'when it contains a measure bar' do
    it 'draws the measure bar' do
      svg = Tablature.svg('|-3-4-5-6-|-6-5-4-3-|')
      svg.save('measure-bar')
    end
  end
end
