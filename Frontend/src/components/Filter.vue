<template>
  <div>
    
    <h1>Filter</h1>

    <button id="filter" @click="searchForPool(), test()">Pool</button> <br>
    <button id= "filter" @click="searchForRestaurant()">Restaurang</button> <br>
    <button id= "filter">Childrens Club meh!!!</button> <br>
    <button id= "filter" @click="searchForWifi()">Wifi</button><br>
    <button id= "filter" @click="searchForEntertainment()">Entertainment</button> <br>
    <button id= "filter" @click="searchForBar()">Bar</button> <br>
    

    <ol id="FilteredHotelList">
      <li v-for="(hotel, index) in getFilteredHotels"  :key="index">
        <Card :card="hotel"  :type="'hotel'"/>
      </li>
    </ol>

  </div>
</template>


<script>
import Card from "./Card"
export default {
  name: "Filter",

  components: {
    Card
  },

  computed: {
    getFilteredHotels(){
      return this.$store.getters.getFilteredHotels
    },
    getHotelsWithPool(){
      return this.$store.getters.getHotelsWithPool
    },
    getHotelsWithEntertainment(){
      return this.$store.getters.getHotelsWithEntertainment
    }
  },

  methods:{
    searchForPool(){
      this.$store.dispatch("fetchHotelByPool");
    },
    searchForEntertainment(){
      this.$store.dispatch("fetchHotelByEntertainment");
    },
    searchForRestaurant(){
      this.$store.dispatch("fetchHotelByRestaurant");
    },
    searchForWifi(){
      this.$store.dispatch("fetchHotelByWifi");
    },
    searchForBar(){
      this.$store.dispatch("fetchHotelByBar");
    },
    combineFilters(){
      let list1 = this.$store.getFilteredHotels
      let list2 = this.$store.getHotelsWithPool
      Array.prototype.push.apply(list1, 
      list2)
      console.log(list1)
    },
    test(){
      let list1 = this.$store.getHotelsWithPool
      console.log(list1)
      
    }

  }

}
</script>