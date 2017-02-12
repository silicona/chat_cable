require 'test_helper'

class SesionesControllerTest < ActionDispatch::IntegrationTest

	def setup
		@usuario = usuarios :ejemplo
	end

	test "Página de acceder" do
		get acceder_url
		assert_response :success
	end

	test "Acceso inválido" do
		post acceder_url, params: { sesion: { nombre_usuario: @usuario.nombre_usuario,
																					password: "" } }
		assert_response :success
		assert_template 'new'
	end

	test "Acceso válido y cierre de sesión" do
		post acceder_url, params: { sesion: { nombre_usuario: @usuario.nombre_usuario,
																					password: "password" } }
		assert ha_accedido?
		assert_redirected_to mensajes_url
		delete salir_url
		assert_not ha_accedido?
		assert_redirected_to acceder_url
	end

end
