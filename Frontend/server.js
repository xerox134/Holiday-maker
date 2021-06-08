// express
let express = require('express')
const app = express()

// läser in modulen body-parser
const bodyParser = require('body-parser')
// registrerar den som middleware
app.use( bodyParser.json() )

// stripe
const Stripe = require('stripe')
const stripe = new Stripe('sk_test_51IxVsIGbzWnmUKqiHXN3jJlRwvvZvRfWS3tkMxIzRxu6kNO2NSI8qkY7612LlfVW1xgYgY3I4jvADBsc7qEob8fg00X1ut5UV5') // stripe.com api secret key

// route for checkout
app.post('/rest/create-checkout-session', async (req, res) => {

  let line_items = req.body.items.map(item => { return {
      price_data: {
        currency: 'sek',
        product_data: {
          name: item.title,
        },
        unit_amount: item.price * 100,
      },      
      quantity: item.amount,
      }
  })

  const session = await stripe.checkout.sessions.create({
    payment_method_types: ['card'],    
    line_items: line_items,
    mode: 'payment',
    success_url: 'http://localhost:3000/checkout-result/success',
    cancel_url: 'http://localhost:3000/checkout-result/cancel',
  });

  res.json({ id: session.id });
});

console.log(process.argv)
// select port for server
let port = 3001
if(process.argv[2] == "--port"){
    port = process.argv[3]
}

// serve static files from .well-known
app.use(express.static('.well-known'))

// start server
app.listen(port, async () => {
  console.log('server running on port ' + port)
})

