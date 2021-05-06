<template>
  <div >


<button @click="toggle">Hotels</button>
  <div v-if="active">
    <ol id="HotelList">
            <li v-for="(hotel, index) in getAllHotels"  :key="index" >   <!--false=boolean till episodeToggle-->
                         <Card :card="hotel"  :type="'hotel'"/>  
            </li>
        </ol>
  </div>


 



  </div>
</template>


<script>
import Card from "../components/Card";
export default {
    name: "Hotels",

     data () {
      return {
        active: false
      }
    },


components: {
    Card,
        
    },
    

    computed: {
        getAllHotels(){
           
            return this.$store.getters.getAllHotels
        },
        
    },

    methods:{

        toggle () {
        this.active = !this.active
      }
    },

    mounted(){
        this.$store.dispatch("fetchHotels")
    },


    
}
</script>