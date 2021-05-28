<template>
  <h1>OngoingBooking Component</h1>
 <div>

<p>Total price : {{ updatePrice }} kr</p>

</div>
 <div class="dropdown">
<button class="dropbtn">Antal personer</button>
<div class="dropdown-content">
  <a href="#">1</a>
  <a href="#">2</a>
  <a href="#">3</a>



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
      getRoomsWithRoomId(){
    return this.$store.getters.getRoomsWithRoomId
    },
      updatePrice(){
    return this.$store.getters.totalPrice
    }
    },
    methods: { },

}
</script>

<style>

.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f1f1f1;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown:hover .dropdown-content {display: block;}
</style>