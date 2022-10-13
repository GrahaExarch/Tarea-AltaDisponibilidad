<template>
  <v-form>
    {{ data }}
    <v-col cols="auto" class="pa-4">
      <v-card>
        <v-card-title> Edicion</v-card-title>
        <v-card-text class="mx-4"
          ><v-row class="pa-4">
            <v-col cols="4">
              <v-text-field v-model="name" label="Nombre"></v-text-field>
            </v-col>
            <v-col cols="4">
              <v-select :items="items" label="Plataforma"></v-select>
            </v-col>
            <v-col cols="4">
              <v-text-field label="URL Imagen"></v-text-field>
            </v-col>
            <v-col cols="8">
              <v-textarea
                outlined
                name="input-7-4"
                label="Detalle"
                value="Escribe una pequeña reseña"
              ></v-textarea
            ></v-col>
            <v-col cols="4" align="center">
              <v-img
                class="pa-6"
                :lazy-src="imgroute"
                max-height="960"
                max-width="320"
                :src="imgroute"
              ></v-img>
            </v-col> </v-row
          ><v-row class="mt-1 px-2">
            <v-col>
              <span class="font-weight-bold my-auto">Nota:</span
              ><v-rating
                background-color="grey lighten-1"
                color="warning"
                empty-icon="mdi-star-outline"
                full-icon="mdi-star"
                half-icon="mdi-star-half-full"
                half-increments
                hover
                length="5"
                size="32"
                :value="rating"
              ></v-rating> </v-col></v-row
        ></v-card-text>
        <v-card-actions
          ><v-spacer />
          <v-btn color="primary" nuxt to="/detalle-review"> Guardar </v-btn></v-card-actions
        >
      </v-card>
    </v-col>
  </v-form>
</template>

<script>
import { mapActions } from 'vuex'
export default {
  data() {
    return {
      data: {},
      listaReviews: null,
      items: [],
      imgroute: '',
      rating: 0,
      name: '',
    }
  },
  async mounted() {
    console.log(this.$route.params)
    const payload = {
      id: this.$route.params.id,
    }
    this.data = await this.getRating(payload)
    this.name = this.data.nombre
    this.imgroute = this.data.urlimagen
  },
  methods: {
    ...mapActions({
      getRating: 'getRating',
    }),
    imprimir(texto) {
      return texto
    },
  },
}
</script>

<style scoped></style>
