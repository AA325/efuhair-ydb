/**
 * THIS FILE IS GENERATED AUTOMATICALLY.
 * DO NOT EDIT.
 *
 * You are probably looking on adding startup/initialization code.
 * Use "quasar new boot <name>" and add it there.
 * One boot file per concern. Then reference the file(s) in quasar.conf.js > boot:
 * boot: ['file', ...] // do not add ".js" extension to it.
 *
 * Boot files are your "main.js"
 **/

import 'quasar/dist/quasar.ie.polyfills.js'



import '@quasar/extras/material-icons/material-icons.css'



import '@quasar/extras/animate/fadeInUpBig.css'

import '@quasar/extras/animate/fadeOutUpBig.css'


// We load Quasar stylesheet file
import 'quasar/dist/quasar.sass'




import 'src/css/app.scss'


import Vue from 'vue'
import createApp from './app.js'




import qboot_Bootaxios from 'boot/axios'

import qboot_Bootvuelidate from 'boot/vuelidate'

import qboot_Bootcarbonui from 'boot/carbonui'

import qboot_Bootvuemask from 'boot/vue-mask'

import qboot_Booti18n from 'boot/i18n'

import qboot_Bootm from 'boot/m'

import qboot_Bootjquery from 'boot/jquery'

import qboot_Bootlodash from 'boot/lodash'

import qboot_Bootvuetyped from 'boot/vuetyped'







Vue.config.devtools = true
Vue.config.productionTip = false



console.info('[Quasar] Running SPA.')





const publicPath = `/app/`

const doubleSlashRE = /\/\//
const addPublicPath = url => (publicPath + url).replace(doubleSlashRE, '/')


async function start () {
  const { app, store, router } = await createApp()

  

  
  let hasRedirected = false
  const redirect = url => {
    hasRedirected = true
    const normalized = Object(url) === url
      ? addPublicPath(router.resolve(url).route.fullPath)
      : url

    window.location.href = normalized
  }

  const urlPath = window.location.href.replace(window.location.origin, '')
  const bootFiles = [qboot_Bootaxios,qboot_Bootvuelidate,qboot_Bootcarbonui,qboot_Bootvuemask,qboot_Booti18n,qboot_Bootm,qboot_Bootjquery,qboot_Bootlodash,qboot_Bootvuetyped]

  for (let i = 0; hasRedirected === false && i < bootFiles.length; i++) {
    if (typeof bootFiles[i] !== 'function') {
      continue
    }

    try {
      await bootFiles[i]({
        app,
        router,
        store,
        Vue,
        ssrContext: null,
        redirect,
        urlPath,
        publicPath
      })
    }
    catch (err) {
      if (err && err.url) {
        window.location.href = err.url
        return
      }

      console.error('[Quasar] boot error:', err)
      return
    }
  }

  if (hasRedirected === true) {
    return
  }
  

  

    

    

    
      new Vue(app)
    

    

    

  

}

start()
