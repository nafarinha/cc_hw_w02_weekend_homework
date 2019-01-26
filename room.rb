class Room

  attr_reader :name, :max_capacity, :entry_fee
  attr_accessor :guest_list, :playlist

  def initialize(name)

    @name = name
    @guest_list = []
    @entry_fee = 0
    @playlist = Array.new()
    @max_capacity = 0

  end

  def set_max_capacity
    case @name
    when "Ibanez"
      @max_capacity = 3
    when "Gibson"
      @max_capacity = 4
    when "Fender"
      @max_capacity = 5
    end
  end

  def create_playlist(*songs)
    @playlist = songs
  end

  def get_playlist_duration
    @playlist.reduce(0) { |acc, song| acc + song.duration() }

# reduced_nums = numbers.reduce(0) { |acc, number| acc + number }

  end


end
