require_relative 'clip_jam_utils/directory'
require_relative 'clip_jam_utils/m3u_playlist'
require_relative 'clip_jam_utils/song'

class ClipJamUtils
  def self.create_recently_added_playlist(directory, size)
    directory = Directory.new(directory)

    playlist = M3uPlaylist.new('Recently added', directory.songs.take(size))
    playlist.save(directory)
  end

  def self.create_playlist_per_genre(directory)
    directory = Directory.new(directory)

    directory.songs_per_genre.each do |genre, songs|
      playlist = M3uPlaylist.new(genre.gsub("/", "+"), songs)
      puts "Start writing playlist #{genre}"
      playlist.save(directory)
    end
  end
end
