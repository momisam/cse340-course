import express from 'express';

//Define the application Environment
const NODE_ENV = process.env.NODE_ENV?.toLocaleLowerCase || 'production';

//Define the PORT number the server will listen On
const PORT = process.env.PORT || 3000;




const app = express();


app.get('/', (req,res) => {
    res.send('Hello from Express');
});



app.listen(PORT, () => {
    console.log(`Server is running on a locallhost:${PORT}`);
    console.log(`Environment: ${NODE_ENV}`);
});

