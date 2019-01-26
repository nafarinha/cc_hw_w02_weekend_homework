require("minitest/autorun")
require("minitest/rg")
require_relative("../guest")
require_relative("../song")

class TestGuest < MiniTest::Test

  def setup
    @guest_1 = Guest.new("John", 28, 25)
    @guest_2 = Guest.new("Kate", 25, 100)
    @guest_3 = Guest.new("Jack", 33, 80)
    @guest_4 = Guest.new("Mary", 31, 50)

    @song_1 = Song.new("R.E.M.", "Loosing My Religion", 268, "Pop", "Oh, life is bigger \nIt's bigger than you and you are not me")
    @song_2 = Song.new("Goo Goo Dolls", "Iris", 289, "Pop", "And I'd give up forever to touch you \n'Cause I know that you feel me somehow")
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


end
