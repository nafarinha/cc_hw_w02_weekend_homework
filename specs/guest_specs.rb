require("minitest/autorun")
require("minitest/rg")
require_relative("../guest")
require_relative("../song")
require_relative("../room")

class TestGuest < MiniTest::Test

  def setup
    @guest_1 = Guest.new("John", 28, 25)
    @guest_2 = Guest.new("Kate", 25, 100)
    @guest_3 = Guest.new("Jack", 33, 80)
    @guest_4 = Guest.new("Mary", 31, 50)

    @guest_list_1 = [@guest_1, @guest_2, @guest_3]

    @song_1 = Song.new("R.E.M.", "Loosing My Religion", 268, "Pop", "Oh, life is bigger \nIt's bigger than you and you are not me")
    @song_2 = Song.new("Goo Goo Dolls", "Iris", 289, "Pop", "And I'd give up forever to touch you \n'Cause I know that you feel me somehow")
    @song_3 = Song.new("Jimmy Eat World", "The Middle", 168, "Pop", "Hey \nDon't write yourself off yet")

    @room_1 = Room.new("Ibanez")

  end

  def test_get_name
    assert_equal("John", @guest_1.name())
  end

  def test_get_age
    assert_equal(25, @guest_2.age())
  end

  def test_get_wallet_amount
    assert_equal(80, @guest_3.wallet())
  end

  def test_set_favourite_song
    assert_equal(@song_1, @guest_4.favourite_song = @song_1)
  end

  def test_cheer_favourite_song__found
    @room_1.check_in(@guest_list_1)
    @room_1.add_songs_to_playlist(@song_1, @song_2)
    @guest_1.favourite_song = @song_2
    assert_equal( "Whoo, Whooo!I love #{@song_2.artist}!", @guest_1.cheer_favourite_song(@room_1.playlist) )
  end

  def test_cheer_favourite_song__not_found
    @room_1.check_in(@guest_list_1)
    @room_1.add_songs_to_playlist(@song_1, @song_2)
    @guest_1.favourite_song = @song_3
    assert_nil(@guest_1.cheer_favourite_song(@room_1.playlist))
  end


end
