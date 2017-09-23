# README

Tutorial de Action Cable inspirafo en Learn Enough Action Cable To Be Dangerous. Si utilizas este repositorio para aprender, seguramente quieras hacerlo mientras lees el tutorial de Michael Hart.

La aplicacion inicial ha sido trasladada al castellano, pero la aplicacion sigue con el idioma por defecto en ingles.

Test de la aplicacion inicial, verdes.

[Documentacion Action Cable](http://edgeguides.rubyonrails.org/action_cable_overview.html)

##Cap 4 - Action Cable
	
	$ rails g channel Sala

	Las tres piezas:

		En app/channels/sala_channel.rb

		En app/controllers/mensajes_controller.rb
			Mensajes#create

		En app/asets/javascript/sala.coffee

	Incluir ActionCable en la app:

		En config/routes.rb
			- mount ActionCable.server, at: '/cable'

###cap 4.2 - Añadiendo mensajes

	En app/assets/javascript/channels/sala.coffee

	En app/views/mensajes/_formulario_mensajes.html.erb
		- añadido remote: true para que la peticion Ajax no refresque la pagina

###Cap 4.3 - Con JS

	* En app/assets/javascript/channels/sala.coffee
	* Inicio con coffee entre aplication.js y mensajes.coffee
	* En app/assets/stylesheets/general.sass
		* Suprimido el boton de enviar en .mensaje-entrada.[textarea, input]
	* En test/controllers/mensajes_controller_test.rb:
		Test final modificado para ser ok

##Cap 5 Mejoras básicas

###5.1 Proteccion de acceso

	En app/channeĺls/application_cable/connection.rb

###5.2 Autoscroll

	En app/assets/javascript/channels/sala.coffee.rb

###5.3 Renderizado de mensajes

	En app/assets/javascript/sala.coffee

	En app/controllers/mensajes_controllers.rb
		* Mensajes#create
		* Mensajes#renderiza_mensaje

##Cap 6 Mejoras Avanzadas

###6.1 Soporte Markdown

En este enlace, la [*Documentacion Kramdown*](https://kramdown.gettalong.org/documentation.html)

####Uso en chat

	Shift + Enter - Nueva linea
	Iniciar ỳ finalizar con ``` - formatea a cita (blockquote)
	Sanitize formatea al estilo código

		En gemfile
			gem 'kramdown', '1.12.0'

    En app/helpers/mensajes_helper.rb
      def markdown_a_html(texto)

    En app/views/mensajes/_mensaje.html.erb
      <%= sanitize markdown_a_html(mensaje.contenido) %>

    En app/assets/javascript/channels/sala.coffee
      - if event.keyCode is 13 && !event.shiftKey

    En app/assets/stylesheets/general.sass
      code y blockquote

 ###6.2 Notificaciones por mención

    En app/channels/sala_channel.rb
      - stream_from "sala_channel_usuario_#{usuario_mensaje.id}"

    En app/models/mensaje.rb
      def menciones

    En app/controllers/mensajes_controller.rb
      - mensaje.menciones.each do |mencion|

    En app/assets/javascripts/channels/sala.coffee
      - alert("Tienes una mencion")
      - if(data-mensaje &&data.mensaje.blank?)

## Heroku

URL - https://calm-scrubland-80216.herokuapp.com/
Git - https://git.heroku.com/calm-scrubland-80216.git

Instalado el addons redistogo.

Documentacion - <code>heroku addons:docs redistogo</code>

URL Redistogo - redistogo-convex-90714 

<code>heroku config | grep REDISTOGO_URL</code> - obtiene la url para config/cable.yml

URL - <code>https://calm-scrubland-80216.herokuapp.com/</code>

Modificado config/environments/production.rb