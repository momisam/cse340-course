import express from 'express';
import { fileURLToPath } from 'url';
import path from 'path';


//Define the application Environment
const NODE_ENV = process.env.NODE_ENV?.toLocaleLowerCase || 'production';

//Define the PORT number the server will listen On
const PORT = process.env.PORT || 3000;

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);




const app = express();


app.get('/', (req,res) => {
    res.send('Hello from Express');
});



app.listen(PORT, () => {
    console.log(`Server is running on a locallhost:${PORT}`);
    console.log(`Environment: ${NODE_ENV}`);
});


