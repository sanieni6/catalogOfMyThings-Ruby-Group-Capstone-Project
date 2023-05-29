module List
    def list_all_music_albums
        puts 'No music albums yet, please create an album first' if @music_albums.empty?
    music_albums.each { |album| puts "author: #{album.author},  genre: #{album.genre}"
    end
end