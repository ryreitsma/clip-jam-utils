class SongList
  attr_reader :songs

  def initialize
    @songs = []
  end

  def << (song)
    @songs << song
  end

  def each(&block)
    @songs.each do |song|
      yield song
    end
  end

  def per_genre
    @songs.inject({}) do |memo, song|
      memo[song.genre] = [] unless memo[song.genre]
      memo[song.genre] << song
      memo
    end
  end
end
