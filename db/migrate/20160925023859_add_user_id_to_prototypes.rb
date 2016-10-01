class AddUserIdToPrototypes < ActiveRecord::Migration
  def change
    add_reference :prototypes, :user, index: true, foreign_key: true
    add_column :prototypes, :title, :string
    add_column :prototypes, :catchcopy, :string
    add_column :prototypes, :concept, :text
    remove_column :prototypes, :prototype_id_id, :references
    remove_column :prototypes, :image, :text
    remove_column :prototypes, :state, :integer
  end
end
