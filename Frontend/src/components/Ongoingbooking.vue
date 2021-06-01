<template>
  <h1>OngoingBooking Component</h1>
 <div>

<p>Total price : {{ updatePrice }} kr</p>
<div> <p>Adult/s : {{ getAdults }} </p> 
</div>
<div><p>Children : {{ getChildren }} </p> 
</div>

<div id="datum">
<p>Datum: {{ getFromDate }} - {{ getToDate }} </p>

</div>

</div>


  <div id="OngoingbookingList">
 <ol style="list-style-type:none;">
<li v-for="(Ongoingbooking, index) in getRoomsWithRoomId" :key="index"> 
        <Card :card="Ongoingbooking"  :type="'ongoingbooking'"/>
         </li>
    </ol>
   </div>
   <div>
     <button @click="addBooking"> BOKA </button>
   </div>
</template>

<script>
import Card from "./Card"

export default {
  name: "Booking",
  components: { Card},

    computed: {
      getRoomsWithRoomId() {
        return this.$store.getters.getRoomsWithRoomId
        },
    updatePrice() {
      return this.$store.getters.totalPrice  
    },
    
    getAdults(){
    return this.$store.getters.getNumberOfAdults
    },
    getChildren(){
    return this.$store.getters.getNumberOfChildren
    },
    
    getFromDate() {
      return this.$store.getters.getFromDate
      },          
    getToDate() {
      return this.$store.getters.getToDate
    },
    getExtraBed() {
      return this.$store.getters.getExtraBed
    }
},

    
    methods: {
    Edit(){
      this.$store.commit('addABed',this.$store.state.bedPrice);
    },
    async addBooking() {
      const requestOptions = {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({
        room: {
            id : 1008
            },
            price: this.$store.getters.totalPrice,
            extraBed: this.$store.getters.getExtraBed, // Kollar om extrasängsknappen är sann eller falsk
            wholePension: true,
            halfPension: false,
            numberOfAdults: this.$store.getters.getNumberOfAdults, // Hämtar antal vuxna som man valt
            numberOfChildren: this.$store.getters.getNumberOfChildren, // Hämtar antal barn som man valt
            fromDate: this.$store.getters.getFromDate, // Hämtar datumet man valt. Bokningen funkar inte om man inte fyller i ett startdatum
            toDate: this.$store.getters.getToDate // Hämtar datumet man valt. Bokningen funkar inte om man inte fyller i ett slutdatum
    })
  };
  const response = await fetch("/rest/bookings", requestOptions);
  const data = await response.json();
  this.postId = data.id;
  console.log(data);
    }
  },

}
</script>

<style>

</style>