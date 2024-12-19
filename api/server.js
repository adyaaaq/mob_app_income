const express = require('express');
const mysql = require('mysql2'); // Import mysql2 for database connection
const cors = require('cors');
const app = express();
const port = 3000;

// Use CORS for handling cross-origin requests
app.use(cors());
app.use(express.json());

// Create MySQL connection
const db = mysql.createConnection({
    host: 'localhost', // MySQL host
    user: 'root', // Your MySQL username
    password: 'root', // Your MySQL password
    database: 'orlogozarlaga', // The name of the database you're using
});

// Connect to the database
db.connect((err) => {
    if (err) {
        console.error('Error connecting to MySQL: ' + err.stack);
        return;
    }
    console.log('Connected to MySQL as id ' + db.threadId);
});

// Endpoint to get a user by ID
app.get('/user/:id', (req, res) => {
    const userId = req.params.id;

    // Query the database to get the user by ID
    const query = 'SELECT * FROM users WHERE id = ?';
    db.execute(query, [userId], (err, results) => {
        if (err) {
            console.error('Error fetching user:', err);
            return res.status(500).send('Error fetching user');
        }

        if (results.length > 0) {
            res.json(results[0]); // Return the user data as JSON
        } else {
            res.status(404).send('User not found');
        }
    });
});
// Implement Login API
app.post('/login', (req, res) => {
    const { email, password } = req.body; // Get email and password from request body

    // Validate request
    if (!email || !password) {
        return res
            .status(400)
            .json({ message: 'Email and password are required' });
    }

    const query = 'SELECT * FROM users WHERE email = ?';
    db.execute(query, [email], (err, results) => {
        if (err) {
            console.error('Error checking email:', err);
            return res.status(500).json({ message: 'Error checking email' });
        }

        if (results.length === 0) {
            return res.status(404).json({ message: 'User not found' }); // User not found
        }

        const user = results[0];

        if (password === user.password) {
            // Exclude the password from the returned user data
            const { password, ...userData } = user;

            return res.status(200).json({
                message: 'Login successful',
                success: true,
                user: userData, // Return user data excluding the password
            });
        } else {
            return res
                .status(401)
                .json({ message: 'Invalid credentials', success: false });
        }
    });
});

// Endpoint to get all transactions by userId
app.get('/transactions/:userId', (req, res) => {
    const userId = req.params.userId;

    const query = 'SELECT * FROM transactions WHERE userId = ?';
    db.execute(query, [userId], (err, results) => {
        if (err) {
            console.error('Error fetching transactions:', err);
            return res
                .status(500)
                .json({ message: 'Error fetching transactions' });
        }

        if (results.length > 0) {
            res.json(results);
        } else {
            res.status(404).json({
                message: 'No transactions found for this user',
            });
        }
    });
});

// Endpoint to update transaction's isdone field by transaction ID
app.put('/transactions/:id', (req, res) => {
    const transactionId = req.params.id;

    const query =
        'UPDATE transactions SET isdone = 1 WHERE id = ? AND isdone = 0';

    db.execute(query, [transactionId], (err, result) => {
        if (err) {
            console.error('Error updating transaction:', err);
            return res
                .status(500)
                .json({ message: 'Error updating transaction' });
        }

        if (result.affectedRows > 0) {
            res.status(200).json({
                message: 'Transaction updated successfully',
                success: true,
            });
        } else {
            res.status(404).json({
                message: 'Transaction not found or already updated',
                success: false,
            });
        }
    });
});

// Start the server
app.listen(port, () => {
    console.log(`Server running at http://localhost:${port}`);
});
