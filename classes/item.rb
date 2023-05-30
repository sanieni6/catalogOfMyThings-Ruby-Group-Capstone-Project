class Item
  attr_accessor :genre, :author, :label, :publish_date, :archived
  attr_reader :id

  def initialize(publish_date)
    @id = Random.rand(1..1000)
    @genre = nil
    @author = nil
    @label = nil
    @publish_date = publish_date
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
