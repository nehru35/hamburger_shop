<template>
    <div>
        <Message :msg="msg" v-show="msg"/>

        <div>
            <form id="burger-form" @submit="createBurger">
                <div class="input-container">
                    <label for="nome">Nome do cliente: </label>
                    <input type="text" name="nome" id="nome" v-model="nome" placeholder="Digite seu nome">
                </div>

                <div class="input-container">
                    <label for="pao">Escolha o pão: </label>
                    <select name="pao" id="pao" v-model="pao">
                        <option value="">Selecione o seu pão</option>
                        <option v-for="pao in paes" :key="pao.id" :value="pao.descricao">
                            {{ pao.descricao }}
                        </option>
                    </select>
                </div>

                <div class="input-container">
                    <label for="carne">Escolha a carne: </label>
                    <select name="carne" id="carne" v-model="carne">   
                        <option value="">Selecione o tipo de carne</option>
                        <option v-for="carne in carnes" :key="carne.id" :value="carne.descricao">
                            {{ carne.descricao }}
                        </option>
                    </select>
                </div>

                <div id="opcionais-container" class="input-container">
                    <label id="opcionais-title" for="opicionais">Selecione os opcionais: </label>
                    <div class="checkbox-container" v-for="opcional in opcionaisdata" :key="opcional.id">
                        <input type="checkbox" name="opcionais" v-model="opcionais" :value="opcional.descricao">
                        <span> {{ opcional.descricao}}</span>
                    </div>
                </div>

                <div class="input-container">
                    <input type="submit" class="submit-btn" value="Criar meu burger!">
                </div>
            </form>
        </div>
    </div>
</template>

<script>
    import Message from './message.vue';
    import pedidosService from '@/services/pedidosService';
    import paesService from '@/services/paesService';
    import carneService from '@/services/carneService';
    import opcionaisService from '@/services/opcionaisService';

    export default {
        name: 'BurgerForm',
        data() {
            return {
                paes: null,
                carnes: null,
                opcionaisdata: null,
                nome: null,
                pao: null,
                carne: null,
                opcionais: [],
                msg: null
            }
        },

        components: {
            Message
        },
        
        mounted() {
            this.getListaPaes();
            this.getListaCarnes();
            this.getOpcionais();
        },

        methods: {
            // TRAZENDO OS PAES
            async getListaPaes() {
                try {
                    this.paes = await paesService.listarPaes().then((res) => res.data);
                } catch (error) {
                    console.log(error);
                }
            },

            // TRAZENDO AS CARNES
            async getListaCarnes() {
                try {
                    this.carnes = await carneService.listarCarnes().then((res) => res.data);
                } catch (error) {
                    console.log(error);
                }
            },

            // TRAZENDO OS OPCIONAIS
            async getOpcionais() {
                try {
                    this.opcionaisdata = await opcionaisService.listarOpcionais().then((res) => res.data);
                } catch (error) {
                    console.log(error);
                }
            },

            // INSERIR DADOS
            async createBurger(e) {
                e.preventDefault()

                const data = {
                    nome_cliente: this.nome,
                    carne: this.carne,
                    pao: this.pao,
                    opcionais: Array.from(this.opcionais),
                    status: "Solicitado"
                }

                try {
                    await pedidosService.novoPedido(data).then((res) => {
                        if(res.status === 200 && res.data.affectedRows >= 1) {

                            // colocar uma mensagem no sitema
                            this.msg = `Pedido realizado com sucesso!`;
    
                            // Limpar mensagem
                            setTimeout(() => this.msg = "", 3000)
                        }
                    })
                } catch (error) {
                    console.log(error);                    
                } finally {
                    // Limpar os campos
                    this.nome = "";
                    this.carne = "";
                    this.pao = "",
                    this.opcionais = [];
                }
            }
        }
    }
</script>

<style scoped>

    #burger-form {
        max-width: 400px;
        margin: 0 auto;
    }

    .input-container {
        display: flex;
        flex-direction: column;
        margin-bottom: 20px;
    }

    label {
        font-weight: bold;
        margin-bottom: 15px;
        color: #222;
        padding: 5px 10px;
        border-left: 4px solid #FCBA03;
    }

    input, select {
        padding: 5px 10px;
        width: 300px;
    }

    #opcionais-container {
        flex-direction: row;
        flex-wrap: wrap;
    }

    #opicionais-title {
        width: 100%;
    }

    .checkbox-container {
        display: flex;
        align-items: flex-start;
        width: 50%;
        margin-bottom: 20px;
    }

    .checkbox-container span,
    .checkbox-container input {
        width: auto;
    }

    .checkbox-container span {
        margin-left: 6px;
        font-weight: bold;
    }

    .submit-btn {
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

    .submit-btn:hover {
        background-color: transparent;
        color: #222;
    }
</style>