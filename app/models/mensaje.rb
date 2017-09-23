class Mensaje < ApplicationRecord
  belongs_to :usuario
  validates :contenido, presence: true
  scope :para_mostrar, -> { order(:created_at).last(50) }

  # Cap 6.2
  # Devuelve una lista de usuarios mencionados en el contenido del mensaje
  def menciones
  	contenido.scan(/@(#{Usuario::NOMBRE_USUARIO})/).flatten.map do |nombre|
  		Usuario.find_by(nombre_usuario: nombre)
  	end.compact
  end
end
