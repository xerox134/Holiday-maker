<template>
  <div id="everything">
    <div id="Search">
      <div class="searchContainer">
        <input
          id="searchBar"
          v-on:keyup.enter="searchForHotel(searchPhrase)"
          type="text"
          placeholder="Vart vill du åka?"
          v-model="searchPhrase"
        />
      </div>
      <div class="searchContainer">

        <!--DATUM: V model till set date funktion. Set date kallas genom submitknappen(searchforhotel) längst ner.-->
        <label for="start">Från: </label>
        <input
          class="dateSelect"
          type="date"
          id="fromDate"
          name="trip-start"
          v-model="fromDate"
        />
        <label for="start"> Till: </label>
        <input
          class="dateSelect"
          type="date"
          id="toDate"
          name="trip-start"
          v-model="toDate"
        />
      </div>

      <div class="peopleAmount">
        <button class="dropbtn">Antal</button>
        <div class="dropdown-content">
          <button @click="removeAdult">-</button>
          Vuxen: {{ getAdults }}
          <button @click="addAdult">+</button>
          <button @click="removeChild">-</button>
          Barn: {{ getChildren }}
          <button @click="addChild">+</button>
        </div>
      </div>

      <button @click="searchForHotel(searchPhrase)">Sök</button>
    </div>
    <div id="sort">
      <span class="trying">
        <p>Stjärnor⭐</p>
        <p @click="toggleReview(), toggleSearchedReview()">⬆</p>
        <p @click="toggleReview2(), toggleSearchedReview2()">⬇</p> </span
      ><br />
      <span class="trying"
        ><p>Pris 💲</p>
        <p @click="togglePrice(), toggleSearchedPrice()">⬆</p>
        <p @click="togglePrice2(), toggleSearchedPrice2()">⬇</p> </span
      ><br />
      <span class="trying"
        ><p>Strand 🌅</p>
        <SliderBeach
      /></span>
      <span class="trying"
        ><p>Centrum 🌆</p>
        <SliderCenter
      /></span>

      <button @click="clear(), clear2()">❌</button><br />
    </div>

    <ol id="HotelList">
      <li v-for="(hotel, index) in getSearchedHotels" :key="index">
        <Card :card="hotel" :type="'hotel'" />
      </li>
    </ol>
  </div>
</template>

<script>
import SliderBeach from "./SearchBarSliders/SliderBeach";
import SliderCenter from "./SearchBarSliders/SliderCenter";
import Card from "../Card";

