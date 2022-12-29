import axios from '@/httpResquest';

class carneService {

    listarCarnes() {
        return axios.get("listaCarnes");
    }

}

export default new carneService();