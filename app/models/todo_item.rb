class TodoItem < ActiveRecord::Base
	belongs_to :todo_list
	has_many :users , :through => :todo_lists

	# deafult_scope: { due_date: :desc}
	default_scope { order due_date: :asc } 

	def get_completed_count
	end
end
