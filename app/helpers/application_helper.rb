module ApplicationHelper
    def login_helper
        nav_string = ''
        if user_signed_in?
            nav_string << "<li class='nav-item'>" + (link_to 'logout', destroy_user_session_path, method: :delete, class: "nav-link") + "</li> " + "<li class='nav-item'>" + (link_to 'account', edit_user_registration_path, class: "nav-link #{is_active? edit_user_registration_path}") + "</li>"
            nav_string.html_safe
        else 
            nav_string << "<li class='nav-item'>" + (link_to 'login', new_user_session_path, class: "nav-link #{is_active? new_user_session_path}") + "</li> " + "<li class='nav-item'>" + (link_to 'register', new_user_registration_path, class: "nav-link #{is_active? new_user_registration_path}") + "</li>"
            nav_string.html_safe
        end
    end

    def is_active?(path)
        'active' if current_page? path
    end

end