

Rails.configuration.stripe = {
  publishable_key: 'pk_test_fejryG5J6fv7Sy6DtiKA1xwL',
  secret_key: 'sk_test_QlE2QbjEsX65xiieWAo2TQah'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
