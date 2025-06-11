class Usuario < ApplicationRecord
  has_many :alugueis, class_name: "Aluguel", dependent: :destroy

  validates :nome, :email, :telefone, presence: true
  validates :email, uniqueness: true
end
