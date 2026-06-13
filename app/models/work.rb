class Work < ApplicationRecord
  has_many :work_tags, dependent: :destroy
end
