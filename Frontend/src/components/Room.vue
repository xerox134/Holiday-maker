<template>
  <div>{{ this.$store.state.allBookings }}</div>
  <div>{{ id }}</div>
  <button @click="filterRoomsDate()"></button>
  <button @click="$router.push('ongoingbooking')">Continue to booking</button>
  <div>
    <ol id="HotelList">
      <li v-for="(hotel, index) in getHotelById" :key="index">
        <!--false=boolean till episodeToggle-->
        <Card :card="hotel" :type="'hotel'" />
      </li>
    </ol>
  </div>
  <h2>Available rooms</h2>
  <div>
    <ol id="RoomsList">
      <li v-for="(room, index) in getRoomByHotelId" :key="index">
        <!--false=boolean till episodeToggle-->
        <Card :card="room" :type="'room'" />
      </li>
    </ol>
  </div>
  _______________________________________________________________________________________________________________________
  
</template>


<script>
import Card from "../components/Card";
export default {
  name: "Hotels",

  data() {
    return {
      id: [],
      filterdArray: [],
      REAL: [],
      resultArr:[]
    };
  },

  components: {
    Card,
  },

  computed: {
    getRoomByHotelId() {
      return this.$store.getters.getRoomByHotelId;
    },
    getHotelById() {
      return this.$store.getters.getHotelById;
    },
  },

  created: function () {

  },

 

  methods: {
    toggle() {
      this.active = !this.active;
    },

    filterRoomsDate() {
      this.filterBookableRooms2();
      this.filterBookableRooms();
      this.getId();
      this.filterRoomsWithBookedRooms();
      this.fliterDuplicateRooms();
      this.makeRoomsArrayWork();

    },

    filterBookableRooms() {
      this.$store.state.allBookings = this.$store.state.allBookings.filter(
        (bookedRooms) => {
          return bookedRooms.toDate <= this.$store.state.toDate;
        }
      );
    },
    filterBookableRooms2() {
      this.$store.state.allBookings = this.$store.state.allBookings.filter(
        (bookedRooms) => {
          return bookedRooms.fromDate >= this.$store.state.fromDate;
        }
      );
    },

    getId() {
      this.$store.state.allBookings.forEach((element) => {
        this.filterdArray.push(element);
        console.log("Filtrerade arrayen i getID", this.filterdArray),
          this.id.push(element.room.id);
      });

      this.$store.state.bookedRoomsId = this.filterdArray;
      console.log(this.$store.state.bookedRoomsId);
    },

    filterRoomsWithBookedRooms() {
      this.$store.state.rooms.forEach((element2) => {
        this.id.every((element3) => {
          console.log("denna?", element2.id);
          console.log("mot denna?", element3);

        

          console.log("____________________________________");

          if (element2.id !== element3) {
            console.log("WIIIIIIINNNNNN?");
            console.log("_____________________________");
            this.REAL.push(element2);
            return true
            
          } else {
            console.log("Inne på funkar ej");
            return false
          }
        });
      });
    },


    fliterDuplicateRooms(){
        this.resultArr = this.REAL.filter((data,index)=>{
  return this.REAL.indexOf(data) === index;
})
    },

    makeRoomsArrayWork(){
        this.$store.state.rooms=this.resultArr
    }
  },
 



  mounted() {
    console.log("we fetching");
    this.$store.dispatch("fetchHotelById");
    this.$store.dispatch("fetchRoomsByHotelId");
    this.$store.dispatch("fetchBookings");
    console.log("hotelId = " + this.$store.getters.getHotelId);
    this.filterRoomsDate();
 

  

  },
};
</script>