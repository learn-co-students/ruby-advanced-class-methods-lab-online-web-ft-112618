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
    song = Song.new
    song.save
    song
  end
  
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end
  
  def self.find_by_name(name)
    self.all.find {|i| i.name == name}
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
      #if !name == name
        #self.create_by_name(create_name)
      #else
        #name
      #end
  end
  
  def self.alphabetical
  self.all.sort_by { |i| i.name }
  #self.all.sort_by { |a, b| a <=> b }
  end
  
  def self.new_from_filename(file_name)
    file = file_name.split(" - ")
    artist_name = file[0]
    song_name = file[1].gsub(".mp3", "")

    song =  self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end
  
  def self.create_from_filename(file_name)
    file = file_name.split(" - ")
    artist_name = file[0]
    song_name = file[1].gsub(".mp3", "")
    
    song =  self.create
    song.name = song_name
    song.artist_name = artist_name
    #song    self.create_by_name(name)
  end
  
  def self.destroy_all
    self.all.clear
  end
  

end
