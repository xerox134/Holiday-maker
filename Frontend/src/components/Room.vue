<template>
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
      <li v-for="(room, index) in filteredRooms" :key="index">
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
  },

  mounted() {
    console.log("we fetching");
    this.$store.dispatch("fetchHotelById");
    this.$store.dispatch("fetchRoomsByHotelId");
    console.log("hotelId = " + this.$store.getters.getHotelId);
    console.log(this.$store.getters.getAllPeople);
  },
};
</script>