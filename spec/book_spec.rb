require_relative '../classes/book'

describe 'Book class' do
  book = Book.new('Publisher', 'good')

  it 'should be kind of item' do
    expect(book).to be_kind_of(Item)
  end

  it 'should be an instance of Book' do
    expect(book).to be_instance_of(Book)
  end
end
