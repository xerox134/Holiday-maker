<template>
  <div id="card">
    <!---------------------------------------------------------------------------ROOM CARD------------------------------------------------------------------------------------------>

    <div class="Room-card" v-if="type == 'room'">
      <span id="booked" v-if="!card.booked">
        <div><img v-bind:src="card.img" alt="" /><br /><br /><br /></div>
        <span id="room_nr"> Rumsnummer: {{ card.room_nr }}</span
        ><br /><br />
        <span id="beds"> Sängar: {{ card.beds }}</span
        ><br /><br />
        <span id="price">Pris: {{ card.price }}</span
        ><br /><br />
        <button @click="SendRoomToCart(card.id), addRoomPriceToTotal()">
          Boka
        </button>
      </span>
    </div>
        <!--.-->
    <!---------------------------------------------------------------------------HOTEL CARD------------------------------------------------------------------------------------------>

    <div class="Hotel-card" v-if="type == 'hotel'" @click="toRooms(card.id)">
      <span class="name"> {{ card.name }}</span
      ><br /><br />
      <div id="hotelContainer">
        <div id="bildPris">
          <img v-bind:src="card.img" alt="" /><br /><br /><br />

          <span
            ><p>Från {{ card.cheapest_price }} kr/natt</p>
            <br /><br />
          </span>
        </div>

        <div id="info">
          <span id="country">Land: {{ card.country }}</span
          ><br />
          <span id="city">Stad: {{ card.city }}</span
          ><br />
          <span id="address">Adress: {{ card.address }}</span
          ><br /><br />
          <span id="description">Info: {{ card.description }}</span
          ><br />
        </div>

        <div id="filter">
          <span id="review">⭐ {{ card.review }}/5</span><br />
          <span id="wifi" v-if="card.wifi">Wifi ✔</span>
          <span id="wifi" v-else>Wifi ✖</span><br />
          <span id="pool" v-if="card.pool">Pool ✔</span>
          <span id="pool" v-else>Pool ✖</span><br />
          <span id="entertainment" v-if="card.entertainment"
            >Underhållning ✔</span
          >
          <span id="entertainment" v-else>Underhållning ✖</span><br />
          <span id="childrens_club" v-if="card.childrens_club"
            >Barnklubb ✔</span
          >
          <span id="childrens_club" v-else>Barnklubb ✖</span><br />
          <span id="resturant" v-if="card.restaurant">Restaurang ✔</span>
          <span id="resturant" v-else>Restaurang ✖</span><br />
          <span id="bar" v-if="card.bar">Bar ✔</span>
          <span id="bar" v-else>Bar ✖</span><br />
          <span id="distance_to_beach"
            >{{ card.distance_to_beach }} km till strand</span
          ><br />
          <span id="distance_to_center"
            >{{ card.distance_to_center }} km till centrum</span
          ><br />
        </div>
      </div>

      <button v-if="type == 'hotel'" @click.stop="toReviews(card.id)">
        Recensioner ✍
      </button>
      <button @click.stop="favoriteItem(card.id)">Favoritmarkera ❤</button>
    </div>

    <!---------------------------------------------------------------------------FAVORITE CARD------------------------------------------------------------------------------------------>

    <div class="Favorite-card" v-if="type == 'favorite'">
      <img v-bind:src="card.hotel.img" alt="" /> <br />
      <span id="user">Hotellnamn: {{ card.hotel.name }}</span
      ><br /><br />
      <span id="Hotelcity">Stad: {{ card.hotel.city }}</span
      ><br /><br />
      <span id="Hotelcountry">Land: {{ card.hotel.country }}</span
      ><br /><br />
      <span id="Hoteldescription"
        >Beskrivning: {{ card.hotel.description }}</span
      ><br /><br />
      <button @click="FavoriteToRooms(card.hotel.id)">Boka rum</button>
      <button @click="deleteFavorite(card.id), refreshStuff()">
        Ta bort ✖
      </button>
    </div>

    <!---------------------------------------------------------------------------MY BOOKING CARD------------------------------------------------------------------------------------------>
    <div class="Booking-card" v-if="type == 'booking'">
      <img v-bind:src="card.room.img" alt="" />
      <br />
      <h3>{{ card.room.hotel.name }}</h3>
      <span id="room_nr">Rumsnummer: {{ card.room.room_nr }}</span
      ><br />
      <span id="beds">Antal sängar: {{ card.room.beds }}</span
      ><br />
      <span id="Price">{{ card.price }} kr</span><br /><br />
      <span>Bokat från {{ card.fromDate }}</span>
      <span> till {{ card.toDate }}</span
      ><br /><br />
      <button @click.stop="favoriteItem(card.room.hotel.id)">
        Favoritmarkera hotell ❤
      </button>
      <button @click="deleteFromBooking(card.id), refreshStuff()">
        Avboka ✖
      </button>

      <button v-if="type == 'booking'" @click.stop="toReviews(card.room.hotel.id)">
        Recensioner ✍
      </button>
    </div>

    <!---------------------------------------------------------------------------SHOPPING-CART CARD------------------------------------------------------------------------------------------>

    <div class="ShoppingCart-card" v-if="type == 'shoppingcart'">
      <img v-bind:src="card.img" alt="" /> <br />
      <span>Rumsnummer: {{ card.room_nr }}</span> <br />
      <div>
        <p>Antal vuxna: {{ getAdults }}</p>
      </div>
      <div>
        <p>Antal barn: {{ getChildren }}</p>
      </div>

      <div id="datum">
        <p>Datum: {{ getFromDate }} - {{ getToDate }}</p>
        <p>Antal nätter: {{ getNumberOfNights }}</p>
        <span>{{ card.price }} kr/natt</span>
        <br />
        <br />
      </div>
      <button id="addBedButton" @click="addABed()">Extrasäng ✔</button>
      <button id="removeBedButton" @click="removeABed()">Ta bort extrasäng ✖</button>

      <div id="luxuries-select">
        <select id="selected" @change="addInclusive">
          <option id="dropdown" value="0">Inga tillval</option>
          <option id="dropdown" value="200">All inclusive</option>
          <option id="dropdown" value="150">Full pension</option>
          <option id="dropdown" value="100">Halv pension</option>
        </select>
      </div>
    </div>
    <!---------------------------------------------------------------------------REVIEW  CARD------------------------------------------------------------------------------------------>
    <div class="Review-Card" v-if="type == 'review'">
      <span id="id"> Betyg: {{ card.rating }}</span
      ><br /><br />
      <span id="room_nr"> Beskrivning: {{ card.description }}</span
      ><br /><br />
      <span id="beds"> Skriven av: {{ card.user.email }}</span
      ><br /><br />
    </div>
  </div>
