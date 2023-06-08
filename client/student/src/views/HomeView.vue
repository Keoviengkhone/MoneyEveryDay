<template>
  <div>
    <v-card class="mb-3 rounded-lg ">
      <template v-slot:title>
        <v-layout column>
          <v-icon class="mr-2" color="light-blue-darken-1">mdi-chevron-right-circle-outline</v-icon>
          <p>ລາຍຊື່ນັກຮຽນທັງໝົດ</p>
          <v-spacer></v-spacer>
          <v-btn color="light-blue-darken-1" @click="$router.push('/create')">
            <v-icon class="mr-2">mdi-newspaper-plus</v-icon> ເພີ່ມນັກຮຽນໃໝ່</v-btn>
        </v-layout>
      </template>
    </v-card>
  </div>
  <div>
    <v-card class="rounded-lg pa-5">
      <div class="d-flex mb-5">
        <v-text-field :loading="loading" density="compact" variant="solo" label="Search Student"
          append-inner-icon="mdi-magnify" single-line hide-details @click:append-inner="onClick">
        </v-text-field>
        <v-spacer></v-spacer>
        <v-spacer></v-spacer>
        <v-spacer></v-spacer>
        <v-spacer></v-spacer>
        <v-spacer></v-spacer>
      </div>
      <v-table fixed-header>
        <thead>
          <tr>
            <th class="text-left">
              ລຳດັບ
            </th>
            <th class="text-left">
              ຊື່ ແລະ ນາມສະກຸນ
            </th>
            <th class="text-left">
              ວັນເດືອນປີເກີດ
            </th>
            <th class="text-left">
              ຊື່ຫຼີ້ນ
            </th>
            <th class="text-left">
              ທີ່ຢູ່
            </th>
            <th class="text-left">
              ຫ້ອງຮຽນ
            </th>
            <th class="text-left">
              ຊັ້ນຮຽນ
            </th>
            <th class="text-center">
              ດຳເນີນການ
            </th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="item in row.data" :key="item.ID">
            <td>{{ item.STUDENT_NO }}</td>
            <td>{{ item.FULL_NAME }}</td>
            <td>{{ item.DATE_OF_BIRTH }}</td>
            <td>{{ item.NIC_NAME }}</td>
            <td>{{ item.ADDRESS }}</td>
            <td>{{ item.CLASS_ROOM_NO }}</td>
            <td>{{ item.LEVEL_NAME }}</td>
            <td>
              <v-btn variant="text" icon=" mdi-square-edit-outline" @click="onEdit(item.ID)"></v-btn>
              <v-btn variant="text" icon="mdi-trash-can-outline" @click="onDelete(item.ID)"></v-btn>
            </td>
          </tr>
        </tbody>
      </v-table>
    </v-card>
  </div>
</template>

<script setup>
import { ref } from 'vue';
import router from '@/router';

const row = ref([])
const fetchdata = () => {
  fetch("http://localhost:3000/api/student")
    .then(res => res.json())
    .then((result) => {
      row.value = result
    })
}
fetchdata()



const onEdit = (ID) => {
  // alert(ID + "edit")
  router.push('/update/' + ID)

}
const onDelete = (ID) => {
  var myHeaders = new Headers();
  myHeaders.append("Content-Type", "application/json");

  var raw = JSON.stringify({
    "id": ID
  });

  var requestOptions = {
    method: 'DELETE',
    headers: myHeaders,
    body: raw,
    redirect: 'follow'
  };

  fetch("http://localhost:3000/api/student/delete",
    requestOptions)
    .then(response => response.json())
    .then(result => {
      alert(result.message),
        fetchdata()
    })
    .catch(error => console.log('error', error));

}
</script>