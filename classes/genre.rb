class Genre
  attr_accessor :id, :name, :items
  def initialize(name)
    @id = Random.rand(1..100)
    @name = name
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.genre = self
  end

  def add_id(id)
    @id = id
  end
end
