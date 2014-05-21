module ApplicationHelper

	def flash_class(type)
		case type
		when :alert
			"alert-error"
		when :notice
			"alert-success"
		else
			""
		end
	end

	def page_header(&block)
		content_tag(:div, capture(&block), class: 'page-header')
	end

	def avatar_profile_link(user, image_options={}, html_options={})
		avatar_url = user.avatar? ? user.avatar.url(:thumb) : user.gravatar_url
		link_to(image_tag(avatar_url, image_options), profile_path(user.profile_name), html_options)
	end

	def status_document_link(status)
		html = ""
		if status.document && status.document.attachment?
			html << content_tag(:span, "Attachment", class: "label label-info")
			html << " = "
			html << link_to(status.document.attachment_file_name, status.document.attachment.url)
			return html.html_safe
		end
	end

	def can_display_status?(status)
		signed_in? && !current_user.has_blocked?(status.user) || !signed_in?
	end
end
