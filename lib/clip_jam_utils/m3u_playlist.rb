require_relative 'song_list'

class M3uPlaylist
  def initialize(name, songs = [])
    @name = name
    @songs = songs
  end

  def save(directory)
    # NOTE: The M3U playlist for the Clip Jam must have Windows line endings
    File.open("#{directory}/#{@name}.m3u", 'w', crlf_newline: true) do |file|
      file.write("#EXTM3U\n")

      @songs.each do |song|
        puts "Writing #{song.artist} - #{song.title}"
        file.write("#EXTINF:#{song.length},#{song.artist} - #{song.title}\n")
        file.write("#{song.filename}\n")
      end
      puts "Playlist #{@name} written to #{directory}"
    end
  end
end
