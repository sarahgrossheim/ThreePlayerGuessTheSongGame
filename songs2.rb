#!/usr/local/bin/ruby
# Sarah Grossheim
# CS410W Assignment #13
# Date Due: 3-11-24
# Description: Make a three user game where two users enter their name, fav song, and artist in songs.rb. 
#              Then go to songs2.rb where the third user can see if their guesses of each player's favorite
#              songs were correct.
require 'pstore'

class FavSongs
  attr_accessor :name, :songName, :artist;
end

# Get data from songs.rb
store = PStore.new("songFile")
people = []
store.transaction do
  people = store[:people]
end

# Print data from last game to the user
people.each do |person|
  puts person.name
  puts person.songName
  puts person.artist
  puts
end

# Ask player if they guessed correctly
puts "Player 3, did you guess correctly?"

# Tell user how to play again. First remove the created file so they will have a fresh plate to start
# again and then tell them to run the songs.rb file again
puts "To play again:"
puts "Type rm songFile"
puts "Type ./songs.rb"
