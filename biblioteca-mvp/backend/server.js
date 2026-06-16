const express = require('express')
const cors = require('cors')
const db = require('./conexao')

const app = express()

app.use(cors())
app.use(express.json())

app.get('/livros',(req,res)=>{

db.query(
'SELECT * FROM livro',
(err,result)=>{

if(err){
return res.send(err)
}

res.send(result)

})

})

app.post('/livros',(req,res)=>{

const {titulo,isbn,ano} = req.body

const sql=
'INSERT INTO livro(titulo,isbn,ano,status) VALUES(?,?,?,?)'

db.query(
sql,
[titulo,isbn,ano,'Disponível']
)

res.send('Livro cadastrado')

})

app.post('/contato',(req,res)=>{

const {nome,email,mensagem}=req.body

const sql=
'INSERT INTO contato(nome,email,mensagem) VALUES(?,?,?)'

db.query(
sql,
[nome,email,mensagem]
)

res.send('Mensagem enviada')

})

app.listen(3000,()=>{
console.log('Servidor rodando')
})