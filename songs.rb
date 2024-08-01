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

  # Print the purpose of this program
  def welcomeMessage
    puts "Gather around 3 of your friends."
    puts "Two of you are going to enter your name and your favorite songs and respecting artists."
    puts "The person who didn't enter anything will try to guess the first two's favorite song."
    puts " "
  end
  
  # Get player data
  def playerData
    # Ask user what their name is and store it into name
    print "What is your name? "
    @name = gets.chomp.to_s
    # Ask user what their favorite song is and store it into songName
    print "What is your favorite song? "
    @songName = gets.chomp.to_s
    # Ask user who the artist is and store it into artist
    print "Who is the artist? "
    @artist = gets.chomp.to_s
    puts 
  end

  # Make spaces so the guesser can't see the original inputs
  def whiteSpace
    50.times do
      puts
    end
  end

# End class
end

# Create new objects for player 1 and 2
player1 = FavSongs.new
player2 = FavSongs.new

# Display the welcome message that describes purpose of this program
player1.welcomeMessage

# Let player 1 play
puts "Player 1 is up!"
player1.playerData

# Let player 2 play
puts "Player 2 is up!"
player2.playerData

# Hide the player 1 and 2 data so player 3 can make their guesses
player2.whiteSpace

# Tell the third user to go to the second file to see if their guesses were correct
puts "Player 3, tell Player 1 and Player 2 your guesses!"
puts "Type ./songs2.rb to see if you were correct."

# Store the player data into the songFile
store = PStore.new("songFile")
store.transaction do
  store[:people] ||= Array.new
  store[:people] << player1
  store[:people] << player2
end
