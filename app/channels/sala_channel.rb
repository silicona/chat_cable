# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class SalaChannel < ApplicationCable::Channel
  def subscribed 	# Evento provocado por un usuario al suscribirse
  	
  	# Accion a realizar cuando el evento tenga lugar
    # stream_from "some_channel"
    stream_from "sala_channel"
    stream_from "sala_channel_usuario_#{usuario_mensaje.id}"

  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
