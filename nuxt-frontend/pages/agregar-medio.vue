<template>
  <v-form>
    <v-col cols="auto" class="pa-4">
      <v-card>
        <v-card-title> Edicion</v-card-title>
        <v-card-text class="mx-4"
          ><v-row class="pa-4">
            <v-col cols="4">
              <v-text-field v-model="name" label="Nombre"></v-text-field>
            </v-col>
            <v-col cols="4">
              <v-select
                v-model="tipo"
                :items="items"
                item-text="nombre"
                item-value="id"
                label="Plataforma"
              ></v-select>
            </v-col>
            <v-col cols="4">
              <v-text-field v-model="imgroute" label="URL Imagen"></v-text-field>
            </v-col>
            <v-col cols="8">
              <v-textarea
                v-model="detalle"
                outlined
                name="input-7-4"
                label="Detalle"
                item-value="Escribe una pequeña reseña"
              ></v-textarea
            ></v-col>
            <v-col cols="4" align="center">
              <v-img
                class="pa-6 ma-2"
                :lazy-src="imgroute"
                max-height="500"
                max-width="350"
                aspect-ratio="0.56"
                :src="imgroute"
              ></v-img>
            </v-col> </v-row
          ><v-row class="mt-1 px-2">
            <v-col>
              <span class="font-weight-bold my-auto">Nota:</span
              ><v-rating
                v-model="rating"
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
          <v-btn color="primary" @click="createNewContent()"> Guardar </v-btn></v-card-actions
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
      listatipos: {},
      plataformas: [],
      items: [],
      imgroute: '',
      rating: 0,
      name: '',
      tipo: '',
      detalle: '',
    }
  },
  async mounted() {
    this.items = await this.getTipoName()
  },
  methods: {
    ...mapActions({
      getTipoName: 'getTipoName',
      postNewContenido: 'postNewContenido',
    }),
    async createNewContent() {
      const payload = {
        name: this.name,
        type: this.tipo,
        detail: this.detalle,
        imgroute: this.imgroute,
        rating: this.rating,
      }
      await this.postNewContenido(payload)
      this.$router.push('/')
    },
  },
}
</script>

<style scoped></style>
