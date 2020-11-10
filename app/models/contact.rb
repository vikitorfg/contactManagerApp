class Contact < ApplicationRecord
    validates :name, presence: true
    has_many :information, dependent: :destroy
end
