<template>
<div id="sort">
   <span class="trying" > <p>  Stars</p> <p @click="toggleReview(), toggleSearchedReview()">⬆</p> <p @click="toggleReview2(),toggleSearchedReview2()">⬇</p> </span><br>
    <span class="trying" ><p>Price</p> <p @click="togglePrice(),toggleSearchedPrice()">⬆</p> <p @click="togglePrice2(),toggleSearchedPrice2()">⬇</p> </span><br>
    <span class="trying" ><p>Beach </p><p @click="toggleBeach(), toggleSearchedBeach()">⬆</p> <p @click="toggleBeach2(),toggleSearchedBeach2()">⬇</p> </span><br>
    <span class="trying" ><p>Centrum </p><p @click="toggleCentrum(),toggleSearchedCentrum()">⬆</p> <p @click="toggleCentrum2(),toggleSearchedCentrum2()">⬇</p> </span><br>

    </div>
</template>

<script>
export default {



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
      clear() {
      console.log("Filters cleared")
        return this.$store.dispatch("fetchHotels")
    }  ,
    clear2() {
      console.log("Filters cleared")
        return this.$store.dispatch("fetchHotelBySearchPhrase")
    },
    },
}
</script>

<style>

#sort{
    display: flex;
}

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
  
  color: rgb(255, 255, 255);
  padding-left:3px ;
  padding-right:3px;
  border-radius: 10px;
  cursor: pointer;
  max-height: 90%;
  margin-top: 2px;
  padding-top:7px;
			

 
  }

</style>