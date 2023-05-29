module Hasher
    def album_to_hash(album)
        {
            id: album.id
            genre: album.genre
            author: album.author
            label: album.label
        }
    end
end