class Game 
  def initialize(multiplayer, last_played_at) 
    @multiplayer = multiplayer
    @last_played_at = Date._parse(last_played_at)
  end

  def can_be_archived? 
    return super() && older_than_two_years? ? true : false
  end

  private 

  def older_than_two_years?
    current = Time.now.year
    current - @last_played_at.year > 2
  end

end