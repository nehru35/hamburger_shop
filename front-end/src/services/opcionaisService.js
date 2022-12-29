import axios from '@/httpResquest';

class opcionaisService {

    listarOpcionais() {
        return axios.get("listaOpcionais");
    }

}

export default new opcionaisService();