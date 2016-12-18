class Post < ActiveRecord::Base
	enum status: { submmited: 0, approved: 1,rejected: 2 }
	belongs_to :user
	validates_presence_of :date, :rationale
end
	