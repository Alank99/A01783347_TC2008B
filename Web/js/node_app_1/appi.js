"use strict"

import express from 'express'
import fs from 'fs'

const app = express()
const port = 5000

app.use(express.json())
app.use(express.static('./public'))

app.get('/', (req, res)=>
{
    fs.readFile('./public/html/index.html', 'utf8', 
    (err, html) => {
        if(err)
        {
            res.status(500).send('There was an error: ' + err)
            return 
        }
        
        console.log("Sending page...")
        res.send(html)
        console.log("Page sent!")
    })
})

app.get('/api/hello', (req, res)=>
{
    console.log(req.query)
    if(req.query.hasOwnProperty('name') && req.query.hasOwnProperty('surname'))
        res.send(`Hello ${req.query.name} ${req.query.surname}`)
    else
        res.send('Hello!')
})

app.get('/api/greeting/:name/:surname', (req, res)=>{
    console.log(req.params)
    if(req.params.hasOwnProperty('name') && req.params.hasOwnProperty('surname'))
        res.send(`Hello ${req.params.name} ${req.params.surname}`)
    else
        res.send('Hello!')
})

app.get('/api/json_test', (req, res)=>{
    res.json(
        {
            name: "Copilot", surname: "Hernandez"
        })
})

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})

const response_json = await fetch('/api/json_test')