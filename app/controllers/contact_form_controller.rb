class ContactFormController < ApplicationController
  def new
      @contact_form = ContactForm.new
    end

    def create
      begin
        @contact_form = ContactForm.new(params[:contact_form])
        @contact_form.request = request
        if @contact_form.valid?
          @contact_form.deliver
          flash.now[:notice] = 'Your message has been sent! Thank you!'
        else
          render :new
        end
      rescue ScriptError
        flash[:error] = 'Sorry, this message appears to be spam and was not delivered.'
      end
    end
end

