class TodoItem < ActiveRecord::Base
  belongs_to :project

  attr_accessible :state, :title, :project_id

  validates :state, :project, :title, presence: true

  scope :opened, -> { where(state: 'open') }
  scope :closed, -> { where(state: 'closed') }
  scope :grouped_by_days, -> { group('todo_items.created_at::date') }
  scope :recent, -> { where('todo_items.created_at::date = current_date') }

  state_machine :state, :initial => :open do
    event :close do
      transition :open => :closed
    end

    event :open do
      transition :closed => :open
    end
  end

  def self.available_states
    %w|open closed|
  end

  def available_projects
    Project.all
  end

  def opened?
    open?
  end
end
