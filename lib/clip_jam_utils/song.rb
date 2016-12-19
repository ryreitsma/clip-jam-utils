class Song
  attr_reader :artist, :title, :length, :location

  def initialize(artist, title, length, location, genre)
    @artist, @title, @genre, @length, @location = artist, title, genre, length, location
  end

  def genre
    @genre || "Other"
  end

  def filename
    File.basename(@location)
  end
end
