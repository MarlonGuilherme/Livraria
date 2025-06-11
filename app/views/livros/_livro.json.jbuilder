json.extract! livro, :id, :nome, :descricao, :autor_id, :created_at, :updated_at
json.url livro_url(livro, format: :json)
