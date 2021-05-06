<template>
  <div >



  
    <ol id="RoomsList">
            <li v-for="(room, index) in getRoomByHotelId"  :key="index" >   <!--false=boolean till episodeToggle-->
                         <Card :card="room"  :type="'room'"/>  
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
        getRoomByHotelId(){
           
            return this.$store.getters.getRoomByHotelId
        },
        
    },

    methods:{

        toggle () {
        this.active = !this.active
      }
    },

    mounted(){

        console.log("we fetching")
        this.$store.dispatch("fetchRoomsById")
    },


    
}
</script>