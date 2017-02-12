class MensajesController < ApplicationController

	before_action :usuario_accedido
	before_action :obtener_mensajes

	def index
	end

	def create
		mensaje = usuario_actual.mensajes.build(parametros_mensaje)

		if mensaje.save
			redirect_to mensajes_url
		else
			render 'index'
		end
	end

	private

		def obtener_mensajes
			@mensajes = Mensaje.para_mostrar
			@mensaje = usuario_actual.mensajes.build
		end

		def parametros_mensaje
			params.require(:mensaje).permit(:contenido)
		end
		
end
