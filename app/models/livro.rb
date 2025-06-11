class Livro < ApplicationRecord
  belongs_to :autor
  has_many :alugueis, class_name: "Aluguel", dependent: :destroy

  validates :nome, :descricao, :autor_id, presence: true
end
