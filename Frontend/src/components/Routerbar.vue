<template>
  <div id="Routes">
    <div id="nav">
      <router-link to="/"> Hem </router-link>
      <router-link to="/favorites" v-if="isAuthenticated">
        | Favoriter
      </router-link>
      <router-link to="/bookings" v-if="isAuthenticated">
        | Mina bokningar
      </router-link>
      <router-link to="/cart" v-if="isAuthenticated">| Varukorg </router-link>
    </div>

    <h1>HOLIDAY MAKER</h1>

    <div id="login">
      <router-link to="/login" v-if="!isLoggedIn">Logga in</router-link>
      <router-link to="/" @click="logout" v-else
        >Logga ut (Inloggad som {{ loggedInUser.email }})</router-link
      >
    </div>
  </div>

  <router-view />
</template>

<script>
export default {
  data: function () {
    return {
      isUserLoggedIn: false,
    };
  },

  methods: {
    scrollToTop() {
      window.scrollTo(0, 0);
    },

    logout() {
      // tell backend to forget us
      console.log("logout work");
      fetch("/logout", { mode: "no-cors" });

      // remove logged in user from store
      this.$store.commit("setLoggedInUser", null);

      alert("You signed out");

      setTimeout(() => location.reload(), 50);
    },
  },

  async mounted() {
    let user = await fetch("/auth/whoami");
    try {
      user = await user.json();
      this.$store.commit("setLoggedInUser", user);
      this.$store.commit(
        "setLoggedInUserId",
        this.$store.state.loggedInUser.id
      );
      console.log(user);
     
    } catch {
      console.log("Not logged in");
    }
  },

  computed: {
    loggedInUser() {
      return this.$store.state.loggedInUser;
    },
    isLoggedIn() {
      return this.loggedInUser != null;
    },
    isAuthenticated() {
      return this.$store.getters.getCurrentUser;
    },
  },
};
</script>
<style>
ol li {
  list-style-type: none;
}

img {
  border-radius: 7px;
}

button {
  border-radius: 7px;
  top: -2vh;
  left: 1px;
  border: none;
  outline: none;
  background-color: rgba(80, 75, 85, 0.3);
  color: rgba(230, 230, 255, 0.6);
  box-shadow: 2px 2px 1px rgba(0, 0, 0, 0.2),
    inset 2px 2px 2px rgba(255, 255, 255, 0.05);
  margin: 3px;
  margin-left: 1vw;
  padding-left: 20px;
  padding-right: 20px;
  padding-top: 5px;
  padding-bottom: 5px;
  height: min(5vh, 25vw);
  text-shadow: -1px -1px 2px rgba(0, 0, 0, 0.3),
    1px 1px 2px rgba(126, 126, 126, 0.5);
}

button:hover {
  background-color: rgba(80, 75, 85, 0.8);
}

button:active {
  color: rgba(230, 230, 255, 0.8);
  border: none;
  background-color: rgba(80, 75, 85, 0.1);
  box-shadow: inset -2px -2px 2px rgba(220, 180, 255, 0.1),
    inset 2px 2px 2px rgba(0, 0, 0, 0.2);
}

body,
html {
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
  background: rgb(38, 39, 63);
}

#SearchBar {
  padding: 2vh 2vw;
}

#test {
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

#Routes {
  display: flex;
  justify-content: space-between;
  background: rgba(0, 0, 0, 0.253);
}

#icon {
  width: 7%;
}

#title {
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