require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end


  test 'items' do
    assert_equal [todo_items(:opened_old), todo_items(:closed_old)].sort, projects(:old).todo_items.sort
  end

  test 'done?' do
    project = projects(:old)
    refute project.done?
    project.todo_items.opened.each(&:close!)
    assert project.done?, 'project should be done'
  end
end
