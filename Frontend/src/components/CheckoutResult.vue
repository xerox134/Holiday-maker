<template>
<h1>{{result}}</h1>
    <div>
        <div v-if="result==='success'">
          <p>Betalningen har gått igenom! Klicka nedan för att slutföra din bokning</p>
          <button @click="finishBooking">Slutför bokningen!</button>
        </div>
        <div v-else>
          <p>Köpet gick inte att genomföra. Vänligen försök igen!</p>
          <button ><router-link to="/">Tillbaka till hotellsidan</router-link></button>
        </div>

        <button @click="finishBooking">test</button>
        <div>{{finishBooking}}</div>
        
    </div>
</template>

<script>
export default {
    computed:{
        result(){
            return this.$route.params.result
        }
    },
    methods:{
      async confirmPayment(userid) {
      // id = card.id alltså hotelid
      userid = this.$store.state.loggedInUserId

      let response = await fetch("/rest/confirmpayment/" + userid, {
        method: "PUT",
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
      
      finishBooking(){
        console.log(this.$store.getters.getAllBookings)
        
      },
      isSuccess(){
        return this.$route.params.result
      }
    },
    mounted(){
      this.$store.dispatch('fetchAllBookings')
    }
}
</script>
