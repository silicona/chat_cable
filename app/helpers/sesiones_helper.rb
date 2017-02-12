module SesionesHelper

	# Da acceso al usuario dado
	def acceso_a(usuario)
		cookies.signed[:usuario_id] = usuario.id
	end

	def cerrar_sesion
		cookies.delete(:usuario_id)
		@usuario_actual = nil
	end

	# Devuelve el actual usuario_accedido (si hay)
	def usuario_actual
		@usuario_actual ||= Usuario.find_by(id: cookies.signed[:usuario_id])
	end

	# Devuelve true si el usuario ha accedido
	def ha_accedido?
		!usuario_actual.nil?
	end

end
