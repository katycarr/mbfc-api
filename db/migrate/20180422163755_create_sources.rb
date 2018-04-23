class CreateSources < ActiveRecord::Migration[5.1]
  def change
    create_table :sources do |t|
      t.string :name
      t.string :url
      t.integer :bias_id
      t.integer :factual_rating_id

      t.timestamps
    end
  end
end
