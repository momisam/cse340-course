import express from 'express';
import { fileURLToPath } from 'url';
import path from 'path';
import { title } from 'process';


//Define the application Environment
const NODE_ENV = process.env.NODE_ENV?.toLocaleLowerCase || 'production';

//Define the PORT number the server will listen On
const PORT = process.env.PORT || 3000;

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const app = express();

/**
  * Configure Express middleware
  */

// Serve static files from the public directory
app.use(express.static(path.join(__dirname, 'public')));

// Set EJS as the templating engine
app.set('view engine', 'ejs');

// Tell Express where to find your templates
app.set('views', path.join(__dirname, 'src/views'));


/**
  * Routes
  */

app.get('/', async (req,res) => {
    const title = 'Home';
    res.render('home', { title });
});

app.get('/organizations', async (req, res) => {
    const title = 'Organizations';
    res.render('organizations', { title });
});

app.get('/projects', async (req, res) => {
    const title = 'Projects';
    res.render('projects', { title });
});


app.listen(PORT, () => {
    console.log(`Server is running on a locallhost:${PORT}`);
    console.log(`Environment: ${NODE_ENV}`);
});