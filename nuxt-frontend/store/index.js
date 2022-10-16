import api from '@/services/api.js'

function initialState() {
    return {
    }}

const state = () => initialState()

const actions = {
    
    async getRating({commit},params){
        try{
            const response = await api(this.$axios).getRating(params)
            if (response.status){
                return response.contenido
            }
            return false
        } catch (error){
            return false
        }
        },
    async getContents({commit},params){
        try{
            const response = await api(this.$axios).getContents()
            if (response.status){
                return response.contenido
            }
            return false
        } catch (error){
            return false
        }
    },
    async getTipoName({commit},params){
        try{
            const response = await api(this.$axios).getTipoName()
            if (response.status){
                return response.contenido
            }
            return false
        } catch(error){
            return false
        }
    },
    async postNewTipo({commit},params){
        try{
            const request = await api(this.$axios).postNewTipo(params)
            if (request.status){
                return request
            }
        }catch(error){
            return false
        }
    },
    async postNewContenido({commit},params){
        try{
            const request = await api(this.$axios).postNewContenido(params)
            if (request.status){
                return request
            }
        }catch(error){
            return false
        }
    },
    async deleteContenido({commit},params){
        try{
            const request = await api(this.$axios).deleteContenido(params)
            if (request.status){
                return request
            }
        }catch(error){
            return false
        }
    },
    async updateContenido({commit},params){
        try{
            const request = await api(this.$axios).updateContenido(params)
            if (request.status){
                return request
            }
        }catch(error){
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