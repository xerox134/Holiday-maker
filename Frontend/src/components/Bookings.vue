<template>
  <div>
    <h1>Mina bokningar</h1>

    <div id="BookingList">
      <ol style="list-style-type: none">
        <li v-for="(Booking, index) in getAllBookings" :key="index">
          <Card :card="Booking" :type="'booking'" />
        </li>
      </ol>
    </div>
  </div>
</template>

<script>
import Card from "./Card";

export default {
  name: "Booking",
  components: { Card },

  computed: {
    getAllBookings() {
      return this.$store.getters.getAllBookings;
    },

    updatePrice() {
      return this.$store.getters.totalPrice;
    },
  },

  methods: {
    addABed() {
      this.$store.commit("addABed", this.$store.state.bedPrice);
    },
    addAllInclusive() {
      this.$store.commit(
        "addAllInclusive",
        this.$store.state.allInclusivePrice
      );
    },
  },

  mounted() {
    return this.$store.dispatch("fetchAllBookings");
  },
};
</script>

<style>
</style>