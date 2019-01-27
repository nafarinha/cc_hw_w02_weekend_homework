require("pry")
class Room

  attr_reader :name, :max_capacity, :entry_fee
  attr_accessor :guest_list, :playlist

  def initialize(name)

    @name = name
    @guest_list = []
    @entry_fee = 0
    @playlist = []
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

  def add_songs_to_playlist(*songs)
    @playlist.push(*songs).flatten!
  end

  def remove_songs_from_playlist(*songs)
    songs_to_remove = []
    songs_to_remove.push(*songs).flatten!
    songs_to_remove.each do |song_to_remove|
      @playlist.delete_if { |song| song == song_to_remove }
    end
  end

  def get_playlist_duration
    @playlist.reduce(0) { |acc, song| acc + song.duration() }
  end

#The set_max_capacity() call on check_in method completes the first Extension
  def check_in(guests)
    set_max_capacity()
    @max_capacity > @guest_list.count() ? @guest_list.push(*guests) : "Room #{@name} is full"
  end

  def check_out(*guests)
    leaving_guests = [*guests]
    leaving_guests.each do |leaving_guest|
      @guest_list.delete_if { |guest| guest == leaving_guest }
    end
  end

#EXTENSIONS

  def available_space
    @max_capacity - @guest_list.size()
  end

#entry fee is calculated based on room's max capacity times a price per person price. Will not change if guests arrive later or leave earlier
  def calculate_entry_fee(price_per_person)
    @max_capacity * price_per_person
  end

end
