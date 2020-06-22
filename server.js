const express = require('express');
const Url = require('./models/Url');
const connectDB= require('./config/db');

const app= express();
connectDB();

app.use(express.static((__dirname,"assets")));
// app.use(express.static((__dirname,"views")));

app.set('view engine', 'ejs');
app.use(express.urlencoded({
extended:false
}));


app.use('/', require('./routes/index'));
app.use('/shorten', require('./routes/url'));

const PORT = 8080;
app.listen(PORT, ()=> console.log(`Server running on port ${PORT}`));