class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end 

  def self.create
    created_song = self.new 
    created_song.save 
    created_song     
  end 

  def self.create_by_name(song_name)
    created_song = self.new 
    created_song.name = song_name 
    created_song.save 
    created_song 
  end 
  
  def self.new_by_name(song_name)
    new_song = self.new 
    new_song.name = song_name 
    new_song 
  end
  
  def self.find_by_name(song_name)
    @@all.detect { |song| song.name == song_name }
  end
  
  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)  
  end 

  def self.alphabetical
    self.all.to_a.sort_by { |song| song.name  }
  end

  def self.new_from_filename(file_name)
    new_song = self.new
    split_file_name = file_name.split("-")
    new_song.artist_name = split_file_name[0].strip 
    new_song.name = split_file_name[1].strip.gsub(".mp3", "")
    new_song 
  end 

  def self.create_from_filename(file_name)
    new_song = self.new
    split_file_name = file_name.split("-")
    new_song.artist_name = split_file_name[0].strip 
    new_song.name = split_file_name[1].strip.gsub(".mp3", "")
    self.all << new_song
  end
  
  def self.destroy_all
    self.all.clear 
  end 

  def save
    self.class.all << self
  end 

end
