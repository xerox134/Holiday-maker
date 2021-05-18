<template>
 
  <input type="text" placeholder="Sök..." v-model="searchPhrase" id="searchBar">
    <button @click="searchForHotel(searchPhrase)">Sök</button>

      <ol id="HotelList">
            <li v-for="(hotel, index) in getSearchedHotels"  :key="index" >   <!--false=boolean till episodeToggle-->
                         <Card :card="hotel"  :type="'hotel'"/>  
            </li>
        </ol>


</template>

<script>
import Card from "../components/Card";
export default {
  name:"SearchBar",


components: {
    Card,
        
    },
computed: {
        getSearchedHotels(){
           
            return this.$store.getters.getSearchedHotels
        },
        
    },

  

   
  methods: {

   
  searchForHotel(phrase){
           
                this.$store.commit('setHotelSearchPhrase',phrase);
                this.$store.dispatch("fetchHotelBySearchPhrase")         
           
  }
}

}
</script>

<style>

</style>