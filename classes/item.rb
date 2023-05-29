class Item
  attr_accessor :genre, :author, :source, :label, :date
  attr_reader :id
  def initialize
    @id = Random.rand(1..1000)
    @genre = nil
    @author = nil 
    @source = nil 
    @label = nil
    @publish_date = Time.now
    @archived = false
  end

  def move_to_archive
    return unless can_be_archived?

    @archived = true
  end

  private

  def can_be_archived?
    current_year = Time.now.year
    return true if current_year - @publish_date.year > 10

    false
  end
end
