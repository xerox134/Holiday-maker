<template>
  <h1>Varukorg</h1>
  <div id="ShoppingCartList">
    <ol style="list-style-type: none">
      <li v-for="(ShoppingCart, index) in getRoomsWithRoomId" :key="index">
        <Card :card="ShoppingCart" :type="'shoppingcart'" />
      </li>
    </ol>
    <div>
      
      <h3>Totalt pris : {{ getTotalPrice * getNumberOfNights}} kr</h3>
    </div>
  </div>
  <div>
    <button @click="addBooking()">Till betalning</button>
  </div>
</template>

<script>
import Card from "../Card.vue";


export default {
  name: "Booking",
  components: {
    Card,
    
  },

  computed: {
    getRoomsWithRoomId() {
      return this.$store.getters.getRoomsWithRoomId;
    },
    getFinalPrice() {
      return this.$store.getters.getFinalPrice;
    },
    getAdults() {
      return this.$store.getters.getNumberOfAdults;
    },
    getChildren() {
      return this.$store.getters.getNumberOfChildren;
    },
    getFromDate() {
      return this.$store.getters.getFromDate;
    },
    getToDate() {
      return this.$store.getters.getToDate;
    },
    getNumberOfNights(){
      return this.$store.getters.getNumberOfNights
    },
    getTotalPrice(){
      return this.$store.getters.totalPrice
    }
  },

  methods: {
    checkout(){
      
    },
    test(){
      console.log(finalPrice)
      var finalPrice = this.$store.state.totalPrice * this.$store.state.numberOfNights
      console.log(this.$store.state.finalPrice)
    },
    Edit() {
      this.$store.commit("addABed", this.$store.state.bedPrice);
    },
    async addBooking() {
      var finalPrice = this.$store.state.totalPrice * this.$store.state.numberOfNights
      this.$store.commit("setFinalPrice", finalPrice)
      const bookingObject = {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          room: {
            id: this.$store.state.roomId,  // foreign key därför är det objekt
          },
          price: this.getFinalPrice, // Totalpriset finns i gettern "totalPrice" som skickas in som bokningens pris
          extraBed: this.$store.getters.getExtraBed, // Kollar om extrasängsknappen är sann eller falsk
          wholePension: this.$store.getters.getWholePension, // Kollar om helpensionen är sann eller falsk
          halfPension: this.$store.getters.getHalfPension, // Kollar om halvpensionen är sann eller falsk
          allInclusive: this.$store.getters.getAllInclusive, // Kollar om allInclusive är sann eller falsk
          numberOfAdults: this.$store.getters.getNumberOfAdults, // Hämtar antal vuxna som man valt
          numberOfChildren: this.$store.getters.getNumberOfChildren, // Hämtar antal barn som man valt
          fromDate: this.$store.getters.getFromDate, // Hämtar datumet man valt. Bokningen funkar inte om man inte fyller i ett startdatum
          toDate: this.$store.getters.getToDate, // Hämtar datumet man valt. Bokningen funkar inte om man inte fyller i ett slutdatum
          paid: 0,  //Boolean
        }),
      };
      const response = await fetch("/rest/bookings", bookingObject);
      const data = await response.json();
      this.postId = data.id; 
      console.log(data);
      this.$store.dispatch('checkout', this.getFinalPrice)
    },
    
  },

  mounted() {
    console.log(this.$store.state.bookedRoom.id);
    var finalPrice = this.$store.state.totalPrice * this.$store.state.numberOfNights
      this.$store.commit("setFinalPrice", finalPrice)
      console.log(finalPrice)

  },
};
</script>

<style>
</style>