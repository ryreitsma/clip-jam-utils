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

class Sync < Thor
  desc "recent_files", "Syncs recently added files to the Clip Jam"
  method_option :source_directory, default: '/Users/roelof/Google Drive/Music/Automatically Add to iTunes', aliases: '-s'
  method_option :target_directory, default: '/Volumes/NO NAME/MUSIC', aliases: '-t'
  def recent_files
    puts "You specified source directory #{options[:source_directory]}"
    puts "You specified target directory #{options[:target_directory]}"

    ClipJamUtils.sync_recent_files(options[:source_directory], options[:target_directory])
  end
end
