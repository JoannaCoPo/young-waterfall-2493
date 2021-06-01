class Movie < ApplicationRecord
  belongs_to :studio

  has_many :actor_movies
  has_many :actors, through: :actor_movies

  def actor_list_params
    actors = self.actors.order(:age)
    names = actors.pluck(:name).join', '
    names.distinct
  end
end
