class Autor < ApplicationRecord
  has_many :livros, dependent: :destroy

  validates :nome, presence: true
end