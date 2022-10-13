import api from '@/services/api.js'

function initialState() {
    return {}}

const state = () => initialState()

const actions = {
    
    async getRating({commit},params){
        try{
            const response = await api(this.$axios).getRating(params)
            console.log(response)
            if (response.status){
                return response.contenido
            }
            return false
        } catch (error){
            return false
        }
        }
}

const mutations= {}

const getters = {}

export default {
  actions,
  getters,
  mutations,
  state,
}