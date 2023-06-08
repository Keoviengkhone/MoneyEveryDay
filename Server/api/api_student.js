const express = require("express");
const router = express.Router();
const db = require("../db");

router.get("/student", function (req, res) {
  let sql = "SELECT * FROM tbl_student";
  db.query(sql, function (err, rs) {
    res.json({ data: rs });
  });
});
router.get("/student/:id", function (req, res) {
  const id = req.sanitize(req.params.id);
  let sql = "SELECT * FROM tbl_student WHERE ID = ?";
  db.query(sql,[id], function (err, rs) {
    res.json(rs[0]);
  });
});

router.post("/student/add", function (req, res) {
  const STUDENT_NO = req.sanitize(req.body.STUDENT_NO);
  const FULL_NAME = req.sanitize(req.body.FULL_NAME);
  const DATE_OF_BIRTH = req.sanitize(req.body.DATE_OF_BIRTH);
  const NIC_NAME = req.sanitize(req.body.NIC_NAME);
  const ADDRESS = req.sanitize(req.body.ADDRESS);
  const CLASS_ROOM_NO = req.sanitize(req.body.CLASS_ROOM_NO);
  const LEVEL_NAME = req.sanitize(req.body.LEVEL_NAME);

  let sql =
    "INSERT INTO `tbl_student`(`STUDENT_NO`, `FULL_NAME`, `DATE_OF_BIRTH`, `NIC_NAME`, `ADDRESS`, `CLASS_ROOM_NO`, `LEVEL_NAME`) VALUES ?";
  let data = [
    [
      STUDENT_NO,
      FULL_NAME,
      DATE_OF_BIRTH,
      NIC_NAME,
      ADDRESS,
      CLASS_ROOM_NO,
      LEVEL_NAME,
    ],
  ];

  db.query(sql, [data], function (err, rs) {
    if (err) throw err;
    res.json({
      status: "ok",
      message: "Add Money Payout Success!!",
      data: data,
    });
  });
});

router.delete("/student/delete", function(req, res){
    const id = req.sanitize(req.body.id)
    let sql = "DELETE FROM `tbl_student` WHERE ID = ?"
    db.query(sql, [id], function(err, rs){
        if (err) throw err
        res.json({status: "ok", message: "Deleted Student ID: "+id})
    })
})


router.put("/student/update", function(req,res){
    const id = req.sanitize(req.body.ID)
    const fname = req.sanitize(req.body.FULL_NAME)
    const dob = req.sanitize(req.body.DATE_OF_BIRTH)
    const nic = req.sanitize(req.body.NIC_NAME)
    const address = req.sanitize(req.body.ADDRESS)
    const clsr_no = req.sanitize(req.body.CLASS_ROOM_NO)
    const level = req.sanitize(req.body.LEVEL_NAME)

    let sql = "UPDATE `tbl_student` SET ? WHERE ID = ?"
    let values = {
        FULL_NAME: fname,
        DATE_OF_BIRTH: dob,
        NIC_NAME: nic,
        ADDRESS: address,
        CLASS_ROOM_NO: clsr_no,
        LEVEL_NAME: level
    }
    db.query(sql, [values, id], function(err, rs){
        if(err) throw err
        res.json({status: "OK", message: "Updated ID : "+id, data: values})
    })
})

module.exports = router;
