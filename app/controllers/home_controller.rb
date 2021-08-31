class HomeController < ApplicationController
 before_action :find_levels
  before_action :find_materials
  #before_filter :find_user_content_access


  def index
    @materials = Material.all.order('created_at desc')
   # @courses   = Course.all.order('created_at desc')
  end

  

  private
    def find_levels
      @levels = Level.all
    end

    def find_materials
      @materials = Material.all
    end
    def find_user_content_access
      
    end
end
