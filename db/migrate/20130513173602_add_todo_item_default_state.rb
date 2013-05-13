class AddTodoItemDefaultState < ActiveRecord::Migration
  def up
    change_column_default(:todo_items, :state, 'open')
  end

  def down
    change_column_default(:todo_items, :state, nil)
  end
end