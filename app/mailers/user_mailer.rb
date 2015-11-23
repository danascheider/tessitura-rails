class UserMailer < Devise::Mailer
  include Devise::Controllers::UrlHelpers
  default template_path: 'devise/mailer'

  def confirmation_instructions(record, token, opts={})
    opts[:subject] = "Tessitura e-mail verification"
    super
  end

  def reset_password_instructions(record, token, opts={})
    opts[:subject] = "Tessitura password reset instructions"
    super
  end
end
