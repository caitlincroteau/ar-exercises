class Store < ActiveRecord::Base
  has_many :employees
  validates :name, length: { minimum: 3, message: "must be at least 3 characters long" }
  validates :annual_revenue, numericality: { only_integer: true, greater_than_or_equal_to: 0, message: "must be an integer greater than 0" }
  validate :must_carry_mens_or_womens_clothing, on: :create

  def must_carry_mens_or_womens_clothing
    errors.add(:id, "cannot be added. Store must carry either mens_apparel or womens_apparel or both.") unless
    mens_apparel.present? || womens_apparel.present?
  end


end
