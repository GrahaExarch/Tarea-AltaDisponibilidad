<template>
  <v-card align="center" class="fill-height" width="300" height="800">
    <v-card-title class="headline"> {{ name }} </v-card-title>
    <footer align="left">
      <small>
        <v-col class="pa-1"
          ><em>&mdash; {{ type }}</em>
        </v-col>
      </small>
    </footer>
    <v-img
      class="pa-6"
      :lazy-src="imgroute"
      height="400"
      width="300"
      aspect-ratio="0.56"
      :src="imgroute"
    ></v-img>
    <v-card-text>
      <p class="overflow-auto" style="height: 160px">{{ description }}</p>
      <hr class="my-3" />
      <v-row class="mx-auto justify-center mt-1"
        ><span class="font-weight-bold my-auto">Nota:</span
        ><v-rating
          background-color="grey lighten-1"
          color="warning"
          empty-icon="mdi-star-outline"
          full-icon="mdi-star"
          half-icon="mdi-star-half-full"
          half-increments
          hover
          readonly
          length="5"
          size="24"
          :value="rating"
        ></v-rating
      ></v-row>
    </v-card-text>
    <v-card-actions>
      <v-btn class="mx-auto" color="primary" nuxt :to="`/detalle/${id}`"> Modificar </v-btn>
    </v-card-actions>
  </v-card>
</template>

<script>
export default {
  props: {
    type: {
      type: String,
      default: '',
    },
    name: {
      type: String,
      default: 'The Name',
    },
    description: {
      type: String,
      default: 'Some Random resume of the game',
    },
    rating: {
      type: Number,
      default: 0,
    },
    imgroute: {
      type: String,
      default: '',
    },
    id: {
      type: Number,
      default: 0,
    },
  },
}
</script>

<style scoped>
.bottom-button {
  position: absolute;
  bottom: 10px;
  left: 80px;
  left: 1;
}
</style>
