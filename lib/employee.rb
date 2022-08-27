class Employee < ActiveRecord::Base
  belongs_to :store
  validates :first_name, presence: { message: "must be given please" }
  validates :last_name, presence: { message: "must be given please" }
  validates :hourly_rate, numericality: { only_integer: true, in: 40..200, message: "must be an integer between 40 and 200" }
  validates :store_id, presence: { message: "must be given please" }

end
