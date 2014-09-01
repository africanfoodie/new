jQuery ->
// The browser waits until the page as fnished loading before running the code.
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'))
// Find the stripe key from the metatag on the page, it uses that to find out what stripe account to connect to.
  payment.setupForm()
// Run the setupForm function that we see below.

payment =
  setupForm: ->
    $('#new_order').submit ->
// When a new order form is submitted
        $('input[type=submit]').attr('disabled', true)
// Disable the submit button so whilst the card info is being set the form wont be submitted twice
        Stripe.card.createToken($('#new_order'), payment.handleStripeResponse)
// Tell stripe to find the special form fields in our new order form that we labelled with the data stripe keyword-use card info to check card is valid then moves to handlestriperesponse section
        false

  handleStripeResponse: (status, response) ->
// In this section one of two things can happen-if card info ok then stripe will guve us back a card token, else an error message.
    if status == 200
      alert(response.id)
    else
      alert(response.error.message)
