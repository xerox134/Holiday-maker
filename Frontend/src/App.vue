<template>
   
  <div id="topBar">
    <div id="nav">
      <router-link to="/">Home</router-link> |
      <router-link to="/favorites">Favorites</router-link> 
      
      

    </div>
      

    <div id="login">
      <router-link to="/login" v-if="!isLoggedIn">Login</router-link>
      <router-link to="/" @click="logout" v-else>Log out (logged in as {{ loggedInUser.email }})</router-link>
    </div>

  </div>



  <router-link to="/"><div id="test">
    <img  id="icon" v-bind:src=image alt="" />
  <h1 id="title">Holidaymaker</h1>
  </div></router-link> 
  
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
      scrollToTop(){
        window.scrollTo(0,0)
      },

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
  text-decoration: none;
  
}

  ol li{
  list-style-type: none;
}

img{
  border-radius: 7px;
}

  button{
    border-radius: 7px;
    top: -2vh;
    left: 1px;
    border: none;
    outline: none;
    background-color: rgba(80, 75, 85, .3);
    color: rgba(230, 230, 255, .6);
    box-shadow: 2px 2px 1px rgba(0, 0, 0, .2), inset 2px 2px 2px rgba(255, 255, 255, .05);
    margin: 3px;
    margin-left: 1vw;
    padding-left: 20px;
    padding-right: 20px;
    padding-top: 5px;
    padding-bottom: 5px;
    height: min(5vh, 25vw);
    text-shadow: -1px -1px 2px rgba(0, 0, 0, .3), 1px 1px 2px rgba(126, 126, 126, .5);
  }

  button:hover{
    background-color: rgba(80, 75, 85, .8);
  }

  
  
  button:active{
    color: rgba(230, 230, 255, .8);
    border: none;
    background-color: rgba(80, 75, 85, .1);
    box-shadow: inset -2px -2px 2px rgba(220, 180, 255, .1), inset 2px 2px 2px rgba(0, 0, 0, .2);
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
    font-weight: bold;
    color: #a4aab1;
  }

  #topBar {
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