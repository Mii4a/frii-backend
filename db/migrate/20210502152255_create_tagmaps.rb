class CreateTagmaps < ActiveRecord::Migration[6.0]
  def change
    create_table :tagmaps do |t|
      t.integer :user_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
