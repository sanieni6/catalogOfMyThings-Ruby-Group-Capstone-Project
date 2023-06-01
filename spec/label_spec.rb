require_relative '../classes/label'

describe 'Label class' do
  label = Label.new('Label Title', 'red')

  it 'should have a random ID between 1 and 100' do
    expect(label.id).to be >= 1
    expect(label.id).to be <= 100
  end

  it 'should have a title' do
    expect(label.title).to eq('Label Title')
  end

  it 'should have a color' do
    expect(label.color).to eq('red')
  end

  it 'should start with an empty list of items' do
    expect(label.items).to be_empty
  end

  it 'should be able to set a specific ID' do
    label.add_id(50)
    expect(label.id).to eq(50)
  end
end
