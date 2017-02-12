require 'test_helper'

class UsuariosControllerTest < ActionDispatch::IntegrationTest

	test "Debería GET new" do
		get new_usuario_url
		assert_response :success
	end

	test "Debería rechazar un envio inválido" do
		assert_no_difference 'Usuario.count' do
			post usuarios_url, params: { usuario: { nombre_usuasrio: "",
																							password: "",
																							password_confirmation: "" } }
		end
		assert_response :success
		assert_select 'div#explicacion_error'
		assert_template 'usuarios/new'
	end

	test "Debería aceptar un envio válido" do
		assert_difference 'Usuario.count', 1 do
			post usuarios_url, params: { usuario: { nombre_usuario: "Chuck",
																							password: "password",
																							password_confirmation: "password" } }
		end
		assert ha_accedido?
		assert_redirected_to mensajes_url
	end
end
