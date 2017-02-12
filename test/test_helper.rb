ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/reporters"
Minitest::Reporters.use!

def digerir(cadena)
	BCrypt::Password.create(cadena, cost: BCrypt::Engine::MIN_COST)
end

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  def ha_accedido?
  	!cookies['usuario_id'].empty?
  end
end

class ActionDispatch::IntegrationTest

	def acceso_como(usuario, password: "password")
		post acceder_url, params: { sesion: { nombre_usuario: usuario.nombre_usuario,
																					password: password } }
	end
end	