export default {
  name: "SearchBar",

  components: {
    SliderBeach,
    SliderCenter,
    Card,
  },

  computed: {
    fromDate:{
      get(){
      return this.$store.state.fromDate
      },
      set(date){
      this.$store.state.fromDate = date
      }

    },
    toDate:{
      get(){
      return this.$store.state.toDate
      },
      set(date){
      this.$store.state.toDate = date
      }

    },
    getSearchedHotels() {
      return this.$store.getters.getSearchedHotels;
    },
    getAdults() {
      return this.$store.getters.getNumberOfAdults;
    },
    getAllPeople() {
      console.log(this.$store.getters.getAllPeople);
      return this.$store.getters.getAllPeople;
    },

    getChildren() {
      return this.$store.getters.getNumberOfChildren;
    },
  },

  methods: {
    toggleReview() {
      return this.$store.state.hotels.sort((b, a) => a.review - b.review);
    },

    toggleReview2() {
      return this.$store.state.hotels.sort((a, b) => a.review - b.review);
    },

    toggleSearchedReview() {
      return this.$store.state.searchedHotels.sort(
        (b, a) => a.review - b.review
      );
    },

    toggleSearchedReview2() {
      return this.$store.state.searchedHotels.sort(
        (a, b) => a.review - b.review
      );
    },

    togglePrice() {
      return this.$store.state.hotels.sort(
        (b, a) => a.cheapest_price - b.cheapest_price
      );
    },

    togglePrice2() {
      return this.$store.state.hotels.sort(
        (a, b) => a.cheapest_price - b.cheapest_price
      );
    },

    toggleSearchedPrice() {
      return this.$store.state.searchedHotels.sort(
        (b, a) => a.cheapest_price - b.cheapest_price
      );
    },

    toggleSearchedPrice2() {
      return this.$store.state.searchedHotels.sort(
        (a, b) => a.cheapest_price - b.cheapest_price
      );
    },

    clear() {
      console.log("Filters cleared");
      location.reload();
      return this.$store.dispatch("fetchHotels");
    },
    clear2() {
      console.log("Filters cleared");
      return this.$store.dispatch("fetchHotelBySearchPhrase");
    },

    toggleList(toggleSearch) {
      console.log(toggleSearch);
      this.$store.commit("setToggleList", toggleSearch);
    },

    searchForHotel(phrase) {
      if (phrase != undefined) {
        this.setDates();
        this.$store.commit("setHotelSearchPhrase", phrase);
        this.$store.dispatch("fetchHotelBySearchPhrase");
        this.toggleList(false);
      } else {
        this.setDates();
      }
    },

    setDates() {



      if (
        this.fromDate < new Date().toISOString().substr(0, 10) ||
        this.toDate < this.fromDate
      ) {
        alert("You cant go back in time my friend");
      } else   
      
      // Antal dagar i varukorg
      console.log(this.fromDate, this.toDate)
      var fromDateTime = new Date(this.fromDate)
      var toDateTime = new Date (this.toDate)
      var oneDay = 1000 * 60 * 60 * 24;
      var diffInTime = toDateTime.getTime() - fromDateTime.getTime();
      var diffInDays = Math.round(diffInTime / oneDay);
      this.$store.commit("setNumberOfNights", diffInDays)
      console.log("Nr of nights: ", diffInDays);
      
      // From date - to date i search!
      this.$store.commit("setFromDate", this.fromDate);
      this.$store.commit("setToDate", this.toDate);
      console.log("fromDate \n" + this.$store.state.fromDate);
      console.log("toDate \n" + this.$store.state.toDate);

      
    },

    addAdult() {
      if (this.$store.state.numberOfAdults === 5) {
        alert("Only five adults can be booked at a time");
        this.$store.state.numberOfAdults--;
        this.$store.state.numberOfAll--;
      }
      this.$store.state.numberOfAdults++;
      this.$store.state.numberOfAll++;
    },


    removeAdult() {
      if (this.$store.state.numberOfAdults === 1) {
        alert("At least one adult is required to book a room");
      } else {
        this.$store.state.numberOfAdults--;
        this.$store.state.numberOfAll--;
      }
    },

    addChild() {
      if (this.$store.state.numberOfChildren === 5) {
        alert("Only five children can be booked at a time");
        this.$store.state.numberOfChildren--;
        this.$store.state.numberOfAll--;
      }
      this.$store.state.numberOfChildren++;
      this.$store.state.numberOfAll++;
    },

    removeChild() {
      if (this.$store.state.numberOfChildren === 0) {
        alert("Negative quantity not allowed");
      } else {
        this.$store.state.numberOfChildren--;
        this.$store.state.numberOfAll--;
      }
    },

    filterToDate() {
      console.log("fromDate Filter " + this.$store.state.fromDate);
      this.$store.state.hotels = this.$store.state.hotels.filter((hotel) => {
        return hotel.distance_to_beach <= this.$store.state.fromDate;
      }); //helt galet//
    },
  },

  mounted() {
    console.log(this.$store.state.fromDate);
  },
};
</script>

<style scoped>
#sort {
  display: flex;
}

#Search {
  display: flex;
  justify-content: space-between;
  align-items: center;
  justify-content: center;
  text-align: center;
  


}

