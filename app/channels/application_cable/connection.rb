module ApplicationCable

  class Connection < ActionCable::Connection::Base

  	include SesionesHelper

  	# Accessor de ActionCable
  	identified_by :usuario_mensaje

    # Metodo de ActionCable
  	def connect
  		self.usuario_mensaje = encontrar_usuario_verificado
  	end

  	private

  		def encontrar_usuario_verificado 	### fin_verified_user ###
  			if ha_accedido?
  				usuario_actual
  			else

  				# Método de ActionCable
  				reject_unauthorized_connection
  			end
  		end

  end
end
