class Doctor < ApplicationRecord
  validates_presence_of :first_name, :last_name, :specialty

  has_manu :appointments, dependent: :destroy
  has_many :patients, through: :appointments
end
