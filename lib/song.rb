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
	song.save
	song
end

def self.new_by_name(song_name)
	song = self.new
	song.name = song_name
	song
end

def self.create_by_name(song_name)
	song = self.create
	song.name = song_name
	song
end

def self.find_by_name(song_name)
	@@all.detect {|song| song.name == song_name}
end

def self.find_or_create_by_name(song_name)
	self.find_by_name(song_name) || self.create_by_name(song_name)
end

def self.alphabetical
	self.all.sort_by{|song| song.name.downcase}
end

def self.new_from_filename(filename)
	song_data = filename.gsub(".mp3", "").split(" - ")
	song_name, artist_name = song_data[1], song_data[0]
  binding.pry
	song = self.new_by_name(song_name)
	song.artist_name = artist_name
  song
end

def self.create_from_filename(filename)
	song_data = filename.gsub(".mp3", "").split(" - ")
	song_name, artist_name = song_data[1], song_data[0]
	song = self.create_by_name(song_name)
	song.artist_name = artist_name
  song
end

def self.destroy_all
	@@all.clear
end

end
