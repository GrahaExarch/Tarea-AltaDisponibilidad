<template>
  <v-form>
    <v-col cols="auto" class="pa-4">
      <v-card>
        <v-card-title>Edicion</v-card-title>
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
                item-value="detalle"
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
          <v-btn color="error" @click="deleteModal = true">Eliminar</v-btn>
          <v-btn color="primary" @click="actualizarContenido()"> Actualizar </v-btn></v-card-actions
        >
      </v-card>
    </v-col>
    <v-dialog v-model="deleteModal" width="370">
      <v-card>
        <v-card-title class="text-h5 text-center">
          ¿Estás seguro que quiere borrar {{ name }}?
        </v-card-title>

        <v-card-text> Está acción no podrá ser revertida. </v-card-text>

        <v-divider></v-divider>

        <v-card-actions>
          <v-col>
            <v-row>
              <v-btn color="primary" block @click="eliminarContenido()"> Confirmar </v-btn>
            </v-row>
            <v-row>
              <v-btn color="primary" text block @click="deleteModal = false"> Cerrar </v-btn>
            </v-row>
          </v-col>
        </v-card-actions>
      </v-card>
    </v-dialog>
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
      deleteModal: false,
    }
  },
  async mounted() {
    const payload = {
      id: this.$route.params.id,
    }
    this.data = await this.getRating(payload)
    this.items = await this.getTipoName()
    this.name = this.data.nombre
    this.imgroute = this.data.urlimagen
    this.detalle = this.data.detalle
    this.rating = this.data.rating
    this.tipo = this.data.idtipo
  },
  methods: {
    ...mapActions({
      getRating: 'getRating',
      getTipoName: 'getTipoName',
      updateContenido: 'updateContenido',
      deleteContenido: 'deleteContenido',
    }),
    async actualizarContenido() {
      const payloadupdate = {
        id: this.$route.params.id,
        name: this.name,
        type: this.tipo,
        detail: this.detalle,
        imgroute: this.imgroute,
        rating: this.rating,
      }
      await this.updateContenido(payloadupdate)
      this.$router.push('/')
    },
    async eliminarContenido() {
      const payloaddelete = {
        data: { id: this.$route.params.id },
      }
      await this.deleteContenido(payloaddelete)
      this.$router.push('/')
    },
  },
}
</script>

<style scoped></style>
