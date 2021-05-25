<template>
  <div id="filterKnappar">
    
    <h1>Filter</h1>
    
    <button @click="clear(), clear2()">Rensa filter</button><br>
    <button @click="togglePool(true)">Pool</button><br>
    <button @click="toggleEntertainment(true)">Underhållning</button><br>
    <button @click="toggleChildrensClub(true)">Barnklubb</button><br>
    <button @click="toggleRestaurant(true)">Restaurang</button><br>
    <button @click="toggleWifi(true)">Wifi</button><br>
    <button @click="toggleBar(true)">Bar</button><br>
    <span class="trying" >Stars <p @click="toggleReview(), toggleSearchedReview()">⬆</p> <p @click="toggleReview2(),toggleSearchedReview2()">⬇</p> </span><br>
    <span class="trying" >Price <p @click="togglePrice(),toggleSearchedPrice()">⬆</p> <p @click="togglePrice2(),toggleSearchedPrice2()">⬇</p> </span><br>
    <span class="trying" >Beach <p @click="toggleBeach(), toggleSearchedBeach()">⬆</p> <p @click="toggleBeach2(),toggleSearchedBeach2()">⬇</p> </span><br>
    <span class="trying" >Centrum <p @click="toggleCentrum(),toggleSearchedCentrum()">⬆</p> <p @click="toggleCentrum2(),toggleSearchedCentrum2()">⬇</p> </span><br>
  
    
   
    
    

  </div>
</template>


<script>
export default {
  name: "Filter",

  components: {
  },

  computed: {
  },

  methods:{
    toggleBeach(){
      return this.$store.state.hotels.sort((b,a)=>a.distance_to_beach - b.distance_to_beach);
    },
     toggleBeach2(){
      return this.$store.state.hotels.sort((a,b)=>a.distance_to_beach - b.distance_to_beach);
    },
    
    toggleSearchedBeach(){
      return this.$store.state.searchedHotels.sort((b,a)=>a.distance_to_beach - b.distance_to_beach);
    },  toggleSearchedBeach2(){
      return this.$store.state.searchedHotels.sort((a,b)=>a.distance_to_beach - b.distance_to_beach);
    }, 
    
    toggleCentrum(){
      return this.$store.state.hotels.sort((b,a)=>a.distance_to_center - b.distance_to_center);
    }, 
    toggleCentrum2(){
      return this.$store.state.hotels.sort((a,b)=>a.distance_to_center - b.distance_to_center);
    }, 

    toggleSearchedCentrum(){
      return this.$store.state.searchedHotels.sort((b,a)=>a.distance_to_center - b.distance_to_center);
    }, 

    toggleSearchedCentrum2(){
      return this.$store.state.searchedHotels.sort((a,b)=>a.distance_to_center - b.distance_to_center);
    }, 



    togglePrice(){
      return this.$store.state.hotels.sort((b,a)=>a.cheapest_price - b.cheapest_price);
    }, 

     togglePrice2(){
      return this.$store.state.hotels.sort((a,b)=>a.cheapest_price - b.cheapest_price);
    }, 

    toggleSearchedPrice(){
      return this.$store.state.searchedHotels.sort((b,a)=>a.cheapest_price - b.cheapest_price);
    }, 

     toggleSearchedPrice2(){
      return this.$store.state.searchedHotels.sort((a,b)=>a.cheapest_price - b.cheapest_price);
    }, 


    toggleReview(){
      return this.$store.state.hotels.sort((b,a)=>a.review - b.review);
    }, 
    
    toggleReview2(){
      return this.$store.state.hotels.sort((a,b)=>a.review - b.review);

    },

     toggleSearchedReview(){
      return this.$store.state.searchedHotels.sort((b,a)=>a.review - b.review);
    }, 

     toggleSearchedReview2(){
      return this.$store.state.searchedHotels.sort((a,b)=>a.review - b.review);

    },

    togglePool(PoolisTrue) {
      console.log("Pool is " + PoolisTrue)
      // metoden filtrerar hotels-arrayen. Den plockar ut alla hotell som inte har pool
      this.$store.state.hotels = this.$store.state.hotels.filter(hotel => {
      return hotel.pool == PoolisTrue
      });

    
      this.$store.state.searchedHotels=this.$store.state.searchedHotels.filter(hotel =>{
        return hotel.pool == PoolisTrue
      })

      //Hotel = vilket hotell som helst. Returnera alla hotel som är hotel.pool = true

    },


   
    toggleEntertainment(includesEntertainment) {
      console.log("Entertainment is " + includesEntertainment)
      this.$store.state.hotels = this.$store.state.hotels.filter(hotel => {
        return hotel.entertainment == includesEntertainment   
      });

       this.$store.state.searchedHotels=this.$store.state.searchedHotels.filter(hotel =>{
        return hotel.entertainment == includesEntertainment
      })
    },


    toggleChildrensClub(includesChildrensClub) {
      console.log("Childrens Club is " + includesChildrensClub)
      this.$store.state.hotels = this.$store.state.hotels.filter(hotel => {
        return hotel.childrens_club == includesChildrensClub
      });
       this.$store.state.searchedHotels=this.$store.state.searchedHotels.filter(hotel =>{
        return hotel.childrens_club == includesChildrensClub
      })
    },


    toggleRestaurant(includesRestaurant) {
      console.log("Restaurant is " + includesRestaurant)
      this.$store.state.hotels = this.$store.state.hotels.filter(hotel => {
        return hotel.restaurant == includesRestaurant
      });
       this.$store.state.searchedHotels=this.$store.state.searchedHotels.filter(hotel =>{
        return hotel.restaurant == includesRestaurant
      })
    },


    toggleWifi(includesWifi) {
      console.log("Wifi is " + includesWifi)
      this.$store.state.hotels = this.$store.state.hotels.filter(hotel => {
        return hotel.wifi == includesWifi
      });
       this.$store.state.searchedHotels=this.$store.state.searchedHotels.filter(hotel =>{
        return hotel.wifi == includesWifi
      })
    },


    toggleBar(includesBar) {
      console.log("Bar is " + includesBar)
      this.$store.state.hotels = this.$store.state.hotels.filter(hotel => {
        return hotel.bar == includesBar
      });
       this.$store.state.searchedHotels=this.$store.state.searchedHotels.filter(hotel =>{
        return hotel.bar == includesBar
      })
    },

    clear() {
      console.log("Filters cleared")
        return this.$store.dispatch("fetchHotels")
    }  ,
    clear2() {
      console.log("Filters cleared")
        return this.$store.dispatch("fetchHotelBySearchPhrase")
    }
        
  }

}
</script>

<style scoped>
.trying{
display: flex;  

  background-color: rgba(80, 75, 85, .3);
  color: rgba(230, 230, 255, .6);
  box-shadow: 2px 2px 1px rgba(0, 0, 0, .2), inset 2px 2px 2px rgba(255, 255, 255, .05);
border-radius: 7px;
margin: 3px;
    margin-left: 1vw;
     width: 100%;
    height: min(5vh, 25vw);
    text-shadow: -1px -1px 2px rgba(0, 0, 0, .3), 1px 1px 2px rgba(126, 126, 126, .5);
    justify-content: center;
}
p{
  margin-left: 15px;
  background-color: rgb(17, 3, 3);
  color: rgb(255, 255, 255);
  padding-left:3px ;
  padding-right:3px;
  border-radius: 10px;
  cursor: pointer;
  max-height: 90%;
  margin-top: 2px;
  padding-top:2px;
			

 
  }



button{
  text-align: center;
  width: 100%;
}



</style>>
