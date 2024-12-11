class About < ApplicationRecord
  validates :content, presence: true

  def self.ransackable_attributes(auth_object = nil)
    [ "id", "content", "created_at", "updated_at" ]
  end
end
