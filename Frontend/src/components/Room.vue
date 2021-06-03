<template>
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
  <div v-if="getRoomByHotelId">
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
      resultArr: [],
      emptyArray: [],
      pointer:0
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

  methods: {
    toggle() {
      this.active = !this.active;
    },

    filterRoomsDate() {



      console.log("inne nu");
this.$store.state.allBookings.forEach(element => {
    if(element.fromDate>=this.$store.state.fromDate || element.toDate<this.$store.state.toDate){
        console.log("herhehrehrehh")
        this.pointer=0
        
    }
  
});
if(this.pointer==1){
    this.pointer==0
    console.log("endast rooms")
    return this.$store.state.rooms
} else{
      console.log("everything")
    this.filterBookableRooms();
      this.filterBookableRooms2();
      
      this.filterRoomsWithBookedRooms();
      this.fliterDuplicateRooms();
      this.makeRoomsArrayWork();

      console.log("detta är resultarr", this.resultArr);
}
    },
    filterBookableRooms() {
  console.log("1");
      this.$store.state.allBookings = this.$store.state.allBookings.filter(
        (bookedRooms) => {

            if(bookedRooms.fromDate >= this.$store.state.fromDate){ 

                
                return bookedRooms.fromDate >= this.$store.state.fromDate
                }
         
        }
      );
    },
    filterBookableRooms2() {
      console.log("1sta filter " ,this.$store.state.allBookings)
      console.log("2");
      this.$store.state.allBookings = this.$store.state.allBookings.filter(
        (bookedRooms) => {
          return bookedRooms.toDate <= this.$store.state.toDate;
        }
      );
    },
    filterRoomsWithBookedRooms() {
        console.log("2a filter" ,this.$store.state.allBookings)
      console.log("3");
      this.$store.state.allBookings.forEach((element) => {
        this.id.push(element.room.id);
      }),
        this.$store.state.rooms.forEach((element2) => {
          this.id.every((element3) => {
            console.log("denna?", element2.id);
            console.log("mot denna?", element3);

            console.log("____________________________________");
            if (element2.id !== element3) {
              console.log("WIIIIIIINNNNNN?");
              console.log("_____________________________");
              this.filterdArray.push(element2);
              return true;
            } else {
              console.log("Inne på funkar ej");
              console.log("funkar ej:", element2.id,element3)
              this.filterdArray.pop(element2);
              this.filterdArray.pop(element2);
              this.filterdArray.pop(element2);
              this.filterdArray.pop(element2);
              return false;
            }
          });
        });
    },
    fliterDuplicateRooms() {
      console.log("4");
      this.resultArr = this.filterdArray.filter((data, index) => {
        return this.filterdArray.indexOf(data) === index;
      });
    },
    makeRoomsArrayWork() {
      console.log("5");
      this.$store.state.rooms = this.resultArr;
      console.log("sista funktionen");
      this.$store.state.allBookings=this.$store.state.allBookings2
      this.filterdArray=this.emptyArray
    },
  },

  mounted() {
    console.log("we fetching");
    this.$store.dispatch("fetchHotelById");
    this.$store.dispatch("fetchRoomsByHotelId");
    this.$store.dispatch("fetchBookings");
    setTimeout(() => {
      this.filterRoomsDate();
    }, 500);

    console.log("hotelId = " + this.$store.getters.getHotelId);
  },
};
</script>