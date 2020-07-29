class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags do |t|
      t.string :content
      t.integer :movie_id



      t.timestamps
    end
    
  end
end
