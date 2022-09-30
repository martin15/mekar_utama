class ContactUsController < ApplicationController
  include SimpleCaptcha::ControllerHelpers

  def new
    @contact_us = ContactUs.new
    @contact_us_info = @about_us = Setting.find_by_name(:contact_us)
  end

  def create
    @contact_us = ContactUs.new(params[:contact_us])
    @contact_us_info = @about_us = Setting.find_by_name(:contact_us)
    if simple_captcha_valid?
      if @contact_us.save
        flash[:notice] = "Your question is already sent!"
        ContactUsMailer.contact_us_mail(@contact_us, "mekar_utama1@yahoo.com").deliver
        ContactUsMailer.contact_us_mail_for_admin(@contact_us).deliver
        ContactUsMailer.contact_us_confirmation(@contact_us).deliver
        redirect_to contact_us_path
      else
        flash[:error] = "Your question is failed to sent!<br />Please fill all field first"
        render :action => :new
      end
    else
      flash[:error] = "Fill with the valid recaptcha "
      render :action => :new
    end
  end
end
