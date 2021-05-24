<template>
  <div >
<h1 >Bookings component</h1>

<div id="BookingList">
 <ol style="list-style-type:none;">
<li v-for="(Booking, index) in getAllBookings" :key="index"> 
        <Card :card="Booking"  :type="'booking'"/>
         </li>
    </ol>
   </div>
  </div>
</template>

<script>
import Card from "./Card"

export default {
    name: "Booking",
components: {
        Card
    },
    

    computed: {
      getAllBookings(){
           
            return this.$store.getters.getAllBookings
        },
        },

    methods:{},

    mounted(){
        this.$store.dispatch("fetchAllBookings")
    },


    
}
</script>

<style>

</style>