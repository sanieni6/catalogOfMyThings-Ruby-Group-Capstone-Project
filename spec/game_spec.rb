require_relative '../classes/game'

describe 'Game class' do
  game = Game.new 4, '2020/04/29'
  it 'Should be kind of item' do
    expect(game).to be_kind_of(Item)
  end
  it 'Should be instance of Game' do
    expect(game).to be_instance_of(Game)
  end
  it 'Should be able to be archived' do
    expect(game.can_be_archived?).to be false
  end
end
