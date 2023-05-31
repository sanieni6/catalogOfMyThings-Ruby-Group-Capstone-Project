class Label
  attr_accessor :id, :title, :color, :items

  def initialize(title, color)
    @id = Random.rand(1..100)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.label = self
  end

  def add_id(id)
    @id = id
  end
end
