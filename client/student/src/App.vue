<template>
  <v-app>
    <v-app-bar app color="light-blue-darken-1" dark>
      <div @click="$router.push('/')" class="d-flex align-center">
        <v-img src="./assets/logo.png" width="40" class="shrink ml-2 mr-2" contain transition="scale-transition" />
        <p class="">STUDENT APP</p>
      </div>
    </v-app-bar>
    <v-navigation-drawer permanent class="bg-white" width="200">
      <v-list nav>
        <v-list-item @click="$router.push('/')" prepend-icon="mdi-home" title="Dashboard" value="Home" class="bg-blue-lighten-5"></v-list-item>
        <!-- <v-list-item prepend-icon="mdi-account-supervisor-circle" title="Supervisors" value="supervisors"></v-list-item>
          <v-list-item prepend-icon="mdi-clock-start" title="Clock-in" value="clockin"></v-list-item> -->
      </v-list>
    </v-navigation-drawer>
    <v-main class="bg-grey-lighten-2">
      <v-container fluid>
        <router-view />
      </v-container>
    </v-main>
  </v-app>
</template>
<style>
body {
  font-family: 'Noto Sans Lao';
}
</style>

<script>

export default {
  name: 'App',

  data: () => ({
    //
  }),
}
</script>
