<template>
  <div class="ShoppingCart"><p>Welcome to ongoing bookings</p></div>
  <div id="ShoppingCart"><Cart /></div>

  <div></div>
</template>

<script>
import Cart from "../components/RouteComponents/Cart.vue";
export default {
  name: "shoppingcart",

  components: {
    Cart,
  },
  computed: {},
  methods: {},
};
</script>

<style scoped>
#ShoppingCart {
  background-color: rgba(60, 55, 65, 0.3);
  color: blanchedalmond;
  width: 100%;

  height: 100%;
  box-shadow: 6px 6px 3px rgba(0, 0, 0, 0.6),
    inset 3px 3px 3px rgba(240, 200, 255, 0.05);
  justify-content: center;
  min-height: 15vh;
}
</style>