require 'test_helper'

class MensajesControllerTest < ActionDispatch::IntegrationTest

	setup do
		@usuario = usuarios(:ejemplo)
	end

	test "Index debería requerir acceder" do
		get mensajes_url
		assert_redirected_to acceder_url
	end

	test "Index" do
		acceso_como @usuario
		get mensajes_url
		assert_response :success
	end

	test "Deberia manejar los mensajes invalidos" do
		acceso_como @usuario
		post mensajes_url, params: { mensaje: { contenido: "" } }, xhr: true
		assert_response :success
	end

	test "Debería crear un mensaje válido" do
		acceso_como @usuario
		post mensajes_url, params: { mensaje: { contenido: "Quo usque, Catilina?" } }, xhr: true
		assert_response :success
		
		assert_difference "Mensaje.count" do
			post mensajes_url, params: {mensaje: { contenido: "Quo usque?"}}, xhr: true
		end
		#assert_response :redirect
	end

end
