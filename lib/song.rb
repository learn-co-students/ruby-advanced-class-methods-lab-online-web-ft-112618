class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  #instantiaes and saves the song and it returns the new song that was created
  def self.create
    song = self.new   
    song.save 
    song 
  end 

  #intantiates a song with a name property
  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song 
  end 

  #instantiates and saves a song with a name property
  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    song.save 
    song   
  end 

  #find a song present in @@all by name
  def self.find_by_name(song_name)
    self.all.detect {|i| i.name == song_name}
  end 

  #invokes .find_by_name and .create_by_name instead of repeating code
  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end 

  #returns all the song instances in alphabetical order by song name
  def self.alphabetical
    self.all.sort_by{|i| i.name}
  end 

  #initializes a song and arist name based on the filename format
  def self.new_from_filename(filename)
    song = self.new 
    song.name = (filename.split(" - ")[1].chomp(".mp3"))
    song.artist_name = (filename.split(" - ")[0])
    @@all << song 
    song 

  end 

  #initializes and saves a song and artist name based on the filename format
  def self.create_from_filename(filename)
    song = self.new 
    song.name = (filename.split(" - ")[1].chomp(".mp3"))
    song.artist_name = (filename.split(" - ")[0])
    @@all << song 
  end 

  #clears all the song instances from the @@all array
  def self.destroy_all
    @@all.clear
  end   
end
