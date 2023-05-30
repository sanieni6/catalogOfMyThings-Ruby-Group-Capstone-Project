require_relative 'app'
require_relative 'menu'

def main
  puts 'Welcome to Catalog of my things'
  app = App.new
  app.run
end

main
