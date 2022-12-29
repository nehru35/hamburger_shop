import axios from '@/httpResquest';

class pedidosService {
    
    novoPedido(params) {
        return axios.post("novoPedido", params);
    }

    listarPedidos() {
        return axios.get("listarPedidos");
    }

    deletarPedido(params) {
        return axios.post("eliminarPedido", params);
    }

    actualizarPedido(params) {
        return axios.post("actualizarPedidos", params);
    }

}

export default new pedidosService();