require("minitest/autorun")
require("minitest/rg")
require_relative("../song.rb")


class TestSong < MiniTest::Test

  def setup

    @song_1 = Song.new("R.E.M.", "Loosing My Religion", 268, "Pop", "Oh, life is bigger \nIt's bigger than you and you are not me")
    @song_2 = Song.new("Goo Goo Dolls", "Iris", 289, "Pop", "And I'd give up forever to touch you \n'Cause I know that you feel me somehow")
    @song_3 = Song.new("Jimmy Eat World", "The Middle", 168, "Pop", "Hey \nDon't write yourself off yet")
    @song_4 = Song.new("Kelly Clarkson", "Stronger" , 0, "Pop", "You know the bed feels warmer \nSleeping here alone")
    @song_5 = Song.new("Neil Diamond", "Sweet Caroline", 204, "70's", "Where it began \nI can't begin to knowin'")
    @song_6 = Song.new("Shania Twain", "Man! I Feel Like a Woman!", 233, "Country", "I'm going out tonight \nI'm feelin' alright")
    @song_7 = Song.new("Frank Sinatra", "My Way", 276, "Jazz", "And now, the end is near \nAnd so I face the final curtain")
    @song_8 = Song.new("Oasis", "Wonderwall", 258, "Rock", "Today is gonna be the day that they're gonna throw it back to you")

    @song_9 = Song.new("Oasis", "Don't Look Back In Anger", 287, "Rock", "Slip inside the eye of your mind \nDon't you know you might find")

    @song_10 = Song.new("Lynyrd Skynyrd", "Sweet Home Alabama", 283, "Rock", "Big wheels keep on turning \nCarry me home to see my kin")
    @song_11 = Song.new("Gloria Gaynor", "I Will Survive", 0, "R&B", "At first I was afraid, I was petrified \nKept thinkin' I could never live without you by my side")
  end

  def test_get_artist
    assert_equal("R.E.M.", @song_1.artist())
  end

  def test_get_title
    assert_equal("Iris", @song_2.title())
  end

  def test_get_duration
    assert_equal(168, @song_3.duration())
  end

  def test_get_genre
    assert_equal("Pop", @song_4.genre())
  end

  def test_get_lyrics

    assert_equal("Where it began \nI can't begin to knowin'", @song_5.lyrics())
  end







end
