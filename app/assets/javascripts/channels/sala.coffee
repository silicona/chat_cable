App.sala = App.cable.subscriptions.create "SalaChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel

    # Cap 6.2 y prueba
    if data.mention
      usuario = data.autor
      mencionar usuario

    if(data.mensaje && !data.mensaje.blank?)
    # Cap 5.3 -Renderizado de mensajes
    #unless data.mensaje.blank?
      $('#mensajes-tabla').append data.mensaje
      desplazar_abajo()

    # Cap 4.2 - Añadiendo mensajes
    #unless data.contenido.blank?
      #$('#mensajes-tabla').append '<div class="mensaje">' + '<div class="mensaje-usuario">' + data.nombre_usuario + ":" + '</div>' + '<div class="mensaje-contenido">' + data.contenido + '</div>' + '</div>'
      #desplazar_abajo()
    
    # Cap 4.1
    # El objeto data contiene el hash de datos de ActiveCable.server.broadcast, su segundo argumento.
    #   Mensajes#create - if mensaje.save

    #alert data.contenido

    # Ejercicios
    #alert data.nombre_usuario

    # Salida por el log del servidor
    #console.log data.contenido


# Cap 4.3 - con JS
$(document).on 'turbolinks:load', ->
  enviar_mensaje()
  desplazar_abajo()

enviar_mensaje = () ->
  $('#mensaje_contenido').on 'keydown', (event) ->
    # Cap 6.1 - Permite añadir lineas al mensaje usando Shift + Enter, sin enviarlo
    if event.keyCode is 13 && !event.shiftKey
    #if event.keyCode is 13
      $('input').click()
      event.target.value = ""
      event.preventDefault()

# Desplaza la pantalla al ultimo mensaje, en funcion de #mensajes[0]
desplazar_abajo = () ->
  $('#mensajes').scrollTop($('#mensajes')[0].scrollHeight)

# Prueba
mencionar = (usuario) ->
  #alert('Tienes una mención de ' + usuario.nombre_usuario)
  crearMencion('Tienes una mención de ' + usuario.nombre_usuario)

borrarMencion = (elemento) ->
  elemento = document.getElementById(elemento)
  elemento.parentNode.removeChild(elemento)

crearMencion = (mensaje) ->
  crea = (elemento) ->
    document.createElement(elemento)

  mencion = document.getElementsByClassName('mensaje-wr')[0].appendChild(crea('div'))
  mencion.id = "mencion"
  mencion_texto = mencion.appendChild(crea('div'))
  mencion_texto.id = "mencion_texto"
  mencion_texto.innerHTML = mensaje
  mencion_boton = mencion.appendChild(crea('button'))
  mencion_boton.id = "mencion_boton"
  mencion_boton.innerHTML = "Cerrar"
  mencion_boton.onclick = () ->
    borrarMencion('mencion')





    

