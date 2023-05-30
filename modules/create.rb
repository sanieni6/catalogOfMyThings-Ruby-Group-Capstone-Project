module Create
  def create_a_music_album
    print 'It is on spotify [y/n]: '
    spotify = gets.chomp
    case spotify
    when 'y' || 'Y'
      spotify = true
    when 'n' || 'N'
      spotify = false
    else
      puts 'invalid input, please try again'
      create_a_music_album
    end
    music_album = MusicAlbum.new spotify
    genre = select_genre
    genre.add_item(music_album)
    author = select_author
    author.add_item(music_album)
    label = select_label
    label.add_item(music_album)
    @music_albums << music_album
  end

  def create_a_game
    print 'Enter the number of players: '
    multiplayer = gets.chomp
    print 'Enter the last time you played this game: '
    last_played_at = gets.chomp
    game = Game.new multiplayer, last_played_at
    genre = select_genre
    genre.add_item(game)
    author = select_author
    author.add_item(game)
    label = select_label
    label.add_item(game)
  end

  def add_a_book
    print 'Enter the publisher of the book: '
    publisher = gets.chomp
    print 'Enter the cover state of the book: '
    cover_state = gets.chomp
    book = Book.new(publisher, cover_state)
    genre = select_genre
    genre.add_item(book)
    author = select_author
    author.add_item(book)
    label = select_label
    label.add_item(book)
    @books << book
    puts 'Book created successfully'
  end

  def select_genre; end

  def select_author; end

  def select_label; end
end
