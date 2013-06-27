module Spree
  class Admin::CustomizableProductOptionsController < Admin::ResourceController
    before_filter :load_product_customization_type, :only => [:remove, :show]

    def remove
      customizable_product_option = CustomizableProductOption.find(params[:id])
      @product_customization_type.customizable_product_options.delete(customizable_product_option)
      @product_customization_type.save
      flash.notice = I18n.t("notice_messages.customizable_product_option_removed")
      
      redirect_to url_for :controller => 'product_customization_types', :action => 'edit', :id => @product_customization_type.id
    end

    def show
      redirect_to url_for :controller => 'product_customization_types', :action => 'edit', :id => @product_customization_type.id
    end

    private
    def load_product_customization_type
      @product_customization_type = ProductCustomizationType.find(params[:product_customization_type_id])
    end

  end
end
