class Song
  attr_reader :artist, :title, :length, :filename

  def initialize(artist, title, length, filename, genre)
    @artist, @title, @genre, @length, @filename = artist, title, genre, length, filename
  end

  def genre
    @genre || "Other"
  end
end
