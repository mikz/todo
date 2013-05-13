class Project < ActiveRecord::Base
  attr_accessible :description, :name
  has_many :todo_items

  def done?
    todo_items(true).all?(&:closed?)
  end
end
