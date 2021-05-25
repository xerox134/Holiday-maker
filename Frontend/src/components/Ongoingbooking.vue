<template>
  <h1>OngoingBooking Component</h1>
  <div id="OngoingbookingList">
 <ol style="list-style-type:none;">
<li v-for="(Ongoingbooking, index) in getRoomWithRoomId" :key="index"> 
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
      getRoomWithRoomId(){
    return this.$store.getters.getRoomWithRoomId
    },
    },
    methods: {},

}
</script>

<style>

</style>