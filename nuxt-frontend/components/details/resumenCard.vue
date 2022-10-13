<template>
  <div>
    <v-col cols="auto" class="pa-4">
      <v-card align="center">
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
          max-height="960"
          max-width="320"
          :src="imgroute"
        ></v-img>
        <v-card-text>
          <p>{{ description }}</p>
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
          <v-spacer />
          <v-btn color="primary" nuxt to="/detalle/5"> Modificar </v-btn>
        </v-card-actions>
      </v-card>
    </v-col>
  </div>
</template>

<script>
export default {
  props: {
    type: {
      type: String,
      default: 'TBD',
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
  },
}
</script>
