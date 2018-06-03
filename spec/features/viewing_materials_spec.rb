require 'rails_helper'
RSpec.feature "Usuarios pueden materiales dentro de cursos" do 
	scenario "ven detalles del material" do 
		course = Course.create(name: "Matemáticas", description: "Es un curso de matemáticas básicas")
		material = Material.create(name: "Presentación PPT, Pitágoras", description: "Presentación de la primera clase", file: "www.drive.com/file", course_id: course.id)
		user = User.create(name: "Cecilia López", email: "cecilia@email.com", password: "qwerty123", password_confirmation: "qwerty123")
		visit "/"
		click_link "Iniciar Sesión"
		fill_in "user_email", with: "cecilia@email.com"
		fill_in "user_password", with: "qwerty123"
		click_button "Log in"
		click_link "Matemáticas"
		click_link "Presentación PPT, Pitágoras"
		expect(page.current_url).to eq course_material_url(course, material)
		expect(page).to have_content "Presentación PPT, Pitágoras"
	end
end


