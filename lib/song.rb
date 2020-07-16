class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    #@@all << self.new
    #self
    #instantiation
    instance = self.new
    @@all << instance
    instance
  end

  def self.new_by_name(name)
    #instantiation
    instance = self.new
    #assign name
    instance.name = name
    #return object
    instance
  end

  def self.create_by_name(name)
    #instantiation
    #assign name to instance
    instance = self.new_by_name(name)
    #save song
    @@all << instance
    #return object
    instance
  end

  def self.find_by_name(name)
    #find song present in @@all by name
    @@all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    #accept string name for song
    #either return matching song instance
    if(find_by_name(name))
      find_by_name(name)
    #or create new with name
    else
      instance = self.create_by_name(name)
    #return new song
      instance
    end
  end

  def self.alphabetical
    @@all.sort_by{|name| name.name}
  end

  def self.new_from_filename(filename)
    #Split string by '-'
    data = filename.split('-')
    #set Song name
    name = data[1].slice!(1..data[1].length-5)
    #set artist name
    artist = data[0].slice!(0..data[0].length-2)
    #instance of song
    instance = self.new
    #initialize artist_name
    instance.artist_name = artist
    #initialize Song name
    instance.name = name
    #return Song
    instance
  end

  def self.create_from_filename(filename)
    #Split string by '-'
    data = filename.split('-')
    #set Song name
    name = data[1].slice!(1..data[1].length-5)
    #set artist name
    artist = data[0].slice!(0..data[0].length-2)
    #instance of song
    instance = self.new
    #initialize artist_name
    instance.artist_name = artist
    #initialize Song name
    instance.name = name
    #return Song
    @@all << instance
  end
  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    self.class.all << self
  end

end
