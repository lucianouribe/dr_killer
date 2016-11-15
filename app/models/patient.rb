class Patient < ApplicationRecord
  validates_presence_of :first_name, :last_name, :insurance, :complains_of, :dying

  has_many :appointments, dependent: :destroy
  has_many :doctors, through: :appointments

  def patient_full_name
    "#{first_name} #{last_name}"
  end
end
