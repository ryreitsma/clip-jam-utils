class Song
  attr_reader :artist, :title, :length, :filename

  def initialize(artist, title, length, filename)
    @artist, @title, @length, @filename = artist, title, length, filename
  end
end
