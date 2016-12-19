require 'mp3info'

class Directory
  attr_reader :songs

  def initialize(location)
    @location = location
    @songs = []

    sorted_files = Dir.glob("#{location}/*.mp3").sort_by {|filename| File.birthtime(filename) }
    sorted_files.reverse.each do |filename|
      Mp3Info.open(filename) do |mp3|
        @songs << Song.new(mp3.tag.artist, mp3.tag.title, mp3.length.round, filename, mp3.tag.genre_s)
      end
    end
  end

  def songs_per_genre
    @songs.inject({}) do |memo, song|
      memo[song.genre] = [] unless memo[song.genre]
      memo[song.genre] << song
      memo
    end
  end

  def latest_song
    @songs.first
  end

  def songs_newer_than(song)
    @songs.take_while {|s| s.filename != song.filename}
  end
end
