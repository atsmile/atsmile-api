class SkillGroup < ApplicationRecord
  has_many :skills, dependent: :destroy

  validates :label, presence: true
end
