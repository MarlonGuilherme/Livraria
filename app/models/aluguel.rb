class Aluguel < ApplicationRecord
  belongs_to :usuario
  belongs_to :livro

  validates :data_inicial, :data_entrega, presence: true
end
