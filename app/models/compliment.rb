class Compliment < ApplicationRecord
  belongs_to :parent
  belongs_to :sitter
  validates :content, presence: true, length: { minimum: 3 }
end
