import Vue from 'vue'
import Vuex from 'vuex'

// import example from './module-example'
import app from './module-app'
import list from './module-list'

Vue.use(Vuex)

/*
 * If not building with SSR mode, you can
 * directly export the Store instantiation;
 *
 * The function below can be async too; either use
 * async/await or return a Promise which resolves
 * with the Store instance.
 */

export default new Vuex.Store({
  modules: {
    // example
    app,
    list
  },

  // enable strict mode (adds overhead!)
  // for dev mode only
  strict: false
})
