const express = require('express')
const app = express()
const cors = require("cors");
const expressSanitizer = require("express-sanitizer")
const port = 3000

let corsOptions = {
    origin: "*",
    optionsSuccessStatus: 200
}

app.use(cors(corsOptions))
app.use(expressSanitizer())
app.use(express.json({limit: '3mb'}))
app.use(express.urlencoded({limit: '3mb', extended: true}))
// app.get('/', (req, res) => res.send('Hello World!'))

app.use('/api', require('./api/api'))

app.listen(port, () => console.log(`Server run on port ${port}`))
