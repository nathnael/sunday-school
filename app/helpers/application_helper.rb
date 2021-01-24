module ApplicationHelper
    def toastr_flash
        flash.each_with_object([]) do |(type, message), flash_messages|
          type = 'success' if type == 'notice'
          type = 'error' if type == 'alert'
          text = "<script>toastr.#{type}('#{message}', '', { closeButton: true, progressBar: true })</script>"
          flash_messages << text.html_safe if message
        end.join("\n").html_safe
    end
    
    def is_active_controller(controller_name)
      params[:controller] == controller_name ? "active" : nil
    end

    def is_active_action(action_name)
        params[:action] == action_name ? "active" : nil
    end
end
