<template>
  <div>
    <div v-if="result === 'success'">
      <p>
        Betalningen har gått igenom! Klicka nedan för att slutföra din bokning
      </p>
      <button @click="confirmPayment"><router-link to="/bookings">Slutför bokningen!</router-link></button>
    </div>
    <div v-else>
      <p>Köpet gick inte att genomföra. Vänligen försök igen!</p>
      <button>
        <router-link to="/">Tillbaka till hotellsidan</router-link>
      </button>
    </div>
  </div>
</template>

<script>
export default {
  computed: {
    result() {
      return this.$route.params.result;
    },
  },
  methods: {
    async confirmPayment(userid) {
      userid = this.$store.state.loggedInUserId;
      let response = await fetch("/rest/confirmpayment/" + userid, {});
    },

    isSuccess() {
      return this.$route.params.result;
    },
  },
};
</script>
