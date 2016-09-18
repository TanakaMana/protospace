class CreatePrototypes < ActiveRecord::Migration
  def change
    create_table :prototypes do |t|
      t.references :prototype_id
      t.text :image
      t.integer :state
      t.timestamps
    end
  end
end
