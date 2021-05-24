<template>
  <div>
    
    <h1>Filter</h1>
    
    <button @click="togglePool(true)">Pool</button>
    <button @click="toggleEntertainment(true)">Entertainment</button>
    <button @click="toggleChildrensClub(true)">Childrens Club</button>
    <button @click="toggleRestaurant(true)">Restaurant</button>
    <button @click="toggleWifi(true)">Wifi</button>
    <button @click="toggleBar(true)">Bar</button>

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
    },
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
      
    },
          async togglePool(includesPool) {
            console.log(includesPool)
            this.$store.state.hotels = this.$store.state.hotels.filter(hotel => {
            return hotel.pool == includesPool
            
         })
        },
          async toggleEntertainment(includesEntertainment) {
            console.log(includesEntertainment)
            this.$store.state.hotels = this.$store.state.hotels.filter(hotel => {
            return hotel.entertainment == includesEntertainment
            
         })
        },
        async toggleChildrensClub(includesChildrensClub) {
          this.$store.state.hotels = this.$store.state.hotels.filter(hotel => {
            return hotel.childrens_club == includesChildrensClub
          })
        },
        async toggleRestaurant(includesRestaurant) {
          this.$store.state.hotels = this.$store.state.hotels.filter(hotel => {
            return hotel.restaurant == includesRestaurant
          })
        },
        async toggleWifi(includesWifi) {
          this.$store.state.hotels = this.$store.state.hotels.filter(hotel => {
            return hotel.wifi == includesWifi
          })
        },
        async toggleBar(includesBar) {
          this.$store.state.hotels = this.$store.state.hotels.filter(hotel => {
            return hotel.bar == includesBar
          })
        }
        
  }

}
</script>