PayPal::SDK.configure(
  client_id: Rails.application.credentials.paypal_client_id,
  client_secret: Rails.application.credentials.paypal_secret_id,
  mode: 'sandbox'
)
PayPal::SDK.logger = Rails.logger
