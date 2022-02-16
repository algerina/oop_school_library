require_relative '../corrector'

describe Corrector do
  corrector = Corrector.new

  context 'correct_name' do
    it 'Should capitalize the first letter' do
      expect(corrector.correct_name('tom')).to eql 'Tom'
    end

    it 'Should return a truncated string' do
      expect(corrector.correct_name('Gabriel Garcia Marques').length).to be >= 10
    end
  end
end
