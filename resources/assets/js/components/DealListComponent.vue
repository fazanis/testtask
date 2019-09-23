<template>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <table class="table">
                    <thead>
                    <tr>
                        <td>id</td>
                        <td>Название</td>
                        <td>Название</td>
                        <td>Дата создания</td>
                        <td>Есть контакт</td>
                        <td>Действия</td>
                    </tr>
                    </thead>
                </table>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        mounted() {
            this.auth();
        },
        methods:{
            auth:function(){
                axios.post('https://webmaster88.amocrm.ru/private/api/auth.php',{
                    USER_LOGIN:'web.master.88@mail.ru',USER_HASH:'980a4c02110cd65468011229eaea3f94dbb0c716'
                }).then((response)=>{
                    console.log(response.data)
                });
            },
            getData: function() {
                axios.get('https://example.amocrm.ru/api/v2/leads?with=is_price_modified_by_robot,loss_reason_name')
                    .then((response)=>{
                       console.log(response)
                    });
            }
        }
    }
</script>
