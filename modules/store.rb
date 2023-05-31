require 'json'
require 'pry'
module Store
  def save_albums
    File.write('data/albums.json', @music_albums.map { |album| album_to_hash album }.to_json)
  end

  def save_books
    File.write('data/books.json', @books.map { |book| book_to_hash book }.to_json)
  end

  def save_labels
    File.write('data/labels.json', @labels.map { |label| label_to_hash label }.to_json)
  end

  def save_genres
    File.write('data/genres.json', @genres.map { |genre| genre_to_hash genre }.to_json)
  end

  def save_games
    File.write('data/games.json', @games.map { |game| game_to_hash game }.to_json) unless @games.empty?
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
      # @music_albums << MusicAlbum.new(album['on_spotify'], album['genre'], album['author'], album['label'])
    end
  end

  def load_books
    return unless File.exist?('data/books.json')

    file = File.read('data/books.json')
    book_data = JSON.parse(file)
    book_data.each do |book|
      current_book = Book.new book['publisher'], book['cover_state']
      current_book.author = @authors[0]
      current_book.label = @labels[0]
      current_book.genre = @genres[0]
      @books.push(current_book)
    end
  end

  def load_labels
    return unless File.exist?('data/labels.json')

    puts 'Loading Labels'
    file = File.read('data/labels.json')
    label_data = JSON.parse(file)
    label_data.each do |label|
      aux_label = Label.new label['title'], label['color']
      aux_label.add_id(label['id'])
      if label['items'].nil? && @labels.any?
        label['items'].each do |item|
          aux_label.add_item(get_label_by_id(item))
        end
      end
      @labels << aux_label
    end
  end

  def get_item_by_id(id)
    @music_albums.find { |album| album.id == id }
  end

  def get_label_by_id(id)
    @books.find { |album| book.id == id }
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

  def load_games
    puts 'loading games'
    return unless File.exist?('./data/games.json')

    games = JSON.parse(File.read('./data/games.json'))
    games.each do |game|
      loaded_game = Game.new game['multiplayer'], game['last_played_at']
      loaded_game.author = @authors[0]
      loaded_game.label = @labels[0]
      loaded_game.genre = @genres[0]
      @games.push(loaded_game)
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
    load_games
  end
end
