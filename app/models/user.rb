class User < ActiveRecord::Base
	validates :name, :username, :password, presence: :true
	validates :name, length: { maximum: 35 }
	validates :role, inclusion: { in: %w(admin receptionist customer), message: "%{value} is not a valid role" }
end
