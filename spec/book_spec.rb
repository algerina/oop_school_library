require_relative '../book'

describe Book do
  context 'When created' do
    book = Book.new('Book1', 'Author1')

    it 'should have title and author' do
      expect(book.title).to eql 'Book1'
      expect(book.author).to eql 'Author1'
    end

    it 'should not have a list of rentals' do
      expect(book.rentals).to be_empty
    end
  end
end
