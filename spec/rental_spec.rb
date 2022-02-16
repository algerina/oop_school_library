require_relative '../rental'
require_relative '../book'
require_relative '../person'

describe Rental do
  book = Book.new('Book1', 'Me')
  person = Person.new(21, 'Person1')
  rental = Rental.new('10-10-1010', book, person)
  describe 'When created' do
    it 'Should have date, book and person' do
      expect(rental.date).to eq '10-10-1010'
      expect(rental.book).to be book
      expect(rental.person).to be person
    end
  end
end
