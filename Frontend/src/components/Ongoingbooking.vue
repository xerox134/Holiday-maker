<template>
  <h1>OngoingBooking Component</h1>
 <div>

<p>Total price : {{ updatePrice }} kr</p>

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
    methods: {
      
    },

}
</script>

<style>

</style>