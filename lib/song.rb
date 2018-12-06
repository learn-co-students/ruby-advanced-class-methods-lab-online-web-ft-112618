require'pry'

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
    song = Song.new
    song.name = name 
    song 
  #binding.pry
  end 
  
  def self.create_by_name(name)
    song = Song.create
    song.name = name 
    song 
  end
  
  def self.find_by_name(name)
    @@all.find do |x|
      x.name == name
    end
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
    #binding.pry
    song
  end
  
  def self.create_from_filename(name)
    data = name.split(/[-.]/)
    song = Song.create
    song.artist_name = data[0].strip
    song.name = data[1].strip
    #binding.pry
    song
  end
  
  def self.destroy_all
    @@all.clear
  end
end
