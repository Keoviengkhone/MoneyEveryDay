<template>
    <div>
        <v-card class="mb-3 rounded-lg ">
            <template v-slot:title>
                <v-layout column>
                    <v-icon class="mr-2" color="light-blue-darken-1">mdi-chevron-right-circle-outline</v-icon>
                    <p>ແກ້ໄຂຂໍ້ມູນນັກຮຽນ</p>
                </v-layout>
            </template>
        </v-card>
    </div>
    <div>
        <v-card class="pa-5">
            <v-form @submit.prevent="onSubmit">
                <v-row>
                    <v-col cols="12" sm="6" md="4">
                        <v-text-field v-model="id" label="id" readonly />
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
                        <v-text-field v-model="address" label="ທີ່ຢູ້"></v-text-field>
                    </v-col>
                    <v-col cols="12" sm="6" md="4">
                        <v-text-field v-model="clsr_no" label="ຫ້ອງຮຽນ"></v-text-field>
                    </v-col>
                    <v-col cols="12" sm="6" md="4">
                        <v-text-field v-model="level" label="ຊັ້ນຮຽນ"></v-text-field>
                    </v-col>
                    



                </v-row>

                <v-btn type="submit" color="light-blue-darken-1">ແກ້ໄຂ</v-btn>
            </v-form>
            <pre>{{ dob }}</pre>
            <pre>{{ date }}</pre>
            <pre>{{ formatted }}</pre>
        </v-card>
    </div>
</template>

<script setup>
import { ref } from 'vue';
import { useRoute } from 'vue-router';
import { useDate } from 'vuetify/labs/date'
import router from '@/router';

const route = useRoute()
const id = ref(route.params.ID)
const fname = ref('')
const dob = ref('1998-12-28')
const nic = ref('')
const address = ref('')
const clsr_no = ref('')
const level = ref('')
const date = ref('')
const dates = useDate()

const formatted = dates.format('2010-04-13 00:00:00', 'fullDateWithWeekday')

// const row = ref([])
const fetchdata = () => {
    fetch("http://localhost:3000/api/student/" + id.value)
        .then(res => res.json())
        .then((result) => {
            // row.value = result
            fname.value = result.FULL_NAME
            date.value = result.DATE_OF_BIRTH
            nic.value = result.NIC_NAME
            address.value = result.ADDRESS
            clsr_no.value = result.CLASS_ROOM_NO
            level.value = result.LEVEL_NAME
        })
}
fetchdata()

const onSubmit = () => {
    var myHeaders = new Headers();
myHeaders.append("Content-Type", "application/json");

var raw = JSON.stringify({
  "FULL_NAME": fname.value,
  "DATE_OF_BIRTH": dob.value,
  "NIC_NAME": nic.value,
  "ADDRESS": address.value,
  "CLASS_ROOM_NO": clsr_no.value,
  "LEVEL_NAME": level.value,
  "ID": id.value
});

var requestOptions = {
  method: 'PUT',
  headers: myHeaders,
  body: raw,
  redirect: 'follow'
};

fetch("http://localhost:3000/api/student/update", requestOptions)
  .then(response => response.json())
  .then((result) => {
    alert(result.message)
  })
  .catch(error => console.log('error', error));
  router.push('/')
}

</script>