</template>
<script>
export default {
  props: ["card", "type"],

  computed: {
    getRoomsWithRoomId() {
      return this.$store.getters.getRoomsWithRoomId;
    },
    getFinalPrice() {
      return this.$store.getters.getFinalPrice;
    },
    getAdults() {
      return this.$store.getters.getNumberOfAdults;
    },
    getChildren() {
      return this.$store.getters.getNumberOfChildren;
    },
    getFromDate() {
      return this.$store.getters.getFromDate;
    },
    getToDate() {
      return this.$store.getters.getToDate;
    },
    getNumberOfNights() {
      return this.$store.getters.getNumberOfNights;
    },
  },

  methods: {
    addRoomPriceToTotal() {
      this.$store.state.totalPrice = this.card.price;
      this.$store.commit("setExtraBed", false);
      this.$store.commit("setWholePension", false);
      this.$store.commit("setHalfPension", false);
      this.$store.commit("setAllInclusive", false);
      this.$router.push("cart");
    },

    addABed() {
      console.log(this.$store.state.bedPriceManipulator);
      if (this.$store.state.bedPriceManipulator == 0) {
        this.$store.commit("setbedPriceManipulator", 1);
        console.log(this.$store.state.bedPriceManipulator);
        this.$store.commit("addABed", this.$store.state.bedPrice);
        this.$store.commit("setExtraBed", true);
        console.log(this.$store.state.extraBed);
      }
    },
    removeABed() {
      if (this.$store.state.bedPriceManipulator == 1) {
        this.$store.commit("setbedPriceManipulator", 0);
        this.$store.commit("removeABed", this.$store.state.bedPrice);
        this.$store.commit("setExtraBed", false);
        console.log(this.$store.state.extraBed);
      }
    },
    addInclusive() {
      var active = document.getElementById("selected");
      var taUtValueFrånOption = parseInt(
        active.options[active.selectedIndex].value
      );
      var value2String = JSON.stringify(taUtValueFrånOption);
      var intValue = parseInt(value2String);

      if (intValue == 200) {
        if (
          this.$store.state.temporaryNumber == 0 ||
          this.$store.state.temporaryNumber == 150 ||
          this.$store.state.temporaryNumber == 100
        ) {
          this.$store.state.totalPrice += intValue;
          this.$store.state.totalPrice -= this.$store.state.temporaryNumber;
          this.$store.state.temporaryNumber = 200;
          this.$store.commit("setWholePension", false);
          this.$store.commit("setHalfPension", false);
          this.$store.commit("setAllInclusive", true);
        }
      } else if (intValue == 150) {
        if (
          this.$store.state.temporaryNumber == 0 ||
          this.$store.state.temporaryNumber == 200 ||
          this.$store.state.temporaryNumber == 100
        ) {
          this.$store.state.totalPrice += intValue;
          this.$store.state.totalPrice -= this.$store.state.temporaryNumber;
          this.$store.state.temporaryNumber = 150;
          this.$store.commit("setWholePension", true);
          this.$store.commit("setHalfPension", false);
          this.$store.commit("setAllInclusive", false);
        }
      } else if (intValue == 100) {
        if (
          this.$store.state.temporaryNumber == 0 ||
          this.$store.state.temporaryNumber == 150 ||
          this.$store.state.temporaryNumber == 200
        ) {
          this.$store.state.totalPrice += intValue;
          this.$store.state.totalPrice -= this.$store.state.temporaryNumber;
          this.$store.state.temporaryNumber = 100;
          this.$store.commit("setWholePension", false);
          this.$store.commit("setHalfPension", true);
          this.$store.commit("setAllInclusive", false);
        }
      } else if (intValue == 0) {
        if (
          this.$store.state.temporaryNumber == 100 ||
          this.$store.state.temporaryNumber == 150 ||
          this.$store.state.temporaryNumber == 200
        ) {
          this.$store.state.totalPrice += intValue;
          this.$store.state.totalPrice -= this.$store.state.temporaryNumber;
          this.$store.state.temporaryNumber = 0;
          this.$store.commit("setWholePension", false);
          this.$store.commit("setHalfPension", false);
          this.$store.commit("setAllInclusive", false);
        }
      }
    },

    async toRooms(id) {
      this.$store.state.hotelId = id;

      console.log(this.$store.state.hotelId);
      console.log("We clicked");
      this.$router.push({
        name: "rooms",
      });
      window.scrollTo(0, 0);
    },

    async toReviews(id) {
      this.$store.state.hotelId = id;

      console.log(id);
      this.$router.push({
        name: "Reviews",
      });
    },

    async FavoriteToRooms(id) {
      this.$store.state.hotelId = id;

      console.log(this.$store.state.hotelId);
      console.log("We clicked");
      this.$router.push({
        name: "rooms",
      });
      window.scrollTo(0, 0);
    },

    refreshStuff() {
      this.$store.dispatch("fetchAllFavorites");
    },

    SendRoomToCart(id) {
      this.$store.state.roomId = id;
      console.log(this.$store.state.roomId);
      this.$store.dispatch("fetchRoomsWithRoomId");
    },

    async deleteFavorite(id) {
      let credentials = {
        hotelid: id,
      };
      let response = await fetch("/rest/favorites/" + id, {
        method: "DELETE",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(credentials),
      });
      if (response.url.includes("error")) {
        console.log("Something went wrong. Try again");
      } else {
        console.log("DELETED");
      }
    },

    async deleteFromBooking(id) {
      let credentials = {
        hotelid: { id: id },
      };
      let response = await fetch("/rest/bookings/" + id, {
        method: "DELETE",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(credentials),
      });
      if (response.url.includes("error")) {
        console.log("Something went wrong. Try again");
      } else {
        console.log("DELETED");
      }
    },

    async favoriteItem(id) {
      // id = card.id alltså hotelid

      let credentials = {
        hotel: { id: id },
      };

      let response = await fetch("/rest/favorites/", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(credentials),
      });

      console.log(credentials);
      if (response.url.includes("error")) {
        console.log("Something went wrong. Try again");
      } else {
        console.log("Saved as favorite");
      }
    },
  },
};
</script>


