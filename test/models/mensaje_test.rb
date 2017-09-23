require 'test_helper'

class MensajeTest < ActiveSupport::TestCase

	setup do
		@mensaje = usuarios(:ejemplo).mensajes.build(contenido: "Quo usque, Catilina?")
		@mensaje_mencion = usuarios(:ejemplo).mensajes.build(contenido: "Quo usque, @shilum?")
	end

	test "Deberia ser válido" do
		assert @mensaje.valid?, @mensaje.errors.full_messages
	end

	test "Debería no estar vacio/blank" do
		@mensaje.contenido = "   "
		assert !@mensaje.valid?
	end

	test "Deberia registrar las menciones" do
		# assert_difference "Mensaje.count" do
		# 	@mensaje_mencion.save
		# end
		# acceso_como usuarios(:ejemplo)
		# post mensajes_url, params: { mensaje: { contenido: "quosuqe, @shilum" } }
		# assert menciones?(@mensaje_mencion, "shilum")
		# mencionado = @mensaje_mencion.menciones
		
	end
end

