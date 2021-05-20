<template>

   
<div id="topBar">

    
  <div id="nav">
 
    <router-link to="/">Home</router-link> |
    <router-link to="/about">About</router-link> |
    <router-link to="/favorites">Favorites</router-link> |
    <router-link to="/bookings">Bookings</router-link> 
   
   
  </div>
  

<div id="login">
  <router-link to="/login" v-if="!isLoggedIn">Login</router-link>
    <router-link to="/" @click="logout" v-else>Log out (logged in as {{ loggedInUser.email }})</router-link>
</div>

</div>



<div id="test">
 <img id="icon" v-bind:src=image alt="" />
  <h1 id="title">Holidaymaker</h1>
  </div>
 
  <router-view/>
</template>

<script>
import image from "./img/holiday.png"

export default {
    data: function () {
    return {
      isUserLoggedIn: false,
            image: image
        }
    
    },

   

    methods: {

     logout () {
      // tell backend to forget us
      console.log('logout work')
      fetch('/logout', { mode: 'no-cors' })
      

      // remove logged in user from store
      this.$store.commit('setLoggedInUser', null)

      alert('You signed out')

       setTimeout(() => location.reload(), 50)
     }
    },

  async mounted () {
    let user = await fetch ('/auth/whoami')
    try {
      user = await user.json()
      this.$store.commit('setLoggedInUser', user)
      this.$store.commit('setLoggedInUserId', this.$store.state.loggedInUser.id)
      console.log(user);
    } catch {
      console.log('Not logged in')
    }
  },

  computed:{
    loggedInUser() {
      return this.$store.state.loggedInUser
    },
    isLoggedIn() {
      return this.loggedInUser != null
    }
  },
  
}
</script>
<style>

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: 'Roboto', sans-serif;
  color: #cbd5df;
   
 
}


body, html {
  padding: 0;
  margin: 0;
  width: 100%;
  min-height: 100%;
}
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
 
  
  background:rgb(38, 39, 63)
}
#SearchBar{
  padding: 2vh 2vw;
}
#test{
  display: flex;
  padding: 20px;
  align-content: center;
  justify-content: center;
  
}
#nav {
  padding: 15px;
  text-align: left;
}
#login {
  padding: 15px;
  text-align: right;
}#topBar {
 display: flex;
 justify-content: space-between;
 background: rgba(0, 0, 0, 0.253);
 
 
}
#icon{
  width: 7%;

}

#title{
    padding: 4vh 2vw;
    margin-right: 6%;
}
#nav a {
  font-weight: bold;
  color: #a4aab1;
}

#nav a.router-link-exact-active {
  color: #42b983;
}
</style>