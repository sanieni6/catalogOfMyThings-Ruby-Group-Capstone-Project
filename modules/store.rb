require 'json'

module Store
  def save_albums
    File.write('data/albums.json', @music_albums.map { |album| album_to_hash album }.to_json)
  end

  def save_books
    File.write('data/books.json', JSON.pretty_generate(@books.map { |book| book_to_hash(book) }))
  end

  def save_labels
    File.write('data/labels.json', JSON.pretty_generate(@labels.map { |label| label_to_hash(label) }))
  end

  def save_genres
    File.write('data/genres.json', @genres.map { |genre| genre_to_hash genre }.to_json)
  end

  def save_files
    save_albums
    save_books
    save_labels
  end

  def load_albums
    return unless File.exist?('data/albums.json') && File.size?('data/albums.json')

    JSON.parse(File.read('data/albums.json')).each do |album|
      @music_albums << MusicAlbum.new(album['on_spotify'], album['genre'], album['author'], album['label'])
    end
  end

  def load_books
    return unless File.exist?('data/books.json')

    file = File.read('data/books.json')
    book_data = JSON.parse(file)
    @books = book_data.map { |book| Book.new(book['title'], book['author'], book['publisher']) }
  end

  def load_labels
    return unless File.exist?('data/labels.json')

    file = File.read('data/labels.json')
    label_data = JSON.parse(file)
    @labels = label_data.map { |label| Label.new(label['title'], label['color']) }
  end

  def load_genres
    return unless File.exist?('data/genres.json')

    JSON.parse(File.read('data/genres.json')).each do |genre|
      @genres << Genre.new(genre['name'], genre['items']) # maybe a conflict with the items: returning memory address
    end
  end

  def load_files
    load_albums
    load_books
    load_labels
  end
end
