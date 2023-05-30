module List
  def list_all_music_albums
    puts 'No music albums yet, please create an album first' if @music_albums.empty?
    @music_albums.each do |album|
      puts "genre: #{album.genre.name},  author: #{album.author.first_name}, Available on spotify:#{album.on_spotify} "
    end
  end

  def list_all_books
    puts "There's no books stored yet" if @books.empty?
    @books.each do |book|
      puts "Title: #{book.title}, Author: #{book.author} Published by: #{book.publisher}"
    end
  end

  def list_all_labels
    puts 'There are no labels stored yet.' if @labels.empty?
    @labels.each do |label|
      puts "Id: #{label.id} Title: #{label.title}, Color: #{label.color}"
    end
  end

  def list_all_genres
    puts "There's no genres stored yet" if @genres.empty?
    @genres.each do |genre|
      puts "id: #{genre.id} Genre: #{genre.name}"
    end
  end

  def list_all_authors
    puts "There's no genres stored yet" if @authors.empty?
    @authors.each do |author|
      puts "Id: #{author.id} Name: #{author.first_name} #{author.last_name}"
    end
  end
end
