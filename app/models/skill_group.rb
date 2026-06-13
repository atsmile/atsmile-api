class SkillGroup < ApplicationRecord
  has_many :skills, dependent: :destroy
end
