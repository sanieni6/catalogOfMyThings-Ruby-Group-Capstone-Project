require_relative '../classes/author'
require_relative '../classes/game'
describe Author do
  author = Author.new 'David', 'Espino'
  it 'Should be an instance of Author' do
    expect(author).to be_instance_of(Author)
  end

  it 'Should have the correct first name' do
    expect(author.first_name).to eql('David')
  end

  it 'Should have the correct last name' do
    expect(author.last_name).to eql('Espino')
  end

  it 'Should recieve an element' do
    game = Game.new 7, '2022/04/30'
    author.add_item(game)
    expect(author.items.length).to eql(1)
    expect(author.items[0]).to be_instance_of(Game)
  end
end
