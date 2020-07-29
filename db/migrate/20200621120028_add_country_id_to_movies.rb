class AddCountryIdToMovies < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :country_id, :string
    add_column :movies, :site_id, :string
  end
end
