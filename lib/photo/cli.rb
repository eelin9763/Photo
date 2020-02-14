class Photo::CLI

  def call
    display_photos
    photoalbum
    done
  end

  def display_photos
    puts "Photos"

    @photos = Photo::Album.now
    @photos.each.with_index(1) do |photo, i|
      puts "#{i}. #{photo.albumId} - #{photo.id} - #{photo.title} - #{photo.url} - #{photo.thumbnailUrl}"
    end
  end

  def photoalbum
    puts "Enter the photo-album you want to see:"
    input = nil
    while input != "exit"
      input = gets.strip.downcase

      if input.to_i > 0 
        the_photo = @photos[input.to_i - 1]
        puts "#{the_photo.albumId} - #{the_photo.id} - #{the_photo.title} - #{the_photo.url} - #{the_photo.thumbnailUrl}"
      else
        puts "Only photo-albums between 1-50"
      end
    end
  end

  def done
    puts "Goodbye!"
  end

end
