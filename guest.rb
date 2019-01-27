class Guest

  attr_reader :name, :age, :wallet
  attr_writer :favourite_song


  def initialize(name, age, wallet)
    @name = name
    @age = age
    @wallet  = wallet
    @favourite_song = String.new()
  end


#ADVANCED EXTENSIONS

  def cheer_favourite_song(playlist)

    found_favourite_song = playlist.find { |song| song == @favourite_song }

    "Whoo, Whooo!I love #{found_favourite_song.artist}!" if !found_favourite_song.nil? && found_favourite_song == @favourite_song

  end


end
