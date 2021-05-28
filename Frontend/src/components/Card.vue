<template>

  <div id="card" >

    <div class="Room-card" v-if="type == 'room'">
      <span id="booked" v-if="!card.booked"> 
        <span id="id"> Rum id: {{ card.id }}</span><br><br>
        <span id="room_nr"> Rum Nummer: {{ card.room_nr }}</span><br><br>
        <span id="beds"> Sängar: {{ card.beds }}</span><br><br>
        <span id="price">Pris: {{ card.price }}</span><br><br>
        <button @click="SendRoomToOngoingbooking(card.id), addRoomPriceToTotal()" >Select</button>
</span>
    </div>
    
    <div class="Hotel-card" v-if="type == 'hotel'" @click="toRooms(card.id)">
      <span class="name"> {{ card.name }}</span><br><br>
      <div id="ett">

        <div id="fyra">
          <img v-bind:src=card.img alt="" /><br><br><br>
          
          <span id="price" ><p>FRÅN {{card.cheapest_price}}/natt</p><br><br> </span>
        </div>

        <div id="två">
          <span id="country">Land: {{ card.country }}</span><br>
          <span id="city">Stad: {{ card.city }}</span><br>
          <span id="address">Adress: {{ card.address }}</span><br><br>
          <span id="description">Info: {{ card.description }}</span><br>
        </div>

        <div id="tre">
          <span id="review" >⭐ {{card.review}}/5</span><br>
          <span id="wifi" v-if="card.wifi">Wifi ✔</span>
          <span id="wifi" v-else>Wifi ✖</span><br>
          <span id="pool" v-if="card.pool">Pool ✔</span>
          <span id="pool" v-else>Pool ✖</span><br>
          <span id="entertainment" v-if="card.entertainment">Underhållning ✔</span>
          <span id="entertainment" v-else>Underhållning ✖</span><br>
          <span id="childrens_club" v-if="card.childrens_club">Barnklubb ✔</span>
          <span id="childrens_club" v-else>Barnklubb ✖</span><br>
          <span id="resturant" v-if="card.restaurant">Restaurang ✔</span>
          <span id="resturant" v-else>Restaurang ✖</span><br>
          <span id="bar" v-if="card.bar">Bar ✔</span>
          <span id="bar" v-else>Bar ✖</span><br>
          <span id="distance_to_beach" >{{ card.distance_to_beach }} km till strand</span><br>
          <span id="distance_to_center">{{ card.distance_to_center }} km till centrum</span><br>
        </div>

      </div>   
        <button @click.stop="favoriteItem(card.id)">Favoritmarkera ❤</button>
    </div>

     
    <div class="Favorite-card" v-if="type == 'favorite'" >
      <span id="user">Name: {{card.hotel.name}}</span><br><br>
      <span id="Hotelcity">City: {{card.hotel.city}}</span><br><br>
      <span id="Hotelcountry">Country: {{card.hotel.country}}</span><br><br>
      <span id="Hoteldescription">Description: {{card.hotel.description}}</span><br><br>
      <button @click="FavoriteToRooms(card.hotel.id)">Book room</button>
      <button @click="deleteFavorite(card.id), refreshStuff()">Ta bort ✖ </button>   
    </div>

    <div class="Booking-card" v-if="type == 'booking'">
      <span id="hotelname">Hotel Name: {{card.hotel.name}}</span><br><br>
      <span id="room_nr">Room Number: {{card.room.room_nr}}</span><br><br>
      <span id="beds">Number of beds: {{card.room.beds}}</span><br><br>
      <span id="Price">Price: {{card.room.price}}</span><br><br>
      <button @click="deleteFromBooking(card.id), refreshStuff()">Remove from List ✖ </button>   
    </div>

    <div class="Ongoingbooking-card" v-if="type == 'ongoingbooking'" >
      <span>Room id: {{card.id}}</span><br><br>
      <span>Room Price: {{card.price}}</span><br><br>
      <button @click ="addABed">extra Bed</button>
      <div id="luxuries-select">
        <select id="selected" @change="addInclusive">
          <option value="200" >All inclusive</option>
          <option value="150">Full pension</option>
          <option value="100">Halv pension</option>
        </select>
      </div>
    </div>


  </div>
