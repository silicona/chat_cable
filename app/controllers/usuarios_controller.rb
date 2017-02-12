class UsuariosController < ApplicationController

	def new
		@usuario = Usuario.new
	end

	def create 
		@usuario = Usuario.new(parametros_usuario)
		if @usuario.save
			acceso_a @usuario
			redirect_to mensajes_url
		else
			render 'new'
		end
	end

	private

		def parametros_usuario
			params.require(:usuario).permit(:nombre_usuario, 
																			:password, 
																			:password_confirmation)
		end
end
