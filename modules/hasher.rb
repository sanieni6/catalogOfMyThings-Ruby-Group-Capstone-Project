require 'date'
require 'pry'
module Hasher
  def album_to_hash(album)
    {
      id: album.id,
      on_spotify: album.on_spotify,
      date: album.date,
      genre: album.genre.id,
      author: album.author.id,
      label: album.label.id
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
      items: genre.items.map(&:id) # maybe a conflict with the items: Storing  memory address
    }
  end

  def game_to_hash(game)
    # binding.pry
    {
      multiplayer: game.multiplayer,
      last_played_at: date_to_string(game.last_played_at),
      author: game.author.id,
      label: game.label.id,
      genre: game.genre.id
    }
  end

  def date_to_string(date)
    "#{date[:year]}/#{date[:mon]}/#{date[:mday]}"
  end
end
