<template>
  <div id="filterKnappar">
    
    <h1>Filter</h1>
    
    <button @click="togglePool(true)">Pool</button><br>
    <button @click="toggleEntertainment(true)">Underhållning</button><br>
    <button @click="toggleChildrensClub(true)">Barnklubb</button><br>
    <button @click="toggleRestaurant(true)">Restaurang</button><br>
    <button @click="toggleWifi(true)">Wifi</button><br>
    <button @click="toggleBar(true)">Bar</button><br>
    <button @click="clear()">Rensa filter</button><br>

  </div>
</template>


<script>
export default {
  name: "Filter",

  components: {
  },

  computed: {
  },

  methods:{
    async togglePool(includesPool) {
      console.log("Pool is " + includesPool)
      // metoden filtrerar hotels-arrayen. Den plockar ut alla hotell som inte har pool
      this.$store.state.hotels = this.$store.state.hotels.filter(hotel => {
      return hotel.pool == includesPool
      })
    },
    async toggleEntertainment(includesEntertainment) {
      console.log("Entertainment is " + includesEntertainment)
      this.$store.state.hotels = this.$store.state.hotels.filter(hotel => {
        return hotel.entertainment == includesEntertainment   
      })
    },
    async toggleChildrensClub(includesChildrensClub) {
      console.log("Childrens Club is " + includesChildrensClub)
      this.$store.state.hotels = this.$store.state.hotels.filter(hotel => {
        return hotel.childrens_club == includesChildrensClub
      })
    },
    async toggleRestaurant(includesRestaurant) {
      console.log("Restaurant is " + includesRestaurant)
      this.$store.state.hotels = this.$store.state.hotels.filter(hotel => {
        return hotel.restaurant == includesRestaurant
      })
    },
    async toggleWifi(includesWifi) {
      console.log("Wifi is " + includesWifi)
      this.$store.state.hotels = this.$store.state.hotels.filter(hotel => {
        return hotel.wifi == includesWifi
      })
    },
    async toggleBar(includesBar) {
      console.log("Bar is " + includesBar)
      this.$store.state.hotels = this.$store.state.hotels.filter(hotel => {
        return hotel.bar == includesBar
      })
    },
    async clear() {
      console.log("Filters cleared")
        return this.$store.dispatch("fetchHotels")
    }
        
  }

}
</script>

<style scoped>

button{
  text-align: center;
  width: 100%;
}

</style>>
