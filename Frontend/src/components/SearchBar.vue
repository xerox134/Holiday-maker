<template>
 
  <input type="text" placeholder="Sök..." v-model="searchPhrase" id="searchBar">
    <button @click="searchForHotel(searchPhrase)">Sök</button>

      <ol id="HotelList">
            <li v-for="(hotel, index) in getSearchedHotels"  :key="index" >  
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

   toggleList(toggleSearch){
     console.log(toggleSearch)
      this.$store.commit('setToggleList',toggleSearch)
     
   },
  searchForHotel(phrase){
           
                this.$store.commit('setHotelSearchPhrase',phrase);
                this.$store.dispatch("fetchHotelBySearchPhrase");
                this.toggleList(false)        
           
  }
}

}
</script>

<style>

#searchBar{
  top: -2vh;
    left: 1px;
    border: none;
    outline: none;
    background-color: rgba(80, 75, 85, .3);
    color: rgba(230, 230, 255, .6);
    box-shadow: 2px 2px 1px rgba(0, 0, 0, .2), inset 2px 2px 2px rgba(255, 255, 255, .05);
    margin: 3px;
    margin-left: 1vw;
    padding-left: 20px;
    padding-right: 20px;
    padding-top: 5px;
    padding-bottom: 5px;
    height: min(5vh, 25vw);
    text-shadow: -1px -1px 2px rgba(0, 0, 0, .3), 1px 1px 2px rgba(126, 126, 126, .5);
}

</style>