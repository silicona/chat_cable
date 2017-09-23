class MensajesController < ApplicationController

	# Metodo usuario_accedido en application_controller.rb
	before_action :usuario_accedido
	before_action :obtener_mensajes

	def index
	end

	def create
		mensaje = usuario_actual.mensajes.build(parametros_mensaje)

		if mensaje.save
			
			# Cap 5.3 - Renderizar mensajes
			ActionCable.server.broadcast 'sala_channel',
																	 mensaje: renderiza_mensaje(mensaje)

			# Cap 6.2
			mensaje.menciones.each do |mencion|
				ActionCable.server.broadcast "sala_channel_usuario_#{mencion.id}", 
																		 mention: true,
																		 autor: mensaje.usuario
			end

			# Cap 4.1 - Método broadast del servidor
			# 	ActionCable.server.broadcast "nombre_stream", <hash datos>
			#ActionCable.server.broadcast 'sala_channel',
			#														 contenido: mensaje.contenido,
			#														 nombre_usuario: mensaje.usuario.nombre_usuario
			#head :ok

			#redirect_to mensajes_url
			#else
			#render 'index'
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

		# Cap 5.3
		def renderiza_mensaje(mensaje)
			render(partial: 'mensaje', locals: { mensaje: mensaje})
		end
		
end
