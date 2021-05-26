<template>
 <div id="SearchBar"><SearchBar/></div>
 
    <div >

        <ol id="HotelList" v-show="toggleList">
            <li v-for="(hotel, index) in getAllHotels"  :key="index" >   <!--false=boolean till episodeToggle-->
                <Card :card="hotel"  :type="'hotel'"/>  
            </li>
        </ol>

    </div>
</template>


<script>
import Card from "../components/Card";
import SearchBar from "../components/SearchBar"
export default {
    name: "Hotels",

components: {
    Card, 
    SearchBar,
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

}
</script>

<style>



</style>