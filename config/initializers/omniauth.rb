Rails.application.config.middleware.use OmniAuth::Builder do
  provider :linkedin, ENV['LINKEDIN_KEY'], ENV['LINKEDIN_SECRET'], :scope => "r_basicprofile r_emailaddress", :fields => ["id", "email-address", "first-name", "last-name", 'picture-url']
on_failure { |env| AuthenticationsController.action(:failure).call(env) }
end
