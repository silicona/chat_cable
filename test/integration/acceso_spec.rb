RSpec.describe ControladorSesion do
	describe "get index" do
		get :index
		expect(response).to render_template('index')
	end
end