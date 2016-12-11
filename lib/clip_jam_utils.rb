require 'mp3info'
require_relative 'clip_jam_utils/m3u_playlist'
require_relative 'clip_jam_utils/song'

class ClipJamUtils
  def self.create_recently_added_playlist(directory, size)
    playlist = M3uPlaylist.new('Recently added')

    sorted_files = Dir.glob("#{directory}/*.mp3").sort_by {|filename| File.mtime(filename) }
    sorted_files.reverse.take(size).each do |filename|
      Mp3Info.open(filename) do |mp3|
        playlist.add_song(Song.new(mp3.tag.artist, mp3.tag.title, mp3.length.round, File.basename(filename)))
      end
    end

    playlist.save(directory)
  end
end