#searchBar {

  align-items: center;
  justify-content: center;
  margin-right: 10px;

}
.trying {
  display: flex;

  background-color: rgba(80, 75, 85, 0.3);
  color: rgba(230, 230, 255, 0.6);
  box-shadow: 2px 2px 1px rgba(0, 0, 0, 0.2),
    inset 2px 2px 2px rgba(255, 255, 255, 0.05);
  border-radius: 7px;
  margin: 3px;
  margin-left: 1vw;
  width: 100%;
  height: min(5vh, 25vw);
  text-shadow: -1px -1px 2px rgba(0, 0, 0, 0.3),
    1px 1px 2px rgba(126, 126, 126, 0.5);
  justify-content: center;
}
input{
  border-radius: 10px;
  top: -2vh;
  left: 1px;
  border: none;
  outline: none;
  background-color: rgba(80, 75, 85, 0.3);
  color: rgba(230, 230, 255, 0.6);
  box-shadow: 2px 2px 1px rgba(0, 0, 0, 0.2),
    inset 2px 2px 2px rgba(255, 255, 255, 0.05);
  margin: 3px;
  margin-left: 1vw;
  margin-bottom: 10px;
  padding-left: 20px;
  padding-right: 20px;
  padding-top: 5px;
  padding-bottom: 5px;
  height: min(5vh, 25vw);
  text-shadow: -1px -1px 2px rgba(0, 0, 0, 0.3),
    1px 1px 2px rgba(126, 126, 126, 0.5);
}
button{
  border-radius: 10px;
  top: -2vh;
  left: 1px;
  border: none;
  outline: none;
  background-color: rgba(80, 75, 85, 0.3);
  color: rgba(230, 230, 255, 0.6);
  box-shadow: 2px 2px 1px rgba(0, 0, 0, 0.2),
    inset 2px 2px 2px rgba(255, 255, 255, 0.05);
  margin: 3px;
  margin-left: 1vw;
  margin-bottom: 10px;
  padding-left: 20px;
  padding-right: 20px;
  padding-top: 5px;
  padding-bottom: 5px;
  height: min(5vh, 25vw);
  text-shadow: -1px -1px 2px rgba(0, 0, 0, 0.3),
    1px 1px 2px rgba(126, 126, 126, 0.5);
}
p {
  margin-left: 15px;

  color: rgb(255, 255, 255);
  padding-left: 3px;
  padding-right: 3px;
  border-radius: 10px;
  cursor: pointer;
  max-height: 90%;
  margin-top: 2px;
  padding-top: 7px;
}

.dropbtn {
  border-radius: 10px;
  top: -2vh;
  left: 1px;
  border: none;
  outline: none;
  background-color: rgba(80, 75, 85, 0.3);
  color: rgba(230, 230, 255, 0.6);
  box-shadow: 2px 2px 1px rgba(0, 0, 0, 0.2),
    inset 2px 2px 2px rgba(255, 255, 255, 0.05);
  margin: 3px;
  margin-left: 1vw;
  margin-bottom: 10px;
  padding-left: 20px;
  padding-right: 20px;
  padding-top: 5px;
  padding-bottom: 5px;
  height: min(5vh, 25vw);
  text-shadow: -1px -1px 2px rgba(0, 0, 0, 0.3),
    1px 1px 2px rgba(126, 126, 126, 0.5);
}
.peopleAmount {
  position: relative;
  display: inline-flex;
}
.dropdown-content {
  display: none;
  position: absolute;
  background-color: rgb(38, 39, 63);
  min-width: 250px;
  box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
  z-index: 1;
  top: 38px;
  right: -100px;
  width: 100px;
  height: 100px;
  border-radius: 7px;
}
.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown-content a:hover {
  background-color: #ddd;
}

.peopleAmount:hover .dropdown-content {
  display: block;
}

.peopleAmount:hover .dropbtn {
  background-color: rgba(80, 75, 85, 0.3);
}
</style>