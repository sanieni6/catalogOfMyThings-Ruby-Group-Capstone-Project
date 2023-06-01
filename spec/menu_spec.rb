require_relative '../menu'

describe 'Menu class' do
  let(:app) { double('App') }
  let(:menu) { Menu.new(app) }

  it 'should initialize the menu options' do
    expect(menu.instance_variable_get(:@menu)).to eq({
                                                       1 => 'List all books',
                                                       2 => 'List all music albums',
                                                       3 => 'List all games',
                                                       4 => 'List all genres',
                                                       5 => 'List all labels',
                                                       6 => 'List all authors',
                                                       7 => 'Add a book',
                                                       8 => 'Add a music album',
                                                       9 => 'Add a game',
                                                       0 => 'Exit'
                                                     })
  end

  it 'should initialize the menu actions' do
    expect(menu.instance_variable_get(:@menu_actions)).to eq({
                                                               1 => :list_all_books,
                                                               2 => :list_all_music_albums,
                                                               3 => :list_all_games,
                                                               4 => :list_all_genres,
                                                               5 => :list_all_labels,
                                                               6 => :list_all_authors,
                                                               7 => :add_a_book,
                                                               8 => :create_a_music_album,
                                                               9 => :create_a_game,
                                                               0 => :exit
                                                             })
  end

  it 'should validate and execute the selected option' do
    allow(menu).to receive(:gets).and_return("1\n", "0\n")
    expect(app).to receive(:list_all_books).once
    expect { menu.validate_option }.to output(/Thank you for using this app!/).to_stdout
  end

  it 'should display an error message for an invalid option' do
    allow(menu).to receive(:gets).and_return("999\n", "0\n")
    expect { menu.validate_option }.to output(/Select a valid option/).to_stdout
  end
end
