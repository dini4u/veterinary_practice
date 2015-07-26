class Pet < ActiveRecord::Base
	validates :name, :breed, :weight, :age, :date_of_last_visit, presence: :true
	validates :name, :breed, length: { maximum: 35 }
	validates :pet_type, inclusion: { in: %w(dog cat bird), message: "%{value} is not a valid pet type" }
	validates :age, numericality: { only_integer: true }
	validates :weight, numericality: true
end