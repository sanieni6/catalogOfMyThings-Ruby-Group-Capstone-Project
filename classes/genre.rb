class Genre
  def initialize(_name)
    @id = Random.rand(1..100)
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.genre = self
  end
end
