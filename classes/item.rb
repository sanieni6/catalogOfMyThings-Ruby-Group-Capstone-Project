class Item 
  def initialize(date)
    @id
    @genre
    @author
    @source
    @label
    @publish_date = Date._parse(date)
    @archived
  end
  
  def move_to_archive
    if can_be_archived?
      @archived = true
    end
  end
  
  private

  def can_be_archived?
    current_year = Time.now.year
    if current_year - @publish_date.year > 10
      return true
    end
    false
  end
end