<style scoped>
#hotelContainer {
  display: flex;
}
#bildPris {
  padding: 0vh 1vw;
}

#filter {
  max-width: 40%;
  min-width: 50%;
  max-height: 5%;
  padding: 1vh;
  text-align: right;
}

#bild {
  float: left;
}

#Hotel-card {
  min-width: 100px;
}
#card {
  border-radius: 7px;
  color: rgba(19, 13, 9, 0.911);

  display: flex;
  list-style-type: none;
  background-color: rgba(16, 16, 17, 0.534);
  min-width: 90%;
  padding: 2vh;
  margin-bottom: 18px;
  margin-left: 80px;
  box-shadow: 4px 4px 2px rgba(0, 0, 0, 0.3),
    inset 2px 2px 2px rgba(240, 200, 255, 0.1);
  min-height: 4vh;
  max-width: 90%;

  justify-content: center;
  align-self: center;
  text-align: left;
}

#card:hover {
  color: rgba(255, 250, 235, 0.9);
  background-color: rgba(60, 55, 65, 0.7);
  box-shadow: 4px 4px 4px rgba(0, 0, 0, 0.3),
    inset 3px 3px 4px rgba(240, 200, 255, 0.15);
}
#selected {
  color: black;
  justify-content: center;
}

#card:active {
  color: rgba(230, 230, 255, 0.6);
  background-color: rgba(0, 0, 0, 0.1);
  box-shadow: inset -3px -3px 4px rgba(240, 200, 255, 0.1),
    inset 3px 3px 2px rgba(0, 0, 0, 0.2);
}
#dropdown {
  color: black;
  background-color: white;
}

