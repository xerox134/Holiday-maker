<template>

  <label for="start">Start date:</label>
  <input class="dateSelect" type="date" id="fromDate" name="trip-start" v-model="fromDate">
  <label for="start">End date:</label>
  <input class="dateSelect" type="date" id="toDate" name="trip-start" v-model="toDate">

   <div class="peopleAmount">
    <button class="dropbtn">Ppl Amount</button>
    <div class="dropdown-content">
    <button @click="removeAdult">-</button>
    Adults: {{ getAdults }}
    <button @click="addAdult">+</button>
    <button @click="removeChild">-</button>
    Children: {{ getChildren }}
    <button @click="addChild">+</button>
    </div>
  </div>

 
  <input id="searchBar" v-on:keyup.enter="searchForHotel(searchPhrase)" 
    type="text" placeholder="Sök..." v-model="searchPhrase" >
  <button @click="searchForHotel(searchPhrase)">Sök</button>
 <div id="topSort"><topSort/></div>

 

  <ol id="HotelList">
    <li v-for="(hotel, index) in getSearchedHotels"  :key="index" >
      <Card :card="hotel"  :type="'hotel'"/>
    </li>
  </ol>

</template>

<script>
import Card from "../components/Card";
import topSort from "../components/topSort.vue"

export default {
  
  name:"SearchBar",

  components: {
    Card, 
    topSort,
   
  },

  computed: {
    getSearchedHotels(){
      return this.$store.getters.getSearchedHotels
    },
    getAdults(){
      return this.$store.getters.getNumberOfAdults
    },
    getAllPeople(){
      console.log(this.$store.getters.getAllPeople);
      return this.$store.getters.getAllPeople
    },
    
    getChildren(){
      return this.$store.getters.getNumberOfChildren
    },
  },

  methods: {

    toggleList(toggleSearch){
      console.log(toggleSearch)
      this.$store.commit('setToggleList',toggleSearch)
    },

    searchForHotel(phrase){
      if (phrase != undefined){
      this.setDates()
      this.$store.commit('setHotelSearchPhrase',phrase);
      this.$store.dispatch("fetchHotelBySearchPhrase");
      this.toggleList(false)
      } else {
        this.setDates()
      }    
    },

    setDates(){
      this.$store.commit('setFromDate', this.fromDate)
      this.$store.commit('setToDate', this.toDate)
      console.log('fromDate \n' + this.$store.state.fromDate)
      console.log('toDate \n' + this.$store.state.toDate)
    },

    addAdult() {
      if(this.$store.state.numberOfAdults === 5) {
        alert("Only five adults can be booked at a time")
        this.$store.state.numberOfAdults--
        this.$store.state.numberOfAll--
      }
      this.$store.state.numberOfAdults++
      this.$store.state.numberOfAll ++
    },

    addPerson(){
      this.$store.commit('addAPerson',1)
    },

    removeAdult() {
      if (this.$store.state.numberOfAdults === 1) {
        alert("At least one adult is required to book a room")
      } else {
        this.$store.state.numberOfAdults--
        this.$store.state.numberOfAll --
      }
    },

    addChild() {
      if(this.$store.state.numberOfChildren === 5) {
        alert("Only five children can be booked at a time")
        this.$store.state.numberOfChildren--
        this.$store.state.numberOfAll--
      }
      this.$store.state.numberOfChildren++
      this.$store.state.numberOfAll ++

    },

    removeChild() {
      if (this.$store.state.numberOfChildren === 0) {
        alert("Negative quantity not allowed")
      } else {
        this.$store.state.numberOfChildren--
        this.$store.state.numberOfAll --

      }
    },

    filterToDate() {
      console.log("fromDate Filter " + this.$store.state.fromDate)
      this.$store.state.hotels = this.$store.state.hotels.filter(hotel => {
        return hotel.distance_to_beach <= this.$store.state.fromDate
      })
    }, 
  },

  mounted() {
    console.log(this.$store.state.fromDate)
  }
}
</script>

<style scoped>

.dropbtn {
  border-radius: 10px;
  top: -2vh;
  left: 1px;
  border: none;
  outline: none;
  background-color: rgba(80, 75, 85, .3);
  color: rgba(230, 230, 255, .6);
  box-shadow: 2px 2px 1px rgba(0, 0, 0, .2), inset 2px 2px 2px rgba(255, 255, 255, .05);
  margin: 3px;
  margin-left: 1vw;
  margin-bottom: 10px;
  padding-left: 20px;
  padding-right: 20px;
  padding-top: 5px;
  padding-bottom: 5px;
  height: min(5vh, 25vw);
  text-shadow: -1px -1px 2px rgba(0, 0, 0, .3), 1px 1px 2px rgba(126, 126, 126, .5);
  
}
.peopleAmount{
  position: relative;
  display: inline-flex;
}
.dropdown-content {
  display: none;
  position: absolute;
  background-color: black;
  min-width: 250px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
  top: 38px;
  right: -80px;
  width: 100px;
  height: 100px;
}
.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown-content a:hover {background-color: #ddd;}

.peopleAmount:hover .dropdown-content {display: block;}

.peopleAmount:hover .dropbtn {background-color: rgba(80, 75, 85, .3);;}

.dateSelect{
  border-radius: 10px;
  top: -2vh;
  left: 1px;
  border: none;
  outline: none;
  background-color: rgba(80, 75, 85, .3);
  color: rgba(230, 230, 255, .6);
  box-shadow: 2px 2px 1px rgba(0, 0, 0, .2), inset 2px 2px 2px rgba(255, 255, 255, .05);
  margin: 3px;
  margin-left: 1vw;
  margin-bottom: 10px;
  padding-left: 20px;
  padding-right: 20px;
  padding-top: 5px;
  padding-bottom: 5px;
  height: min(5vh, 25vw);
  text-shadow: -1px -1px 2px rgba(0, 0, 0, .3), 1px 1px 2px rgba(126, 126, 126, .5);
}


#searchBar{
  border-radius: 10px;
  top: -2vh;
  left: 1px;
  border: none;
  outline: none;
  background-color: rgba(80, 75, 85, .3);
  color: rgba(230, 230, 255, .6);
  box-shadow: 2px 2px 1px rgba(0, 0, 0, .2), inset 2px 2px 2px rgba(255, 255, 255, .05);
  margin: 3px;
  margin-left: 1vw;
  margin-bottom: 10px;
  padding-left: 20px;
  padding-right: 20px;
  padding-top: 5px;
  padding-bottom: 5px;
  height: min(5vh, 25vw);
  text-shadow: -1px -1px 2px rgba(0, 0, 0, .3), 1px 1px 2px rgba(126, 126, 126, .5);
}

#searchBar:hover{
  color: rgba(255, 250, 235, .9);
  background-color: rgba(80, 75, 85, .8);
  box-shadow: 4px 4px 4px rgba(0, 0, 0, .3), inset 3px 3px 4px rgba(240, 200, 255, .15);
}

#searchBar:focus{
  color: rgba(230, 230, 255, .8);
  border: none;
  background-color: rgba(80, 75, 85, .1);
  box-shadow: inset -2px -2px 2px rgba(220, 180, 255, .1), inset 2px 2px 2px rgba(0, 0, 0, .2);
}





</style>