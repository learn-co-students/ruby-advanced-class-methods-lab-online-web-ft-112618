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
    song = self.new #instantiates a new instance of the Song class
    song.save #saves the song instance to the @@all class variable by way of the save method
    song #returns the new song as it now exists in the array assigned to @@all
    #@@all << song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
    # self.name = song
    # song
    #create
    #song.name = name
    #song.name = name
  end

  def self.create_by_name(name)
    self.new_by_name(name).save
    self.all[-1]
    # song = Song.new
    # song.name = name
    # song.save
  end

  def self.find_by_name(name)
    self.all.find { |song| song.name == name }
    # if !self.all.include?(name) #if song is not already in self...
    #   self.create_by_name(name) #create a new song
    #else
    #end
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
    # if self.find_by_name(name) #== name
    # else self.create_by_name(name)
    # end
  end

  def self.alphabetical
    self.all.sort_by { |sg| sg.name }
  end

  def self.new_from_filename(name)
    #binding.pry
    artist_name, song_name = name.gsub(".mp3", "").split(" - ")
    # properties = { }
    # properties[:name] = name.split #how do I get to the name only? get what's after the " - "#what? the song name from the instantiazted object
    # properties[:artist_name] = name.split #how do I get to the artist name only? get what's before the " - "#what? the artist_name from the instantiated object
    song = self.new_by_name(song_name)
    song.artist_name = artist_name #instance variable is being set to the artist name string
    song
    #How can I split the string into name and artist_name and remove the - and .mp3?
    #I definitely need to Call .split, but on what?
     #this returns the whole string
    #this line of code needs to split the whole string at the - and remove the .mp3
    #self.all[-1].collect do { |name| name.split("-") } #call split on the last item added to the @@all array
    #Now, how can I remove the artist name and the -" ?
    #song.split("-")
    #needs to take in a filename
      #Where will I get the filename? argument passed in
    #needs to parse the incoming filename by artist name and other components using -
      #How to parse it?
      #rows = mp3_filename.split("/n")
      #mp3_filename.split("-")
        #name = data[0]
    #don't forget to remove the 'mp3' part of the string when parsing
      #end
  end

    def self.create_from_filename(name)
      song = self.new_from_filename(name)
      song.save
      song
    end

    def self.destroy_all
      @@all.clear
    end

end
