<template>
      <div>
        <ol id="HotelList">
            <li v-for="(hotel, index) in getHotelById"  :key="index" >   <!--false=boolean till episodeToggle-->
                <Card :card="hotel" :type="'hotel'"/>  
            </li>
        </ol>
    </div>
    <div>
      <form id="reviewform" @submit="addReview" v-if="isAuthenticated">
        <textarea name="" id="" cols="30" rows="10" v-model="description"></textarea><br><br>
        <input id="rating" type="range" min="1" max="5" v-model="rating" />{{ rating }}<br><br>
        <input type="submit" value="Lägg upp recension"><br><br>
      </form>
    </div>
    <h2>Reviews</h2>
    <div>
        <ol  id="ReviewList">
            <li v-for="(review, index) in getReviewsByHotelId"  :key="index" >   <!--false=boolean till episodeToggle-->
                <Card :card="review" :type="'review'"/>  
            </li>
        </ol>
  
    </div>
</template>

<script>
import Card from '../Card'

export default {

  components: {
    Card
  },

  data() {
    return {
      rating: "3",
      description: ''
    }
  },

  computed: {
    getHotelById() {
      return this.$store.getters.getHotelById
    },
    getReviewsByHotelId() {
      return this.$store.getters.getReviewsByHotelId
    },
    isAuthenticated() {
      return this.$store.getters.getCurrentUser
    }
  },

  methods: {
    async addReview() {
      console.log(this.rating)
      console.log(this.description)
      console.log(this.$store.state.hotelId);
      const requestOptions = {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          rating: this.rating,
          description: this.description,
          hotel: {
            id: this.$store.state.hotelId
          }
        })
      };
      const response = await fetch("rest/reviews", requestOptions);
      const data = await response.json();
      this.postId = data.id;
    }
  },

  mounted() {
    this.$store.dispatch("fetchHotelById")
    this.$store.dispatch("fetchReviewsByHotelId")
  }

}
</script>

<style>

</style>