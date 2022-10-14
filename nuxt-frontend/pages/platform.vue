<template>
  <v-form>
    <v-col cols="auto" class="pa-4">
      <v-card>
        <v-card-title> Nueva Plataforma/Consola</v-card-title>
        <v-card-text class="mx-4"
          ><v-row class="pa-4">
            <v-col cols="4">
              <v-text-field v-model="name" label="Nombre Plataforma"></v-text-field>
            </v-col>
            <v-btn color="primary" @click="createNewTipo()"
              ><span><v-icon>mdi-plus</v-icon> Agregar </span>
            </v-btn>
          </v-row>
        </v-card-text>
      </v-card>
    </v-col>
  </v-form>
</template>

<script>
import { mapActions } from 'vuex'
export default {
  name: 'PlatformPage',
  data() {
    return {
      name: '',
    }
  },
  async mounted() {},
  methods: {
    ...mapActions({
      postNewTipo: 'postNewTipo',
      getTipoName: 'getTipoName',
    }),
    createNewTipo() {
      const payload = {
        name: this.name,
      }
      this.postNewTipo(payload)
    },
  },
}
</script>
