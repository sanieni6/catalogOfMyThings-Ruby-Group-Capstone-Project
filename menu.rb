class Menu
  def initialize(app)
    @app = app
    @menu = build_menu
    @menu_actions = build_menu_actions
  end

  def display_menu
    puts "\nPlease choose an option by entering a number:"

    @menu.each do |key, value|
      puts "#{key} - #{value}"
    end

    validate_option
  end

  private

  def build_menu
    {
      1 => 'List all books',
      2 => 'List all music albums',
      3 => 'List all games',
      4 => 'List all genres',
      5 => 'List all labels',
      6 => 'List all authors',
      7 => 'Add a book',
      8 => 'Add a music album',
      9 => 'Add a game',
      0 => 'Exit'
    }
  end

  def build_menu_actions
    {
      1 => :list_all_books,
      2 => :list_all_music_albums,
      3 => :list_all_games,
      4 => :list_all_genres,
      5 => :list_all_labels,
      6 => :list_all_authors,
      7 => :add_a_book,
      8 => :create_a_music_album,
      9 => :create_a_game,
      0 => :exit
    }
  end

  def validate_option
    option = gets.chomp.to_i
    action = @menu_actions[option]

    if action
      @app.send(action)
    else
      puts 'Select a valid option (between 0 and 9)'
      display_menu
    end
  end
end
