OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, '249419131888935', 'a8e03af6b7e6efd1af542793f8ce4936', :scope => 'email'
end
