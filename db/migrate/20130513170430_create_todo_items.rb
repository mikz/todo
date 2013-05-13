class CreateTodoItems < ActiveRecord::Migration
  def change
    create_table :todo_items do |t|
      t.string :title
      t.string :state
      t.belongs_to :project

      t.timestamps
    end
    add_index :todo_items, :project_id
  end
end
