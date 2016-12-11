require_relative 'lib/clip_jam_utils'

class Create < Thor
  desc "recently_added_playlist", "Creates recently added playlist"
  method_option :size, default: 100, aliases: '-s', type: :numeric
  method_option :directory, default: '/Volumes/NO NAME/MUSIC', aliases: '-d'
  def recently_added_playlist
    puts "You specified playlist size #{options[:size]}"
    puts "You specified playlist directory #{options[:directory]}"

    ClipJamUtils.create_recently_added_playlist(options[:directory], options[:size])
  end

  desc "playlist_per_genre", "Creates playlist per genre"
  method_option :directory, default: '/Volumes/NO NAME/MUSIC', aliases: '-d'
  def playlist_per_genre
    puts "You specified playlist directory #{options[:directory]}"

    ClipJamUtils.create_playlist_per_genre(options[:directory])
  end
end
