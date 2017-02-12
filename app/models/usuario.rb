class Usuario < ApplicationRecord

	has_many :mensajes

	NOMBRE_USUARIO = /\w+/

	validates :nombre_usuario, presence: true,
														 uniqueness: { case_sensitive: false },
														 format: { with: /\A#{NOMBRE_USUARIO}\z/i },
														 length: { maximum: 15 }

  validates :password, presence: true,
  										 length: { minimum: 6 }

  has_secure_password
end
