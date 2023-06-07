const express = require("express");
const router = express.Router();

const StudentAPI = require("./api_student")

router.use(StudentAPI)

module.exports = router;