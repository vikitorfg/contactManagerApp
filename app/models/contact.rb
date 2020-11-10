class Contact < ApplicationRecord
    validates :name, presence: true
    belongs_to :user
    has_many :information, dependent: :destroy
end