</template>
<script>
export default {
  props: ["card", "type"],

  methods:{
    addRoomPriceToTotal(){
      this.$store.commit('addRoomPriceToTotal' , this.card.price);
    },
    addABed(){
      this.$store.commit('addABed',this.$store.state.bedPrice);
    },
    addInclusive() {
      
      var active = document.getElementById("selected");

      var v = parseInt(active.options[active.selectedIndex].value);
      var s = JSON.stringify(v);
      var d = parseInt(s);
      console.log(d);
      
      if(d == 200) {
        console.log("here 1");
        if(this.$store.state.temporaryNumber == 0) {
          this.$store.state.totalPrice += d
        this.$store.state.temporaryNumber = d
        } else {
          this.$store.state.totalPrice -= this.$store.state.temporaryNumber
          this.$store.state.temporaryNumber = 0
          this.$store.state.totalPrice += d
        }
      } else if(d == 150) {
        console.log("here 2");
        if(this.$store.state.temporaryNumber == 0) {
          this.$store.state.totalPrice += d
        this.$store.state.temporaryNumber = d
        } else {
          this.$store.state.totalPrice -= this.$store.state.temporaryNumber
          this.$store.state.temporaryNumber = 0
          this.$store.state.totalPrice += d        
        }
      } else if(d == 100) {
        console.log("here 3");
        if(this.$store.state.temporaryNumber == 0) {
          this.$store.state.totalPrice += d
        this.$store.state.temporaryNumber = d
        } else {
          this.$store.state.totalPrice -= this.$store.state.temporaryNumber
          this.$store.state.temporaryNumber = 0
          this.$store.state.totalPrice += d
        }
      }

    },

    async toRooms(id){
      this.$store.state.hotelId = id

      console.log(this.$store.state.hotelId)
      console.log("We clicked")
      this.$router.push({
            name: 'hotel'
      })
      window.scrollTo(0,0)
    },

    async FavoriteToRooms(id){
      this.$store.state.hotelId = id

      console.log(this.$store.state.hotelId)
      console.log("We clicked")
      this.$router.push({
            name: 'hotel'
      })
      window.scrollTo(0,0)
    },


    refreshStuff(){
        this.$store.dispatch("fetchAllFavorites")
    },

    SendRoomToOngoingbooking(id){
     this.$store.state.roomId = id;
     console.log(this.$store.state.roomId);
     this.$store.dispatch("fetchRoomsWithRoomId")
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

    async deleteFromBooking(id) {
      let credentials = {
        hotelid: {id : id}
      } 
      let response = await fetch ('/rest/bookings/'+ id, {
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

    async favoriteItem(id) { // id = card.id alltså hotelid
      
      let credentials = {
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
  },
  
}

</script>


<style scoped>


#ett{
  display: flex;
}
#fyra{
  padding: 0vh 1vw;
  
  }

#tre{
  max-width: 40%;
  min-width: 30%;
  max-height: 5%;
  padding: 1vh;
  text-align: right;
  

}


#Hotel-card{
    min-width: 100px;
    
  }
  
  #card{
    border-radius: 7px;
    color: rgba(19, 13, 9, 0.911);
    display: flex;
    list-style-type: none;
    background-color: rgba(16, 16, 17, 0.534);
    
    padding: 2vh;
    margin-bottom: 18px;
    margin-left: 30px;
    box-shadow: 4px 4px 2px rgba(0, 0, 0, .3), inset 2px 2px 2px rgba(240, 200, 255, .1);
    min-height: 4vh;
    max-width: 95%;
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
  .Booking-card > .title{
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
  
  
  font-size: 3vh;
  font-weight: bold;
  
 


}


  .Favorite-card:hover > #airtime{
    color: rgba(255, 255, 255, .6);
  }
  .Booking-card:hover > #airtime{
    color: rgba(255, 255, 255, .6);
  }

  button{
    border-radius: 7px;
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
    width: 100%;
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