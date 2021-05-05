<template>
  <div id="card" >
    <div class="Hotel-card" v-if="type == 'hotel'">
        <span class="name">{{ card.name }}</span><br>
        <span id="city">{{ card.city }}</span><br><br>
      </div>
      </div>
    <div class="Favorite-card" v-if="type == 'favorite'">
      <span class="id">{{ card.id }}</span>  |
      <span id="user">{{card.user}}</span><br><br>
      <span id="Hotelname">{{card.Hotelname}}</span><br><br>

      <button @click="deleteFavorite(card.id), refreshStuff()">Ta bort ✖
      </button>   </div>

</template>
<script>
export default {
props: ["card", "type"],

methods:{
refreshStuff(){
    this.$store.dispatch("fetchAllFavorites")
},
async deleteFavorite(id) {
      let credentials = {
        favoriteID: id
      } 
      let response = await fetch ('/rest/favorites/'+ id, {
        method: 'DELETE',
        headers: { 'Content-Type': 'application/json'},
        body: JSON.stringify(credentials)
      })
      if(response.url.includes('error')){
        console.log('Something went wrong. Try again')
      } else {
        console.log ('DELETED')
      }

  },

}

};
</script>


<style scoped>
  #card{
    color: rgba(255, 250, 235, .7);
    display: flex;
    list-style-type: none;
    background-color: rgba(60, 55, 65, .3);
    margin: 0 auto;
    padding: 2vh;
    margin-bottom: 18px;
    box-shadow: 4px 4px 2px rgba(0, 0, 0, .3), inset 2px 2px 2px rgba(240, 200, 255, .1);
    min-height: 4vh;
    max-width: 100%;
    justify-content: center;
    align-self: center;
  }

  #card:hover{
    color: rgba(255, 250, 235, .9);
    background-color: rgba(60, 55, 65, .7);
    box-shadow: 4px 4px 4px rgba(0, 0, 0, .3), inset 3px 3px 4px rgba(240, 200, 255, .15);
  }

  #card:active{
    color: rgba(230, 230, 255, .6);
    background-color: rgba(0, 0, 0, .1);
    box-shadow: inset -3px -3px 4px rgba(240, 200, 255, .1), inset 3px 3px 2px rgba(0, 0, 0, .2);
  }

  .Favorite-card > .title{
    font-weight: bold;
    font-size: 2.4vh;
    text-shadow: 4px 3px 2px rgba(0, 0, 0, .3);
  }

  #desc{
    color: rgba(255, 255, 255, .6);
    font-size: 1.8vh;
    text-shadow: 3px 2px 2px rgba(0, 0, 0, .5);
  }



  .Favorite-card:hover > #airtime{
    color: rgba(255, 255, 255, .6);
  }

  button{
    display: block;
    position: relative;
    top: -2vh;
    left: 1px;
    border: none;
    outline: none;
    background-color: rgba(80, 75, 85, .3);
    color: rgba(230, 230, 255, .6);
    box-shadow: 2px 2px 1px rgba(0, 0, 0, .2), inset 2px 2px 2px rgba(255, 255, 255, .05);
    margin: 3px;
    margin-left: 1vw;
    width: 46.5vw;
    height: min(5vh, 25vw);
    text-shadow: -1px -1px 2px rgba(0, 0, 0, .3), 1px 1px 2px rgba(126, 126, 126, .5);
  }

  button:hover{
    background-color: rgba(80, 75, 85, .8);
  }
  
  button:active{
    color: rgba(230, 230, 255, .8);
    border: none;
    background-color: rgba(80, 75, 85, .1);
    box-shadow: inset -2px -2px 2px rgba(220, 180, 255, .1), inset 2px 2px 2px rgba(0, 0, 0, .2);
  }

  span{
    vertical-align: middle;
    font-size: 100%;
  }

  .isSelected{
    background-color: red;
  }
</style>