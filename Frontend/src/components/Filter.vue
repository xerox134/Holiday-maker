<template>
  <div id="filterKnappar">
    
    <h1>Filter</h1>
    
    <button @click="clear()">Rensa filter</button><br>
    <button @click="togglePool(true)">Pool</button><br>
    <button @click="toggleEntertainment(true)">Underhållning</button><br>
    <button @click="toggleChildrensClub(true)">Barnklubb</button><br>
    <button @click="toggleRestaurant(true)">Restaurang</button><br>
    <button @click="toggleWifi(true)">Wifi</button><br>
    <button @click="toggleBar(true)">Bar</button><br>
    <button @click="toggleReview()">stars high-low</button><br>
    <button @click="toggleReview2()">stars low-high</button><br>
    <button @click="togglePrice()">Price high-low</button><br>
    <button @click="togglePrice2()">Price low-high</button><br>
    

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

 togglePrice(){
      return this.$store.state.hotels.sort((b,a)=>a.cheapest_price - b.cheapest_price);
    }, 

     togglePrice2(){
      return this.$store.state.hotels.sort((a,b)=>a.cheapest_price - b.cheapest_price);
    }, 


    toggleReview(){
      return this.$store.state.hotels.sort((b,a)=>a.review - b.review);
    }, 
    
    toggleReview2(){
      return this.$store.state.hotels.sort((a,b)=>a.review - b.review);

    },

    togglePool(PoolisTrue) {
      console.log("Pool is " + PoolisTrue)
      // metoden filtrerar hotels-arrayen. Den plockar ut alla hotell som inte har pool
      this.$store.state.hotels = this.$store.state.hotels.filter(hotel => {
      return hotel.pool == PoolisTrue
      });

    
      this.$store.state.searchedHotels=this.$store.state.searchedHotels.filter(hotel =>{
        return hotel.pool == PoolisTrue
      })

      //Hotel = vilket hotell som helst. Returnera alla hotel som är hotel.pool = true

    },


   
    toggleEntertainment(includesEntertainment) {
      console.log("Entertainment is " + includesEntertainment)
      this.$store.state.hotels = this.$store.state.hotels.filter(hotel => {
        return hotel.entertainment == includesEntertainment   
      });

       this.$store.state.searchedHotels=this.$store.state.searchedHotels.filter(hotel =>{
        return hotel.entertainment == includesEntertainment
      })
    },


    toggleChildrensClub(includesChildrensClub) {
      console.log("Childrens Club is " + includesChildrensClub)
      this.$store.state.hotels = this.$store.state.hotels.filter(hotel => {
        return hotel.childrens_club == includesChildrensClub
      });
       this.$store.state.searchedHotels=this.$store.state.searchedHotels.filter(hotel =>{
        return hotel.childrens_club == includesChildrensClub
      })
    },


    toggleRestaurant(includesRestaurant) {
      console.log("Restaurant is " + includesRestaurant)
      this.$store.state.hotels = this.$store.state.hotels.filter(hotel => {
        return hotel.restaurant == includesRestaurant
      });
       this.$store.state.searchedHotels=this.$store.state.searchedHotels.filter(hotel =>{
        return hotel.restaurant == includesRestaurant
      })
    },


    toggleWifi(includesWifi) {
      console.log("Wifi is " + includesWifi)
      this.$store.state.hotels = this.$store.state.hotels.filter(hotel => {
        return hotel.wifi == includesWifi
      });
       this.$store.state.searchedHotels=this.$store.state.searchedHotels.filter(hotel =>{
        return hotel.wifi == includesWifi
      })
    },


    toggleBar(includesBar) {
      console.log("Bar is " + includesBar)
      this.$store.state.hotels = this.$store.state.hotels.filter(hotel => {
        return hotel.bar == includesBar
      });
       this.$store.state.searchedHotels=this.$store.state.searchedHotels.filter(hotel =>{
        return hotel.bar == includesBar
      })
    },

    clear() {
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
