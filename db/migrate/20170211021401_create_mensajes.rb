class CreateMensajes < ActiveRecord::Migration[5.0]
  def change
    create_table :mensajes do |t|
      t.text :contenido
      t.references :usuario, foreign_key: true

      t.timestamps
    end
  end
end
