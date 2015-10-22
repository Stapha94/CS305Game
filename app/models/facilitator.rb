class Facilitator < ActiveRecord::Base
<<<<<<< HEAD
=======
  has_many :students
>>>>>>> Paul's_Branch
  has_secure_password
  # Returns the hash digest of the given string.
  def Facilitator.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
