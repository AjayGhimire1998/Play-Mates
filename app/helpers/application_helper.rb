module ApplicationHelper
    def active_class(link_path)
        current_page?(link_path) ? "active" : ""
    end

    def link_to_image(image_path, class_name, target_link, options={})
        link_to(image_tag(image_path, class: class_name), target_link, options)
    end

end
