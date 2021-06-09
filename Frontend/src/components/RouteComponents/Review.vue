<template>
  <div>
    <ol id="HotelList">
      <li v-for="(hotel, index) in getHotelById" :key="index">
        <!--false=boolean till episodeToggle-->
        <Card :card="hotel" :type="'hotel'" />
      </li>
    </ol>
  </div>
  <div>
    <form id="reviewform" @submit="addReview" v-if="isAuthenticated">
      <textarea
        name=""
        id=""
        cols="30"
        rows="10"
        v-model="description"
      ></textarea
      ><br /><br />
      <input id="rating" type="range" min="1" max="5" v-model="rating" />{{
        rating
      }}<br /><br />
      <input type="submit" value="Lägg upp recension" /><br /><br />
    </form>
  </div>
  <h2>Recensioner</h2>
  <div>
    <ol id="ReviewList">
      <li v-for="(review, index) in getReviewsByHotelId" :key="index">
        <!--false=boolean till episodeToggle-->
        <Card :card="review" :type="'review'" />
      </li>
    </ol>
  </div>
</template>

<script>
import Card from "../Card";

export default {
  components: {
    Card,
  },

  data() {
    return {
      rating: "3",
      description: "",
    };
  },

  computed: {
    getHotelById() {
      return this.$store.getters.getHotelById;
    },
    getReviewsByHotelId() {
      return this.$store.getters.getReviewsByHotelId;
    },
    isAuthenticated() {
      return this.$store.getters.getCurrentUser;
    },
  },

  methods: {
    async addReview() {
      console.log(this.rating);
      console.log(this.description);
      console.log(this.$store.state.hotelId);
      const requestOptions = {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          rating: this.rating,
          description: this.description,
          hotel: {
            id: this.$store.state.hotelId,
          },
        }),
      };
      const response = await fetch("rest/reviews", requestOptions);
      const data = await response.json();
      this.postId = data.id;
    },
  },

  mounted() {
    this.$store.dispatch("fetchHotelById");
    this.$store.dispatch("fetchReviewsByHotelId");
  },
};
</script>

<style scoped>
textarea{
  color: black;
}
input {
  border-radius: 7px;
  border: none;
  outline: none;
  background-color: rgba(80, 75, 85, 0.3);
  color: rgba(230, 230, 255, 0.6);
  box-shadow: 2px 2px 1px rgba(0, 0, 0, 0.2),
    inset 2px 2px 2px rgba(255, 255, 255, 0.05);
  height: min(5vh, 25vw);
  text-shadow: -1px -1px 2px rgba(0, 0, 0, 0.3),
    1px 1px 2px rgba(126, 126, 126, 0.5);
    padding: 1vw
}

input:hover {
  background-color: rgba(80, 75, 85, 0.8);
}

input:active {
  color: rgba(230, 230, 255, 0.8);
  border: none;
  background-color: rgba(80, 75, 85, 0.1);
  box-shadow: inset -2px -2px 2px rgba(220, 180, 255, 0.1),
    inset 2px 2px 2px rgba(0, 0, 0, 0.2);
}
</style>