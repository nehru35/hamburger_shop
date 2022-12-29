import axios from 'axios'

const _axios = axios.create({
   baseURL: "http://127.0.0.1:3045/"
})

export default _axios