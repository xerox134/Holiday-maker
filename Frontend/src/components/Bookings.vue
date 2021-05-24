<template>
  <div >
    <h1 >Bookings component</h1>
    <div id="BookingList">
      <ol style="list-style-type:none;">
        <li v-for="(Bookings, index) in getAllBookings" :key="index"> 
          <Card :card="Bookings"  :type="'bookings'"/>
        </li>
      </ol>
    </div>
  </div>
</template>

<script>
import Card from "./Card"

export default {
  name: "Bookings",

  components: {
    Card
  },
    
  computed: {

  },

  methods:{

  },

  mounted(){
    
  },
 
}
</script>

<style>

</style>