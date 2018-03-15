class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    temp = self.name
    temp.gsub(/[^\s0-9A-Za-z]/, '') if temp.gsub(/[^\s0-9A-Za-z]/, '') != nil
    temp.gsub(" ", '-').downcase
  end

  def self.find_by_slug(slug)
    Genre.all.find {|genre| genre.slug == slug}
  end
end