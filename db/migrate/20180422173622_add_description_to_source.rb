class AddDescriptionToSource < ActiveRecord::Migration[5.1]
  def change
    add_column :sources, :description, :string
  end
end
