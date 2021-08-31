class Course < ApplicationRecord
  belongs_to :level
  belongs_to :material
  belongs_to :user

  validates :title,
            :content,
            :user_id,
            :material_id,
            :level_id,
            :slug, presence: true
 
  validates :title,
            :content,length: { minimum:20 }
  #SLUG
  extend FriendlyId
    friendly_id :title, use: :slugged

  def should_generate_new_friendly_id?
    title_changed?
  end
end
