class Guest

  attr_reader :name, :age, :wallet
  attr_writer :favourite_song


  def initialize(name, age, wallet)
    @name = name
    @age = age
    @wallet  = wallet
    @favourite_song = String.new()
  end

end
