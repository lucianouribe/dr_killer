class Doctor < ApplicationRecord
  validates_presence_of :first_name, :last_name, :specialty, :greedy

  has_many :appointments, dependent: :destroy
  has_many :patients, through: :appointments

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  
  def doctor_full_name
    "#{first_name} #{last_name}"
  end
end
