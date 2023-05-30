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

  def save_games 
    File.write('data/games.json', @games.map {|game| game_to_hash game}.to_json)
  end

  def save_files
    save_albums
    save_books
    save_labels
    save_genres
    save_games
  end

  def get_genre_by_id(id)
    @genres.find { |genre| genre.id == id }
  end

  def get_author_by_id(id)
    @authors.find { |author| author.id == id }
  end

  def get_label_by_id(id)
    @labels.find { |label| label.id == id }
  end

  def load_albums
    return unless File.exist?('data/albums.json') && File.size?('data/albums.json')

    JSON.parse(File.read('data/albums.json')).each do |album|
      genre = get_genre_by_id(album['genre'])
      author = get_author_by_id(album['author'])
      label = get_label_by_id(album['label'])
      current_album = MusicAlbum.new(album['on_spotify'], album['date'])
      genre.add_item(current_album)
      author.add_item(current_album)
      label.add_item(current_album)
      @music_albums << current_album
      #@music_albums << MusicAlbum.new(album['on_spotify'], album['genre'], album['author'], album['label'])
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

  def get_item_by_id(id)
    @music_albums.find { |album| album.id == id }
  end

  def load_genres
    
    return unless File.exist?('data/genres.json')
    puts 'loading genres'
    
    JSON.parse(File.read('data/genres.json')).each do |genre|
      genree = Genre.new(genre['name'])
      genree.add_id(genre['id'])
      if genre['items'].nil? && @music_albums.any?
        genre['items'].each do |item|
          genree.add_item(get_item_by_id(item))
        end
      end
      @genres << genree
    end
  end

  def load_authors
    puts 'Loading authors'
    authors = JSON.parse(File.read('./data/authors.json'))['authors']
    authors.each do |author|
      author = Author.new author['first_name'], author['last_name']
      @authors << author
    end
  end

  def load_files
    load_labels
    load_genres
    load_authors
    # load_albums
    load_books
  end
end
