require 'mp3info'
require_relative 'clip_jam_utils/m3u_playlist'
require_relative 'clip_jam_utils/song'

class ClipJamUtils
  def self.create_recently_added_playlist(directory, size)
    playlist = M3uPlaylist.new('Recently added')

    sorted_files = Dir.glob("#{directory}/*.mp3").sort_by {|filename| File.mtime(filename) }
    sorted_files.reverse.take(size).each do |filename|
      Mp3Info.open(filename) do |mp3|
        playlist << Song.new(mp3.tag.artist, mp3.tag.title, mp3.length.round, File.basename(filename), mp3.tag.genre_s)
      end
    end

    playlist.save(directory)
  end

  def self.create_playlist_per_genre(directory)
    song_list = SongList.new

    Dir.glob("#{directory}/*.mp3").each do |filename|
      Mp3Info.open(filename) do |mp3|
        song_list << Song.new(mp3.tag.artist, mp3.tag.title, mp3.length.round, File.basename(filename), mp3.tag.genre_s)
      end
    end

    song_list.per_genre.each do |genre, songs|
      playlist = M3uPlaylist.new(genre.gsub("/", "+"), songs)
      puts "Start writing playlist #{genre}"
      playlist.save(directory)
    end
  end
end
