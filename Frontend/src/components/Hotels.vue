<template>
  <div >


    <ol id="HotelList" v-show="toggleList">
            <li v-for="(hotel, index) in getAllHotels"  :key="index" >   <!--false=boolean till episodeToggle-->
                         <Card :card="hotel"  :type="'hotel'"/>  
            </li>
        </ol>

    <div>
            <button @click="togglePool(true)">Pool</button>
    </div>



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
        toggleList(){
            return this.$store.getters.getToggleList
        },
        
    },

  

    mounted(){
        this.$store.dispatch("fetchHotels")
    },

    methods: {
        togglePool(includes) {
            console.log(includes)
            this.$store.state.hotels = this.$store.state.hotels.filter(hotel => {
            return hotel.pool == includes
         })
        }
    }


    
}
</script>