require_relative 'clip_jam_utils/directory'
require_relative 'clip_jam_utils/m3u_playlist'
require_relative 'clip_jam_utils/song'

class ClipJamUtils
  def self.create_recently_added_playlist(location, size)
    directory = Directory.new(location)

    playlist = M3uPlaylist.new('Recently added', directory.songs.take(size))
    playlist.save(location)
  end

  def self.create_playlist_per_genre(location)
    directory = Directory.new(location)

    directory.songs_per_genre.each do |genre, songs|
      playlist = M3uPlaylist.new(genre.gsub("/", "+"), songs)
      puts "Start writing playlist #{genre}"
      playlist.save(location)
    end
  end

  def self.sync_recent_files(source_location, target_location)
    source_directory = Directory.new(source_location)
    target_directory = Directory.new(target_location)

    songs_to_sync = source_directory.songs_newer_than(target_directory.latest_song)

    songs_to_sync.each do |song|
      puts "Copying from #{song.location} to #{target_location}/#{song.filename}"
      FileUtils.cp("#{song.location}", "#{target_location}/#{song.filename}")
    end
  end
end
