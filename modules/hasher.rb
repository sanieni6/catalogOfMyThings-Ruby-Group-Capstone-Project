module Hasher
  def album_to_hash(album)
    {
      id: album.id,
      genre: album.genre,
      author: album.author,
      label: album.label
    }
  end

  def book_to_hash(book)
    {
      id: book.id,
      publisher: book.publisher,
      cover_state: book.cover_state
    }
  end
end
