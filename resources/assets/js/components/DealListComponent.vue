<template>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <span v-show="load">Loading...</span>
                <table class="table">
                    <thead>
                    <tr>
                        <td>id</td>
                        <td>Название</td>
                        <td>Дата создания</td>
                        <td>Есть контакт</td>
                        <td>Действия</td>
                    </tr>
                    </thead>
                    <tbody>
                    <tr v-for="lead in leads">
                        <td>{{lead.id}}</td>
                        <td>{{lead.name}}</td>
                        <td>{{lead.created_at}}</td>
                        <td> {{getParamAcaunt(lead.main_contact['id'])}}</td>
                        <td><button class="btn btn-info"  :disabled=isDisabled(lead.main_contact['id'])>Привязать контакт</button></td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        data:function(){
            return{
                leads:[],
                load:false,
                terms:false
            }
        },
        mounted() {
            this.auth();
            this.getData();
        },
        methods: {
            auth: function () {
                this.load = true;
                axios.get('/auth').then((response) => {
                    // console.log(response)
                }).then((response) => {
                        this.load = false
                    }
                );
            },
            getData: function () {
                this.load = true;
                axios.get('/leads')
                    .then((response) => {
                        this.leads = response.data;
                        this.load = false;
                    });
            },
            getParamAcaunt: function (id) {
                if (id) {
                    return 'ДА';
                } else {
                    return 'Нет';
                }
            },
            isDisabled: function (id) {
                return !id ? false : true;
            }
        }
    }
</script>
