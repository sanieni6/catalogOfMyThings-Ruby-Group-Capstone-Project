module List
  def list_all_music_albums
    puts 'No music albums yet, please create an album first' if @music_albums.empty?
    @music_albums.each do |album|
      puts "Author: #{album.author},  Genre: #{album.genre}"
    end
  end

  def list_all_books
    puts "There's no books stored yet" if @books.empty?
    @books.each do |book|
      puts "Title: #{book.title}, Author: #{book.author} Published by: #{book.publisher}"
    end
  end

  def list_all_labels
    puts "There's no labels stored yet" if @labels.empty?
    @labels.each do |label|
      puts "Title: #{label.title}, Color: #{label.color}"
    end
  end
end
