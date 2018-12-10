require 'pry'
class Song
  attr_accessor :name, :artist_name
  
  @@all = []
  
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
   song = self.new
   @@all << song
   song
  end
  
  def self.new_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end  
  
  def self.create_by_name(name)
    
    song = self.new
    song.name = name
    song.save
    song    
  end
  
  def self.find_by_name(name)
    @@all.each.find { |song| song.name == name  }
  end
  
  def self.find_or_create_by_name(name)
    
    my_song = self.find_by_name(name)
    
    if my_song == nil
      my_song = self.create_by_name(name)
    end
      my_song
  end
  
  def self.alphabetical
    @@all.sort_by { |song| song.name}
  end
  
  def self.new_from_filename(filename)
    song = self.new
    split_array = filename.split(" - ")
    song.artist_name = split_array[0]
    song_name_array = split_array[1].split(".mp3")
    song.name = song_name_array[0]
    song
    #binding.pry
    
  end
  
  def self.create_from_filename(filename)
    song = self.new
    split_array = filename.split(" - ")
    song.artist_name = split_array[0]
    song_name_array = split_array[1].split(".mp3")
    song.name = song_name_array[0]
    @@all << song
    song
    
  end
  
  def self.destroy_all
    @@all.clear
  end
end
