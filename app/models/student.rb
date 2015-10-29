class Student < ActiveRecord::Base
  before_save :upcase_sid
  def upcase_sid
    self.sid.upcase!
  end
  belongs_to :facilitator
end
