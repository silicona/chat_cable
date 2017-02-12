class CreateUsuarios < ActiveRecord::Migration[5.0]
  def change
    create_table :usuarios do |t|
      t.string :nombre_usuario
      t.string :password_digest

      t.timestamps
    end
    add_index :usuarios, :nombre_usuario, unique: true
  end
end
