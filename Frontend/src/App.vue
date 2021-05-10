<template>
  <div id="nav">
    <router-link to="/">Home</router-link> |
    <router-link to="/about">About</router-link> |
    <router-link to="/favorites">Favorites</router-link> |
    <router-link to="/login" v-if="!isLoggedIn">Login</router-link>
    <router-link to="/" @click="logout" v-else>Log out (logged in as {{ loggedInUser.email }})</router-link>
    <h1 id="title">Holidaymaker</h1>
  </div>
  <router-view/>
</template>

<script>

export default {
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
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  background: linear-gradient(rgba(0, 0, 255, 0.473),orange);
}

#nav {
  padding: 30px;
}

#nav a {
  font-weight: bold;
  color: #2c3e50;
}

#nav a.router-link-exact-active {
  color: #42b983;
}
</style>