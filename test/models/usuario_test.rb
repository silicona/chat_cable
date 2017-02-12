require 'test_helper'

class UsuarioTest < ActiveSupport::TestCase

	def setup
		@usuario = Usuario.new(nombre_usuario: "Lucrecia",
													 password: "password",
													 password_confirmation: "password")
	end

	test "Debería ser válido" do
		assert @usuario.valid?, @usuario.errors.full_messages
	end 

	test "El nombre de usuario debería estar presente" do
		@usuario.nombre_usuario	= ""
		assert_not @usuario.valid?
	end

	test "El nombre de usuario debería ser único" do
		usuario_duplicado = @usuario.dup
		usuario_duplicado.nombre_usuario = @usuario.nombre_usuario.upcase
		@usuario.save
		assert_not usuario_duplicado.valid?
	end

	test "El nombre de usuario tiene longitud máxima" do
		@usuario.nombre_usuario = "a" * 16
		assert_not @usuario.valid?
	end

	test "El nombre de usuario tiene formato adecuado" do
		%w[foo bar foobar foo_bar FooBar8].each do |nombre|
			@usuario.nombre_usuario = nombre
			assert @usuario.valid?, @usuario.nombre_usuario
		end

		%w[foo-bar foobar$ *bar].each do |nombre|
			@usuario.nombre_usuario = nombre
			assert_not @usuario.valid?, @usuario.nombre_usuario
		end
	end

	test "La contraseña deberia estar presente" do
		@usuario.password = @usuario.password_confirmation = " " * 8
		assert_not @usuario.valid?
	end

	test "La contraseña tiene longitud mínima" do
		@usuario.password = @usuario.password_confirmation = "a" * 5
		assert_not @usuario.valid?
	end
end
