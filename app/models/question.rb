class Question < ActiveRecord::Base
  has_many :answers
  has_many :students, through: :answers
end