.Favorite-card > .title {
  font-weight: bold;
  font-size: 2.4vh;
  text-shadow: 4px 3px 2px rgba(0, 0, 0, 0.3);
}
.Booking-card > .title {
  font-weight: bold;
  font-size: 2.4vh;
  text-shadow: 4px 3px 2px rgba(0, 0, 0, 0.3);
}

#desc {
  color: rgba(255, 255, 255, 0.6);
  font-size: 1.8vh;
  text-shadow: 3px 2px 2px rgba(0, 0, 0, 0.5);
}

.name {
  font-size: 3vh;
  font-weight: bold;
}

#desc {
  color: rgba(255, 255, 255, 0.6);
  font-size: 1.8vh;
  text-shadow: 3px 2px 2px rgba(0, 0, 0, 0.5);
}

.name {
  font-size: 3vh;
  font-weight: bold;
}
.Favorite-card:hover > #airtime {
  color: rgba(255, 255, 255, 0.6);
}
.Booking-card:hover > #airtime {
  color: rgba(255, 255, 255, 0.6);
}

button {
  border-radius: 7px;
  display: block;
  position: relative;
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
  width: 100%;
  height: min(5vh, 25vw);
  text-shadow: -1px -1px 2px rgba(0, 0, 0, 0.3),
    1px 1px 2px rgba(126, 126, 126, 0.5);
}

button:hover {
  background-color: rgba(80, 75, 85, 0.8);
}

button:active {
  color: rgba(230, 230, 255, 0.8);
  border: none;
  background-color: rgba(80, 75, 85, 0.1);
  box-shadow: inset -2px -2px 2px rgba(220, 180, 255, 0.1),
    inset 2px 2px 2px rgba(0, 0, 0, 0.2);
}

span {
  vertical-align: middle;
  font-size: 100%;
}

.isSelected {
  background-color: red;
}
</style>