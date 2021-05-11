<template>

  <div id="card" >


      <div class="Room-card" v-if="type == 'room'">

          <span id="room_nr"> Rum Nummer: {{ card.room_nr }}</span><br><br>
           <span id="beds"> Sängar: {{ card.beds }}</span><br><br>
        <span id="price">Pris: {{ card.price }}</span><br><br>
        <span id="booked">Bokad: {{ card.booked }}</span><br><br>

      </div>
    
    <div class="Hotel-card" v-if="type == 'hotel'" @click="toRooms(card.id)">
        <span class="name"> {{ card.name }}</span><br><br>
<div id="ett">


<div id="fyra">
        <img v-bind:src=card.img alt="" /><br><br><br>
        <p>FRÅN 500kr/natt</p><br><br>
</div>
  <div id="två">
        <span id="country">Land: {{ card.country }}</span><br><br>
        <span id="city">Stad: {{ card.city }}</span><br><br>
        <span id="address">Adress: {{ card.address }}</span><br><br>
        <span id="description">Info: {{ card.description }}</span><br><br>

</div>

<div id="tre">
        <span id="wifi">Finns Wifi: {{ card.wifi }}</span><br><br>
        <span id="pool">Finns Pool: {{ card.pool }}</span><br><br>
        <span id="entertainment">Finns Underhållning: {{ card.entertainment }}</span><br><br>
        <span id="childrens_club">Finns Barn klubb: {{ card.childrens_club }}</span><br><br>
        <span id="resturant">Finns Restaurang: {{ card.restaurant }}</span><br><br>
        <span id="bar">Finns Bar: {{ card.bar }}</span><br><br>
        <span id="distance_to_beach">Distans till närmaste strand: {{ card.distance_to_beach }} km</span><br><br>
        <span id="distance_to_center">Distans till centrum: {{ card.distance_to_center }} km</span><br><br><br>
</div>


        </div>
        
        <button @click.stop="favoriteItem(card.id, card.name, card.country, card.city, card.description)">Favoritmarkera ❤</button>
      </div>

     
    <div class="Favorite-card" v-if="type == 'favorite'">
      <span id="user">Name: {{card.hotel.name}}</span><br><br>
      <span id="Hotelcity">City: {{card.hotel.city}}</span><br><br>
      <span id="Hotelcountry">Country: {{card.hotel.country}}</span><br><br>
      <span id="Hoteldescription">Description: {{card.hotel.description}}</span><br><br>
      <button @click="deleteFavorite(card.id), refreshStuff()">Ta bort ✖
      </button>   </div>

       </div>

</template>
<script>
export default {
props: ["card", "type"],

methods:{

   async toRooms(id){


        this.$store.state.hotelId = id

        console.log(this.$store.state.hotelId)
        console.log("We clicked")
        this.$router.push({
             name: 'hotel'
        })

        
          

    },
refreshStuff(){
    this.$store.dispatch("fetchAllFavorites")
},
async deleteFavorite(id) {
      let credentials = {
        hotelid: id
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

   async favoriteItem(id) {
     
let credentials = {
  
       user: {id: this.$store.state.LoggedInUserId},     //this.$store.state.LoggedinUserId, 
       hotel: { id: id} 
        
   }
      let response = await fetch ('/rest/favorites/', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json'},
        body: JSON.stringify(credentials)
      
      })




      console.log(credentials)
      if(response.url.includes('error')){
        console.log('Something went wrong. Try again')
      } else {
        console.log ('Saved as favorite')
      }




}
}
}
</script>


<style scoped>

#ett{
  display: flex;
}
#fyra{
  padding: 2vh 2vw;
  }

  #card{
    color: rgba(19, 13, 9, 0.911);
    display: flex;
    list-style-type: none;
    background-color: rgba(16, 16, 17, 0.534);
    margin: 0 auto;
    padding: 2vh;
    margin-bottom: 18px;
    box-shadow: 4px 4px 2px rgba(0, 0, 0, .3), inset 2px 2px 2px rgba(240, 200, 255, .1);
    min-height: 4vh;
    max-width: 50%;
    justify-content: center;
    align-self: center;
    text-align: left;
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

.name{
  justify-content: center;
  text-align: center;
  margin-left: 40%;
 


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