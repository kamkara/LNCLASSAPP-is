class Course < ApplicationRecord
  belongs_to :level
  belongs_to :material
  belongs_to :user
end
