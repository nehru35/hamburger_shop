<template>
    <div id="burger-table">
        <Message :msg="msg" v-show="msg"/>
        <div>
            <div id="burger-table-heading">
                <div class="order-id">#:</div>
                <div>Cliente</div>
                <div>Pão</div>
                <div>Carne</div>
                <div>Opcionais</div>
                <div>Ações</div>
            </div>
        </div>
        <div id="burger-table-rows">
            <div class="burger-table-row" v-for="burger in burgers" :key="burger.id">
                <div class="order-number"> {{ burger.id }}</div>
                <div> {{ burger.nomo_cliente }}</div>
                <div> {{ burger.pao }}</div>
                <div> {{ burger.carne }}</div>
                <div>
                    <ul>
                        <li v-for="(opcional, index) in burger.opcionais" :key="index">
                            {{ opcional }}
                        </li>
                    </ul>
                </div>

                <div class="acoes-container">
                    <select name="status" id="status" @change="updateBurger($event, burger)">
                        <option v-for="s in status" :key="s.id" :value="s.descricao" :selected="burger.status == s.descricao">
                            {{ s.descricao }}
                        </option>
                    </select>
                    <button class="delete-btn" @click="deleteBurger(burger.id)">Cancelar</button>
                </div>
            </div>
        </div>
    </div>
</template>

<script>

    import Message from './message.vue';
    import pedidosService from '@/services/pedidosService';
    import statusService from '@/services/statusService';

    export default {
        name: "Dashoboard",
        data() {
            return {
                burgers: null,
                burger_id: null,
                status: [],
                msg: null
            }
        },
        components: {
            Message
        },

        mounted() {
            this.getPedidos();
        },

        methods: {
            async getPedidos() {
                try {
                    let pedidos = await pedidosService.listarPedidos().then((res) => res.data);

                    for(let c = 0; c < pedidos.length; c++) {
                        pedidos[c].opcionais = JSON.parse(pedidos[c].opcionais)
                    }

                    this.burgers = pedidos;

                    // regatar os status
                    this.getStatus()
                    
                } catch (error) {
                    console.log(error);
                }               
            },
            
            async getStatus() {
                this.status = await statusService.listarStatus().then((res) => res.data);
            },

            //DELETE
            async deleteBurger(id) {
                try {
                    await pedidosService.deletarPedido({id: id}).then((res) => {
                        if (res.status === 200 && res.data.affectedRows >= 1) {
                            // colocar uma mensagem no sitema
                            this.msg = `Pedido removido com sucesso!`;
    
                            // Limpar mensagem
                            setTimeout(() => this.msg = "", 3000)
    
                            this.getPedidos()
                        }
                    });
                } catch (error) {
                    console.log(error);
                }
            },

            //ATUALIZAR
            async updateBurger(event, pedido) {
                let option = event.target.value;
                let params = {
                    status: option,
                    id: pedido.id
                }

                try {
                    await pedidosService.actualizarPedido(params).then((res) => {
                        if(res.status === 200 && res.data.affectedRows >= 1) {
                            // colocar uma mensagem no sitema
                            this.msg = `O pedido foi atualizado para ${option}!`;

                            // Limpar mensagem
                            setTimeout(() => this.msg = "", 2000);

                            this.getPedidos();
                        }
                    });
                } catch (error) {
                    console.log(error);
                }                
             }
        }
    }
</script>

<style scoped>

    #burger-table {
        max-width: 1200px;
        margin: 0 auto;
    }

    #burger-table-heading,
    #burger-table-rows,
    .burger-table-row {
        display: flex;
        flex-wrap: wrap;
    }

    #burger-table-heading {
        font-weight: bold;
        padding: 12px;
        border-bottom: 3px solid #333;
    }

    #burger-table-heading div,
    .burger-table-row div {
        width: 17%;
    }

    .burger-table-row {
        width: 100%;
        padding: 12px;
        border-bottom: 1px solid #ccc;
    }

    #burger-table-heading .order-id,
    .burger-table-row .order-number {
        width: 5%;
    }

    select {
        padding: 8px 4px;
        margin-right: 10px;
    }

    .delete-btn {
        background-color: #222;
        color: #FCBA03;
        font-weight: bold;
        border: 2px solid #222;
        padding: 10px;
        font-size: 16px;
        margin: 0 auto;
        cursor: pointer;
        transition: .5s;
    }

    .delete-btn:hover {
        background-color: transparent;
        color: #222;
    }

    div.acoes-container {
        width: 24%;
    }

    

</style>