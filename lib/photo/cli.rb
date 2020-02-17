class Photo::CLI

  def call
    display_photos
    photoalbum
    done
  end

  def display_photos
    puts "Welcome to the Photo List, please wait for the albums to load and then select an album number to see the photos inside"

    @photos = Photo::Album.now
    @photos.each.with_index(1) do |photo, i|
      puts "(#{i}). #{photo.albumId}"
    end
  end

  def photoalbum
    puts "Please select the photo-album you want to see:"
    input = nil
    while input != "exit"
      input = gets.strip.downcase

      if input.to_i > 0 && input.to_i < 101
        the_photo = @photos[input.to_i - 1]
        puts "#{the_photo.albumId} #{the_photo.id} #{the_photo.title} #{the_photo.url} #{the_photo.thumbnailUrl}"
        puts "Scroll above to see your photos! Then, type another number to see another album or type exit to terminate program:"
      else
        puts "Only photo-albums between 1-100"
      end
    end
  end

  def done
    puts "Goodbye!"
  end

end
