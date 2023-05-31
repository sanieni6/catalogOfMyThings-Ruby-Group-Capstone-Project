class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publisher, cover_state)
    super(Time.now)
    @publisher = publisher
    @cover_state = cover_state
  end

  private

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
