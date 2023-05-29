class App
  def run
    show_menu
    puts 'Thank you for using this app!' if @number.to_i.zero?
  end
end
