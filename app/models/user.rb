class User < ApplicationRecord
    has_many :foods
    has_many :receipts

    validates :name, presence: true
end
