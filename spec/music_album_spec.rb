require_relative '../classes/music_album'

describe MusicAlbum do
    album = MusicAlbum.new('2020-01-01', true)
    album.add_id(1)
    it 'Sloud be a kind of item' do
        expect(album).to be_kind_of(Item)
    end

    it 'Should be an instance of MusicAlbum' do
        expect(album).to be_instance_of(MusicAlbum)
    end

    it 'should have an id' do
        expect(album.id).to eq(1)
    end

    it 'should have a date' do
        expect(album.date).to eq('2020-01-01')
    end

end

