<template>
  <el-menu
    :default-active="activeIndex"
    class="el-menu-demo"
    mode="horizontal"
    background-color="#545c64"
    text-color="#fff"
    active-text-color="#ffd04b"
    router
  >
    <el-menu-item index="/">Clients</el-menu-item>
    <router-view></router-view>
  </el-menu>
</template>

<script>

  export default {
    name: 'App',
    data() {
      return {
        activeIndex: "/"
      }
    },
    watch: {
      $route(to) {
        this.activeIndex = to.path;
      }
    },
    mounted: function () {
      this.activeIndex = this.$route.path;
    },
  }
</script>

<style>
  #app {
    font-family: 'Avenir', Helvetica, Arial, sans-serif;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    text-align: center;
    color: #2c3e50;
    margin-top: 60px;
  }
</style>
