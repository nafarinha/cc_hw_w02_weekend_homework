require("pry")
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

  def add_songs_to_playlist(*songs)
    @playlist.push(*songs).flatten!
  end

  def get_playlist_duration
    @playlist.reduce(0) { |acc, song| acc + song.duration() }
  end

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




end
