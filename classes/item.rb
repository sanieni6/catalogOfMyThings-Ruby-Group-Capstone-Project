class Item
  def initialize(date)
    @publish_date = Date._parse(date)
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
