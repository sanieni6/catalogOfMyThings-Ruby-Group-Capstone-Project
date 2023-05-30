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

  def label_to_hash(label)
    {
      title: label.title,
      color: label.color
    }
  end

  def genre_to_hash(genre)
    {
      id: genre.id,
      name: genre.name,
      items: genre.items # maybe a conflict with the items: Storing  memory address
    }
  end
end
