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
    song.save
    song
  end
  
    def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end
  
  def self.create_by_name(name)
    new_song = self.create
    new_song.name = name
    new_song
  end
  
  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    create_by_name(name)
    find_by_name(name)
  end 

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end
  
  def self.new_from_filename(name)
    data = name.split(/[-.]/)
    song = Song.new
    song.artist_name = data[0].strip
    song.name = data[1].strip
    song
  end
  
  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end

  def self.destroy_all
    @@all.clear
  end
  
end
