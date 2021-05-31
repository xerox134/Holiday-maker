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
      }
    },
      updatePrice(){
    return this.$store.getters.totalPrice
    },
    getAdults(){
    return this.$store.getters.getNumberOfAdults
    },
    getChildren(){
    return this.$store.getters.getNumberOfChildren
    },
    
     getFromDate()
     { return this.$store.getters.getFromDate},
     
     
     getToDate()
      { return this.$store.getters.getToDate}
    
    
    },

    
    methods: {
      Edit(){
      this.$store.commit('addABed',this.$store.state.bedPrice);
    },
     },

}
</script>

<style>

</style>