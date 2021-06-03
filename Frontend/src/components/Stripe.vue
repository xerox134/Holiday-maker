<template>
  <div>
    <stripe-checkout
      ref="checkoutRef"
      mode="payment"
      :pk="publishableKey"
      :line-items="lineItems"
      :success-url="successURL"
      :cancel-url="cancelURL"
      @loading="(v) => (loading = v)"
    />
    <button @click="addBooking">Betala</button>
  </div>
</template>

<script>
import { StripeCheckout } from "@vue-stripe/vue-stripe";
export default {
  components: {
    StripeCheckout,
  },

  data() {
    this.publishableKey =
      "pk_test_51IxVsIGbzWnmUKqiQXUVCLg7e3J808utQYvrZQyDKilYGqqtwbNXAli0jaLRpGrxJXQnFmTtLTq7DnM151bEJlzD007pPeLOwH";
    return {
      loading: false,
      lineItems: [
        {
          price: "price_1IxsIjGbzWnmUKqiYtceOczB", // The id of the one-time price you created in your Stripe dashboard
          quantity: this.$store.state.totalPrice,
        },
      ],
      successURL: "http://localhost:3000/#/success",
      cancelURL: "http://localhost:3000/#/fail",
    };
  },
  methods: {
    submit() {
      // You will be redirected to Stripe's secure checkout page
      this.$refs.checkoutRef.redirectToCheckout();
    },
    async addBooking() {
      const requestOptions = {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          room: {
            id: this.$store.state.roomId,
          },
          price: this.$store.getters.totalPrice, // Totalpriset finns i gettern "totalPrice" som skickas in som bokningens pris
          extraBed: this.$store.getters.getExtraBed, // Kollar om extrasängsknappen är sann eller falsk
          wholePension: this.$store.getters.getWholePension, // Kollar om helpensionen är sann eller falsk
          halfPension: this.$store.getters.getHalfPension, // Kollar om halvpensionen är sann eller falsk
          allInclusive: this.$store.getters.getAllInclusive, // Kollar om allInclusive är sann eller falsk
          numberOfAdults: this.$store.getters.getNumberOfAdults, // Hämtar antal vuxna som man valt
          numberOfChildren: this.$store.getters.getNumberOfChildren, // Hämtar antal barn som man valt
          fromDate: this.$store.getters.getFromDate, // Hämtar datumet man valt. Bokningen funkar inte om man inte fyller i ett startdatum
          toDate: this.$store.getters.getToDate, // Hämtar datumet man valt. Bokningen funkar inte om man inte fyller i ett slutdatum
        }),
      };
      const response = await fetch("/rest/bookings", requestOptions);
      const data = await response.json();
      this.postId = data.id;
      console.log(data);
      this.$refs.checkoutRef.redirectToCheckout();
    },
  },
};
</script>