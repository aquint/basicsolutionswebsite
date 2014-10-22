module ApplicationHelper
	def useSheet(sheet = '')
		if sheet === 'home'
			stylesheet_link_tag    "custom", media: "all", "data-turbolinks-track" => true
		elsif sheet === 'services'
			stylesheet_link_tag    "services-styles", media: "all", "data-turbolinks-track" => true
		elseif sheet === 'msgs'
			stylesheet_link_tag    "msgs-styles", media: "all", "data-turbolinks-track" => true
		else sheet === 'contact'
			stylesheet_link_tag    "contact-styles", media: "all", "data-turbolinks-track" => true
		end

	end
end
