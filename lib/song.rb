require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []

# def initialize(name)
#   @name = name
#   @@all << self
# end

  def self.all
    @@all
  end

  def save
    self.class.all << self  #Song.all
  end

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.find do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    if !self.find_by_name(name) #self.find_by_name(song_name) || self.create_by_name(song_name)
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name }
  end

def self.new_from_filename(name)

  artist_name = name.split(/\s-\s|\./)[0]
  song_name = name.split(/\s-\s|\./)[1] # gsub(".mp3", "")
  song = self.new

  song.artist_name = artist_name
  song.name = song_name
  song

#binding.pry
end

def self.create_from_filename(name)
  artist_name = name.split(/\s-\s|\./)[0]
  song_name = name.split(/\s-\s|\./)[1]
  song = self.create

  song.artist_name = artist_name
  song.name = song_name
  song
end

def self.destroy_all
  self.all.clear
end


end # end of Class Song
