require_relative './classes/item'
require_relative './classes/music_album'
require_relative './modules/create'
require_relative './modules/list'
require_relative './modules/store'
require_relative './modules/hasher'
require_relative './classes/game'
require_relative './classes/book'

class App
  include Create
  include List
  include Store
  include Hasher
  attr_reader :music_albums, :books

  def initialize
    @music_albums = []
    @games = []
    @genres = []
    @authors = []
    @sources = []
    @labels = []
    @books = []
  end

  def run
    load_files
    show_menu
    save_files
    puts 'Thank you for using this app!' if @number.to_i.zero?
  end
end
