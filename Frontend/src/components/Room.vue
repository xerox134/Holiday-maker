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
  <div>
    <ol id="RoomsList">
      <li v-for="(room, index) in getRoomByHotelId" :key="index">
        <!--false=boolean till episodeToggle-->
        <Card :card="room" :type="'room'" />
      </li>
    </ol>
  </div>
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
      pointer: 0,
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
    filteredRooms() {
      return this.$store.state.rooms.filter((room) => {
        return room.beds >= this.$store.getters.getAllPeople;
      });
    },
  },

  methods: {
    toggle() {
      this.active = !this.active;
    },

    filterRoomsDate() {
      // JÄMFÖR OM DET FINNS BOOKINGS SOM ÄR BOKADE UNDER DATUM
      console.log("FilterRoomsDate börjar");
      this.$store.state.allBookings.forEach((element) => {
        console.log("datum före:", this.$store.state.fromDate);
        console.log("datum efter:", this.$store.state.toDate);
        console.log("booking före:", element.fromDate);
        console.log("booking efter:", element.toDate);
        if (
          this.$store.state.fromDate <= element.fromDate &&
          this.$store.state.toDate >= element.fromDate &&
          this.$store.state.toDate <= element.toDate
        ) {
          console.log("FÖRE INNE");
          this.pointer = 1;
        } else if (
          this.$store.state.fromDate >= element.fromDate &&
          this.$store.state.fromDate <= element.toDate &&
          this.$store.state.toDate >= element.toDate
        ) {
          console.log("INNE EFTER");
          this.pointer = 1;
        } else if (
          this.$store.state.fromDate <= element.fromDate &&
          this.$store.state.toDate >= element.toDate
        ) {
          console.log("FÖRE EFTER");
          this.pointer = 1;
        } else if (
          this.$store.state.fromDate >= element.fromDate &&
          this.$store.state.toDate <= element.toDate
        ) {
          console.log("INNE INNE");
          this.pointer = 1;
        } else console.log("ingen funka!");
      });

      //IFALL DET FINNS SÅ GÅR VI IN I METODERNA ANNARS RETURERAR VI ENDAST ROOMS DIREKT

      if (this.pointer == 0) {
        console.log("endast rooms");
        return this.$store.state.rooms;
      } else {
        // METODERNA BÖRJAR!
        console.log("everything");
        this.filterBookableRooms();
        this.filterRoomsWithBookedRooms();
        this.fliterDuplicateRooms();
        this.makeRoomsArrayWork();

        console.log("detta är resultarr", this.resultArr);
        this.pointer = 0;
      }
    },

    filterBookableRooms() {
      console.log("1");
      this.$store.state.allBookings = this.$store.state.allBookings.filter(
        (element) => {
          if (
            this.$store.state.fromDate <= element.fromDate &&
            this.$store.state.toDate >= element.fromDate &&
            this.$store.state.toDate <= element.toDate
          ) {
            console.log("FÖRE INNE");
            return element;
          } else if (
            this.$store.state.fromDate >= element.fromDate &&
            this.$store.state.fromDate <= element.toDate &&
            this.$store.state.toDate >= element.toDate
          ) {
            console.log("INNE EFTER");
            return element;
          } else if (
            this.$store.state.fromDate <= element.fromDate &&
            this.$store.state.toDate >= element.toDate
          ) {
            console.log("FÖRE EFTER");
            return element;
          } else if (
            this.$store.state.fromDate >= element.fromDate &&
            this.$store.state.toDate <= element.toDate
          ) {
            console.log("INNE INNE");
            return element;
          }
        }
      );
    },

    filterRoomsWithBookedRooms() {
      console.log("2a filter", this.$store.state.allBookings);
      console.log("2");
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
              console.log("funkar ej:", element2.id, element3);
              var k = this.id.length;
              var i;
              for (i = 0; i < k; i++) {
                this.filterdArray.pop(element2);
                console.log(k);
              }

              return false;
            }
          });
        });
    },
    fliterDuplicateRooms() {
      console.log("3");
      this.resultArr = this.filterdArray.filter((data, index) => {
        return this.filterdArray.indexOf(data) === index;
      });
    },
    makeRoomsArrayWork() {
      console.log("4");
      this.$store.state.rooms = this.resultArr;
      console.log("sista funktionen");
      this.$store.state.allBookings = this.$store.state.allBookings2;
      this.filterdArray = this.emptyArray;
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