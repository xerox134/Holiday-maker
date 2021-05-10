<template>
  <div >


    <ol id="HotelList">
            <li v-for="(hotel, index) in getAllHotels"  :key="index" >   <!--false=boolean till episodeToggle-->
                         <Card :card="hotel"  :type="'hotel'"/>  
            </li>
        </ol>
 


 



  </div>
</template>


<script>
import Card from "../components/Card";
export default {
    name: "Hotels",

   


components: {
    Card,
        
    },
    

    computed: {
        getAllHotels(){
           
            return this.$store.getters.getAllHotels
        },
        
    },

  

    mounted(){
        this.$store.dispatch("fetchHotels")
    },


    
}
</script>