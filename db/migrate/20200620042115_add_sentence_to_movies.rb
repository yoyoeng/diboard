class AddSentenceToMovies < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :sentence, :text
  end
end
