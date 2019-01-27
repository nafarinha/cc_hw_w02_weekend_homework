require("minitest/autorun")
require("minitest/rg")
require_relative("../room")
require_relative("../guest")
require_relative("../song")

class TestRoom < Minitest::Test

  def setup
    @guest_1 = Guest.new("John", 28, 25)
    @guest_2 = Guest.new("Kate", 25, 100)
    @guest_3 = Guest.new("Jack", 33, 80)
    @guest_4 = Guest.new("Mary", 31, 50)
    @guest_5 = Guest.new("Henry", 27, 130)

    @song_1 = Song.new("R.E.M.", "Loosing My Religion", 268, "Pop", "Oh, life is bigger \nIt's bigger than you and you are not me")
    @song_2 = Song.new("Goo Goo Dolls", "Iris", 289, "Pop", "And I'd give up forever to touch you \n'Cause I know that you feel me somehow")
    @song_3 = Song.new("Jimmy Eat World", "The Middle", 168, "Pop", "Hey \nDon't write yourself off yet")
    @song_4 = Song.new("Kelly Clarkson", "Stronger" , 221, "Pop", "You know the bed feels warmer \nSleeping here alone")
    @song_5 = Song.new("Neil Diamond", "Sweet Caroline", 204, "70's", "Where it began \nI can't begin to knowin'")
    @song_6 = Song.new("Shania Twain", "Man! I Feel Like a Woman!", 233, "Country", "I'm going out tonight \nI'm feelin' alright")
    @song_7 = Song.new("Frank Sinatra", "My Way", 276, "Jazz", "And now, the end is near \nAnd so I face the final curtain")
    @song_8 = Song.new("Oasis", "Wonderwall", 258, "Rock", "Today is gonna be the day that they're gonna throw it back to you")
    @song_9 = Song.new("Oasis", "Don't Look Back In Anger", 287, "Rock", "Slip inside the eye of your mind \nDon't you know you might find")
    @song_10 = Song.new("Lynyrd Skynyrd", "Sweet Home Alabama", 283, "Rock", "Big wheels keep on turning \nCarry me home to see my kin")
    @song_11 = Song.new("Gloria Gaynor", "I Will Survive", 197, "R&B", "At first I was afraid, I was petrified \nKept thinkin' I could never live without you by my side")


    #@playlist_1 = [@song_1, @song_2, @song_3]
    # @playlist_1 = {
    #   songs: [@song_1, @song_2, @song_3],
    #   total_time: 268 + 289 + 168
    # }




    @guest_list_1 = [@guest_1, @guest_2, @guest_3]
    @guest_list_2 = [@guest_5, @guest_4, @guest_3, @guest_2]
    @guest_list_3 = [@guest_2, @guest_4, @guest_1, @guest_3, @guest_5]

    @room_1 = Room.new("Ibanez")
    @room_2 = Room.new("Gibson")
    @room_3 = Room.new("Fender")

  end

  def test_set_max_capacity
    @room_1.set_max_capacity
    assert_equal(3, @room_1.max_capacity)
  end

  def test_create_playlist
    @room_2.create_playlist(@song_1, @song_2, @song_3)
    assert_equal( 3, @room_2.playlist.length() )
  end

  def test_get_playlist_duration
    @room_2.create_playlist(@song_1, @song_2, @song_3)
    assert_equal(725, @room_2.get_playlist_duration())
  end


  def test_check_in__success
    @room_1.check_in(@guest_list_1)
    assert_equal(@guest_list_1, @room_1.guest_list())
  end

  def test_check_in__additional_single_guest
    @room_2.check_in(@guest_list_1)
    @room_2.check_in(@guest_4)
    assert_equal(4, @room_2.guest_list.count())
  end

  def test_check_in__maxed_capacity
    @room_1.check_in(@guest_list_1)
    assert_equal("Room #{@room_1.name()} is full", @room_1.check_in(@guest_4))
  end

  def test_check_out__single_guest
    @room_1.check_in(@guest_list_1)
    @room_1.check_out(@guest_2)
    assert_equal(2, @room_1.guest_list.count())
  end

  def test_check_out__multiple_guests
    @room_1.check_in(@guest_list_1)
    @room_1.check_out(@guest_2, @guest_3)
    assert_equal(1, @room_1.guest_list.count())
  end

  # def test_check_out
#p.p.p.h. = 30, min 1 hour
# entry fee based on max number of guest. Can be less (if someone decides to leave earlier) but to have more guests than initially checked in fee needs to be recalculated
  # def test_calculate_entry_fee
  # price_per_person = 20
  #
  # assert_equal(price_per_person * @guest_list_1.count(), @room_1.calculate_entry_fee())
  # end



end
