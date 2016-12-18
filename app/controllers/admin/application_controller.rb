# All Administrate controllers inherit from this `Admin::ApplicationController`,
# making it the ideal place to put authentication logic or other
# before_filters.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.
module Admin
  def self.admin_types
    ['AdminUser','SuperUser']
  end

  class ApplicationController < Administrate::ApplicationController
    before_action :authenticate_user!
    before_filter :authenticate_admin

    def authenticate_admin
      unless Admin.admin_types.include?(current_user.try(:type)) #before_action happen befire the before_filter so we can enure that current_user is not nil
        flash[:alert] = "You are not authorized to access this page."
        redirect_to(root_path)
      end    
    end

    # Override this value to specify the number of elements to display at a time
    # on index pages. Defaults to 20.
    # def records_per_page
    #   params[:per_page] || 20
    # end
  end
end
