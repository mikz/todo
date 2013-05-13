require 'test_helper'

class TodoItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'opened items' do
    assert_equal [ todo_items(:opened_old), todo_items(:opened_fresh) ], TodoItem.opened.all
  end

  test 'closed items' do
    assert_equal [ todo_items(:closed_old), todo_items(:closed_fresh) ], TodoItem.closed.all
  end

  test 'recent items' do
    assert_equal [ todo_items(:closed_fresh), todo_items(:opened_fresh) ], TodoItem.recent.all
  end
end
