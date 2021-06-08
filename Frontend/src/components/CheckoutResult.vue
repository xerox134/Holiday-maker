<template>
<h1>{{result}}</h1>
    <div>
        <div v-if="isSuccess===success">
          <p>Betalningen har gått igenom! Klicka nedan för att slutföra din bokning</p>
          <button @click="finishBooking">Slutför bokningen!</button>
        </div>
        <div v-else>
          <p>Köpet gick inte att genomföra. Vänligen försök igen!</p>
          <button ><router-link to="/">Tillbaka till hotellsidan</router-link></button>
        </div>
        
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
      finishBooking(){
        
      },
      isSuccess(){
        return this.$route.params.result
      }
    }
}
</script>
