<template>
  <v-app dark>
    <v-card flat tile>
      <v-toolbar dense>
        <v-toolbar-title>
          <router-link to="/" tag="span" style="cursor: pointer">
            {{ title }}
          </router-link>
        </v-toolbar-title>
        <v-spacer />
        <v-row class="d-block">
          <v-toolbar-items>
            <v-spacer />
            <v-col v-for="item in menuItems" :key="item.title" cols="auto">
              <v-btn :to="item.path"> {{ item.title }} </v-btn>
            </v-col>
          </v-toolbar-items>
        </v-row>
      </v-toolbar>
    </v-card>
    <v-main>
      <v-container style="width: 100%"><Nuxt /></v-container>
    </v-main>
    <v-navigation-drawer v-model="rightDrawer" :right="right" temporary fixed>
      <v-list>
        <v-list-item @click.native="right = !right">
          <v-list-item-action>
            <v-icon light> mdi-repeat </v-icon>
          </v-list-item-action>
          <v-list-item-title>Switch drawer (click me)</v-list-item-title>
        </v-list-item>
      </v-list>
    </v-navigation-drawer>
    <v-footer :absolute="!fixed" app>
      <span>&copy; {{ new Date().getFullYear() }}</span>
    </v-footer>
  </v-app>
</template>

<script>
export default {
  name: 'DefaultLayout',
  data() {
    return {
      clipped: false,
      drawer: false,
      fixed: false,
      items: [],
      menuItems: [{ title: 'Nueva Plataforma', path: '/platform' }],
      miniVariant: false,
      right: true,
      rightDrawer: false,
      title: 'Reviews de Todito',
    }
  },
}
</script>
