require_relative '../classes/genre'
require_relative '../classes/music_album'

describe Genre do
  genre = Genre.new('Rock')
  genre.add_id(1)
  it 'should be an instance of Genre' do
    expect(genre).to be_instance_of Genre
  end

  it 'should have a name' do
    expect(genre.name).to eq('Rock')
  end

  it 'should have an id' do
    expect(genre.id).to eq(1)
  end

  it 'Should recieve an item' do
    album = MusicAlbum.new(2019, true)
    genre.add_item(album)
    expect(genre.items[0]).to be_instance_of(MusicAlbum)
  end
end
