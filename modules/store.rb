require 'json'

module Store
    def save_albums
        File.write('data/albums.json', @music_albums.map { |album| album_to_hash album }.to_json)
    end

    def save_files
        save_albums
    end

    def load_albums
        return unless File.exist?('data/albums.json') && File.size?('data/albums.json')

    JSON.parse(File.read('data/albums.json')).each do |album|
      @music_albums << MusicAlbum.new(album['genre'], album['author'])
    end
    end

    def load_files
        load_albums
    end

end