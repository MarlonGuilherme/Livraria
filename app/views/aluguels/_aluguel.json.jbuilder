json.extract! aluguel, :id, :usuario_id, :livro_id, :data_inicial, :data_entrega, :created_at, :updated_at
json.url aluguel_url(aluguel, format: :json)
