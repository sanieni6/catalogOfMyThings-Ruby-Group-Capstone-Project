require_relative 'app'

def main
  puts 'Welcome to Catalog of my things'
  app = App.new
  app.run
end

def options
  case @number.to_i
  when 1
    list_all_books
  when 2
    list_all_music_albums
  when 3
    list_all_movies
  when 4
    list_all_games
  when 5
    list_all_genres
  when 6
    list_all_labels
  when 7
    list_all_authors
  when 8
    list_all_sources
  when 9
    add_a_book
  when 10
    add_a_music_album
  when 11
    add_a_movie
  when 12
    add_a_game
  end
end

def show_menu
  print_options
  @number = gets
  until @number.to_i.between?(0, 12)
    puts 'Please write a number between 0 and 12'
    @number = gets
  end
  options
end

def print_options
  puts ''
  puts 'Please choose an option by entering a number:'
  puts '1 - List all books'
  puts '2 - List all music albums'
  puts '3 - List all movies'
  puts '4 - List all games'
  puts '5 - List all genres'
  puts '6 - List all labels'
  puts '7 - List all authors'
  puts '8 - List all sources'
  puts '9 - Add a book'
  puts '10 - Add a music album'
  puts '11 - Add a movie'
  puts '12 - Add a game'
  puts '0 - Exit'
end

main
