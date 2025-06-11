class CreateAluguels < ActiveRecord::Migration[8.0]
  def change
    create_table :aluguels do |t|
      t.references :usuario, null: false, foreign_key: true
      t.references :livro, null: false, foreign_key: true
      t.date :data_inicial
      t.date :data_entrega

      t.timestamps
    end
  end
end
