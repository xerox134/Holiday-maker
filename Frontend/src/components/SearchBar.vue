<template>
 
  <input type="text" placeholder="Sök..." v-model="searchPhrase" id="searchBar">
    <button @click="searchForHotel(searchPhrase)">Sök</button>


</template>

<script>
export default {
  name:"SearchBar",



  methods: {
  searchForHotel(phrase){
           
                this.$store.commit('setHotelSearchPhrase',phrase);
                this.$store.dispatch("fetchHotelBySearchPhrase")

                console.log("fdfdfdfdfdf")
           
  }
}

}
</script>

<style>

</style>