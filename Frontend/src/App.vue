<template>

<div id="bar">
  <div id="nav">
    <router-link to="/">Home</router-link> |
    <router-link to="/about">About</router-link> |
    <router-link to="/favorites">Favorites</router-link> 
  </div>

<div id="login">
  <router-link to="/login" id="login">Login</router-link>
</div>

</div>


  <h1 id="title">Holidaymaker</h1>
  <router-view/>
</template>

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

#nav {
  padding: 15px;
  text-align: left;
}
#login {
  padding: 15px;
  text-align: right;
}#bar {
 display: flex;
 justify-content: space-between;
 background: rgba(0, 0, 0, 0.253);
 
}

#nav a {
  font-weight: bold;
  color: #a4aab1;
}

#nav a.router-link-exact-active {
  color: #42b983;
}
</style>
