class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, through: :songs

  def song_count
    # return the number of songs in a genre
    self.songs.length
  end

  def artist_count
    # return the number of artists associated with the genre
    self.songs.map{|song_instance| song_instance.artist_id}.uniq.length
  end

  def all_artist_names
    # return an array of strings containing every musician's name
    array = []
    for id in self.songs.map{|song_instance| song_instance.artist_id}.uniq
      array.append(Artist.find(id))
    end
    array.map{|artist|artist.name}
  end
end
