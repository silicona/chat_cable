class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SesionesHelper

  # Confirma un usuario accedido
  def usuario_accedido
  	unless ha_accedido?
  		flash[:danger] = "Por favor, accede primero"
  		redirect_to acceder_url
  	end
  end
end
