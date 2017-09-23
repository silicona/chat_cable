require 'test_helper'

class AccesoUsuariosTest < ActionDispatch::IntegrationTest

	def setup
		@usuario = usuarios(:ejemplo)
		@usuario2 = usuarios(:ejemplo2)
		@contenido = "Entrada válida"
	end

	test "Deberia acceder y poner un mensaje" do
		post acceder_url, params: { sesion: { nombre_usuario: @usuario.nombre_usuario,
																					password: "password" } }
		assert ha_accedido?
		assert_redirected_to mensajes_url
		follow_redirect!
		assert_template layout: "application"
		assert_template "index"

		assert_difference "Mensaje.count" do
			post mensajes_url, params: { mensaje: { contenido: @contenido } }, xhr: true
		end

		assert_response 200
		assert_template "mensajes/_mensaje"
		assert_template partial: "_mensaje"
		assert_select 'div.mensaje-usuario', text: @usuario.nombre_usuario
		assert_select 'div.mensaje-contenido', text: @contenido
	end

	test "No deberia poner un mensaje sin acceder" do
		get acceder_url
		assert_template "sesiones/new"
		post acceder_url, params: { sesion: { nombre_usuario: @usuario.nombre_usuario,
																					password: "" } }
		
		assert_template 'sesiones/new'
		assert flash[:danger]

		post mensajes_url, params: { mensaje: { contenido: "Sin identificar" } }
		assert_redirected_to acceder_url
		follow_redirect!
		assert_template "sesiones/new"
	end

	test "deberia reconocer las menciones" do
		acceso_como @usuario
		assert ha_accedido?
		follow_redirect!
		texto = "Esta es una mencion para @" + @usuario2.nombre_usuario + " que mi gran ilusión."
		@mencion = {mensaje: { contenido: texto}}
		@publicar = post mensajes_url, params: @mencion, xhr: true
		assert @publicar
		assert menciones?(@mencion, @usuario2.nombre_usuario)
		assert @mencion[:mensaje][:contenido], response.body
		assert_response 200

		acceso_como usuarios(:ejemplo2)
		assert ha_accedido?
		follow_redirect!
		assert_template "index"
		assert_select 'div.mensaje-contenido', @mencion
	end
end

