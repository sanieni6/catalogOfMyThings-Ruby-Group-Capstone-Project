require_relative '../classes/item'

describe Item do
  let(:item) { Item.new '2020/04/29' }
  it 'Should create an instance of Item' do
    expect(item).to be_instance_of(Item)
  end
  it 'Genre should be nil' do
    expect(item.genre).to be_nil
  end
  it 'Author should be nil' do
    expect(item.author).to be_nil
  end
  it 'Id should be beetween 1 and 1000' do
    expect(item.id).to be_between(1, 1000)
  end
end
