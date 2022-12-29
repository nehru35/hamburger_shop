import axios from '@/httpResquest';

class paesService {

    listarPaes() {
        return axios.get("listaPaes");
    }

}

export default new paesService();