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
    <button @click="submit">Betala!</button>
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
      'pk_test_51IxVsIGbzWnmUKqiQXUVCLg7e3J808utQYvrZQyDKilYGqqtwbNXAli0jaLRpGrxJXQnFmTtLTq7DnM151bEJlzD007pPeLOwH';
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
  },
};
</script>