class CreatePrototypeThumbnails < ActiveRecord::Migration
  def change
    create_table :prototype_thumbnails do |t|
      t.references :ptorotype
      t.text :image
      t.integer :state
      t.timestamps null: false
    end
  end
end
