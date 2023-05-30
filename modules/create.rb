require 'pry'
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
    print 'Enter the publish date: '
    date = gets.chomp
    music_album = MusicAlbum.new spotify, date
    genre = select_genre
    genre.add_item(music_album)
    author = select_author
    author.add_item(music_album)
    label = select_label
    label.add_item(music_album)
    @music_albums << music_album
    puts 'Music Album created successfully'
  end

  def create_a_game
    print 'Enter the number of players: '
    multiplayer = gets.chomp
    print 'Enter the last time you played this game: '
    last_played_at = gets.chomp
    game = Game.new multiplayer, last_played_at
    author = select_author
    author.add_item(game)
    # genre = select_genre
    # genre.add_item(game)
    # label = select_label
    # label.add_item(game)
  end

  def add_a_book
    print 'Enter the publisher of the book: '
    publisher = gets.chomp
    print 'Enter the cover state of the book: '
    cover_state = gets.chomp
    book = Book.new(publisher, cover_state)
    # genre = select_genre
    # genre.add_item(book)
    author = select_author
    author.add_item(book)
    label = select_label
    label.add_item(book)
    @books << book
    puts 'Book created successfully'
  end

  def select_genre
    print 'Select a genre using the id: '
    list_all_genres
    id = gets.chomp.to_i
     @genres.find {|genre| genre.id === id}
   end

  def select_author
    print 'Select an option using the id: '
    list_all_authors
    id = gets.chomp.to_i
    filtered = @authors.select { |author| author.id == id }
    filtered[0]

    # binding.pry
  end

  def select_label
    puts 'Select a label:'
    list_all_labels

    print 'Enter the ID of the label: '
    label_id = gets.chomp.to_i

    selected_label = @labels.select { |l| l.id == label_id }
    if selected_label.nil?
      puts 'Invalid label ID. Please try again.'
      select_label
    else
      selected_label
    end
  end
end
