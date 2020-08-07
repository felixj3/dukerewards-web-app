class ApplicationController < ActionController::Base
    protect_from_forgery with: :null_session
    # deactivate CSRF token authenticity
    #config.autoload_paths += "#{Rails.root}/lib"

    # Get user's NetID 
  def get_user_netID
    # if !request.headers['HTTP_X_AUTHENTICATED_INTROSPECTION'].blank?
    #     val = eval( request.headers['HTTP_X_AUTHENTICATED_INTROSPECTION'] )
    #     puts "VAL: #{val}"
    #     $uniqueID = val[:dukeUniqueID]
    #     $netID = val[:dukeNetID]
    #     puts $netID
    #     puts $uniqueID
    #end

    #UNCOMMENT LINE BELOW AND REPLACE MY NETID WITH YOUR OWN WHEN RUNNING 
    puts "rpm32"
  end
end
