require 'test_helper'

class MensajeTest < ActiveSupport::TestCase

	setup do
		@mensaje = usuarios(:ejemplo).mensajes.build(contenido: "Quo usque, Catilina?")
	end

	test "Deberia ser válido" do
		assert @mensaje.valid?, @mensaje.errors.full_messages
	end

	test "Debería no estar vacio/blank" do
		@mensaje.contenido = "   "
		assert !@mensaje.valid?
	end
end

