<template>
    <div >
    <h1 >Favoriter</h1>

        <div id="favoriteList">
            <ol style="list-style-type:none;">
                <li v-for="(Favorite, index) in getAllFavorites" :key="index"> 
                    <Card :card="Favorite"  :type="'favorite'"/>
                </li>
            </ol>
        </div>
    </div>
</template>


<script>
import Card from '../Card'
export default {
    name: "Favorites",
components: {
        Card
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