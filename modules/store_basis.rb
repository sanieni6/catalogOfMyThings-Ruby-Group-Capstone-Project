module StoreBasis
  def save_labels
    File.write('data/labels.json', @labels.map { |label| label_to_hash label }.to_json)
  end

  def save_genres
    File.write('data/genres.json', @genres.map { |genre| genre_to_hash genre }.to_json)
  end

  def load_authors
    authors = JSON.parse(File.read('./data/authors.json'))['authors']
    authors.each do |author|
      author = Author.new author['first_name'], author['last_name']
      @authors << author
    end
  end

  def load_genres
    return unless File.exist?('data/genres.json')

    JSON.parse(File.read('data/genres.json')).each do |genre|
      genree = Genre.new(genre['name'])
      genree.add_id(genre['id'])
      @genres << genree
    end
  end

  def load_labels
    return unless File.exist?('data/labels.json')

    file = File.read('data/labels.json')
    label_data = JSON.parse(file)
    label_data.each do |label|
      aux_label = Label.new label['title'], label['color']
      aux_label.add_id(label['id'])
      if label['items'].nil? && @labels.any?
        label['items'].each do |item|
          aux_label.add_item(get_labels_by_id(item))
        end
      end
      @labels << aux_label
    end
  end

  def get_labels_by_id(id)
    @books.find { |_album| book.id == id }
  end
end
