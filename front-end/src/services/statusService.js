import axios from '@/httpResquest';

class statusService {

    listarStatus() {
        return axios.get("statusPedido");
    }

}

export default new statusService();