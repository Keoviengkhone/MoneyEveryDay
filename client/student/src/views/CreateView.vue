<template>
    <div>
        <v-card class="mb-3 rounded-lg ">
            <template v-slot:title>
                <v-layout column>
                    <v-icon class="mr-2" color="light-blue-darken-1">mdi-chevron-right-circle-outline</v-icon>
                    <p>ເພີ່ມຂໍ້ມູນນັກຮຽນ</p>
                </v-layout>
            </template>
        </v-card>
    </div>
    <div>
        <v-card class="pa-5">
            <v-form @submit.prevent="onSubmit">
                <v-row>
                    <v-col cols="12" sm="6" md="4">
                        <v-text-field v-model="STUDENT_NO" label="ລະຫັດນັກຮຽນ" />
                    </v-col>
                    <v-col cols="12" sm="6" md="4">
                        <v-text-field v-model="fname" label="ຊື່ ແລະ ນາມສະກຸນ" />
                    </v-col>
                    <v-col cols="12" sm="6" md="4">
                        <v-text-field type="date" label="ວັນເດືອນປີເກີດ" v-model="dob"></v-text-field>
                    </v-col>
                    <v-col cols="12" sm="6" md="4">
                        <v-text-field v-model="nic" label="ຊື່ຫຼີ້ນ"></v-text-field>
                    </v-col>
                    <v-col cols="12" sm="6" md="4">
                        <v-text-field v-model="address" label="ທີ່ຢູ່"></v-text-field>
                    </v-col>
                    <v-col cols="12" sm="6" md="4">
                        <v-text-field v-model="clsr_no" label="ຫ້ອງຮຽນ"></v-text-field>
                    </v-col>
                    <v-col cols="12" sm="6" md="4">
                        <v-text-field v-model="level" label="ຊັ້ນຮຽນ"></v-text-field>
                    </v-col>
                </v-row>
                <v-btn type="submit" color="light-blue-darken-1">ເພີ່ມນັກຮຽນ</v-btn>
            </v-form>
            <pre>{{ dob }}</pre>
            <pre>{{ std_no }}</pre>
        </v-card>
    </div>
</template>

<script setup>
import { ref } from 'vue';
import router from '@/router';
// import { useRoute } from 'vue-router';

// const route = useRoute()
const STUDENT_NO = ref('123')
const fname = ref('tes')
const dob = ref('2012-10-12')
const nic = ref('tes')
const address = ref('tes')
const clsr_no = ref('tes')
const level = ref('tes')

const onSubmit = () => {

    var myHeaders = new Headers();
myHeaders.append("Content-Type", "application/json");

var raw = JSON.stringify({
  "STUDENT_NO": STUDENT_NO.value,
  "FULL_NAME": fname.value,
  "DATE_OF_BIRTH": dob.value,
  "NIC_NAME": nic.value,
  "ADDRESS": address.value,
  "CLASS_ROOM_NO": clsr_no.value,
  "LEVEL_NAME": level.value
});

var requestOptions = {
  method: 'POST',
  headers: myHeaders,
  body: raw,
  redirect: 'follow'
};

fetch("http://localhost:3000/api/student/add", requestOptions)
  .then(response => response.json())
  .then((result) => {
    alert(result.message)
  })
  .catch(error => console.log('error', error));
  router.push('/')
}


</script>