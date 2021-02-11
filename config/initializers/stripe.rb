Rails.configuration.stripe = {
  publishable_key: ENV['pk_test_51GygdfLOmJHdsv5RphlJNe1x26c5aC3cUgJdJx3x9RV8ixKXgbWgCaNMY5uCOBxEcjsyT1X38p5JqhGUywl8JLRg00i6zN3S9r'],
  secret_key: ENV['sk_test_51GygdfLOmJHdsv5RFagzE1BXwqNFRifShI7zyQ0EQQbhpY4T0YWsepRxUlU0rtmkXjDOScsDUTofEti2Zoj8TZ5a002euqltoY']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]