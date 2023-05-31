require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify, :date
  def initialize(date, on_spotify)
    super(date)
    @on_spotify = on_spotify
    @date = date
  end

  def add_id(id)
    @id = id
  end

  private

  def can_be_archived?
    super && @on_spotify
  end
end
