class SesionesController < ApplicationController

	def new
	end

	def create
		usuario = Usuario.find_by(nombre_usuario: params[:sesion][:nombre_usuario].downcase)

		if usuario && usuario.authenticate(params[:sesion][:password])
			acceso_a usuario
			redirect_to mensajes_url
		else
			flash.now[:danger] = 'Nombre de usuario o contraseña erroneo'
			render 'new'
		end
	end

	def destroy
		cerrar_sesion
		redirect_to acceder_url
	end
end