class TodoItem < ActiveRecord::Base
  belongs_to :project
  attr_accessible :state, :title
end
