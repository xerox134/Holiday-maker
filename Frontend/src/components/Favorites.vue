<template>
  <div >
<h1 >Favoriter</h1>

<div id="favoriteList">
 <ol style="list-style-type:none;">
<li v-for="(Favorite, index) in getAllFavorites" :key="index"> 
 {{ Favorite.id }} --      {{ Favorite.user }}      
 
         </li>
    </ol>
   </div>
  </div>
</template>


<script>
export default {
    name: "Favorites",
components: {
        
    },
    

    computed: {
        getAllFavorites(){
           
            return this.$store.getters.getAllFavorites
        },
        
    },

    methods:{},

    mounted(){
        this.$store.dispatch("fetchAllFavorites")
    },


    
}
</script>