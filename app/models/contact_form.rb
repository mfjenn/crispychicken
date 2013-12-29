class ContactForm < MailForm::Base
  include MailForm::Delivery
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message
  attribute :additional_field,  :captcha  => true


  def headers
    {
      :subject => "Web Inquiry",
      :to => "Crispy_Chicken@live.com",
      :from => %("#{name}" <#{email}>)
    }
  end
end