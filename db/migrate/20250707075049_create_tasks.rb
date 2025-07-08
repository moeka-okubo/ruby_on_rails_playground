class CreateTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.boolean :completed
      t.boolean :is_deleted

      t.timestamps
    end
  end
end
