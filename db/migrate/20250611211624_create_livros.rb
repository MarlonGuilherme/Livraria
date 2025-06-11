class CreateLivros < ActiveRecord::Migration[8.0]
  def change
    create_table :livros do |t|
      t.string :nome
      t.text :descricao
      t.references :autor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
