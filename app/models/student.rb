class Student < ActiveRecord::Base
  before_save :upcase_sid
  def upcase_sid
    self.sid.upcase!
  end
  belongs_to :facilitator
  has_many :answers
  has_many :questions, through: :answers
end
