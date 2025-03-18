const express = require('express');
const mysql = require('mysql');
const multer = require('multer');
const nodemailer = require('nodemailer');
const path = require('path'); // Add this line to use path module
const app = express();
const port = 3000;

// Middleware for parsing JSON and form data
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Serve static files from the 'public' directory
app.use(express.static(path.join(__dirname, 'public')));

// MySQL database connection
const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'a@beche',  // your database name
});

db.connect((err) => {
    if (err) {
        console.error('Database connection error:', err);
        process.exit(1);
    }
    console.log('Connected to the database.');
});

// Setup Multer for file uploads (resume upload)
const upload = multer({ dest: './uploads/' });
// user registration 
app.post('/register', (req, res) => {
    const { name, email, password } = req.body;

    if (!name || !email || !password) {
        return res.status(400).json({ message: 'All fields are required' });
    }

    const query = 'INSERT INTO users (username, email, password) VALUES (?, ?, ?)';
    db.query(query, [name, email, password], (err, results) => {
        if (err) {
            console.error('Error inserting data:', err);
            return res.status(500).json({ message: 'Registration failed!' });
        }

        // Send success response if registration is successful
        res.status(200).json({ message: 'Registration successful!' });
    });
});



app.get('/users', (req, res) => {
    const query = 'SELECT * FROM users';
    db.query(query, (err, results) => {
        if (err) {
            console.error('Error fetching users:', err);
            return res.status(500).json({ message: 'Failed to fetch users.' });
        }
        res.status(200).json(results);
    });
});


// Approve user (update status)
app.patch('/admin/users/:userId/approve', (req, res) => {
    const { userId } = req.params;
    const query = 'UPDATE users SET status = "active" WHERE user_id = ?';
    db.query(query, [userId], (err, results) => {
        if (err) {
            res.status(500).send('Error approving user');
            return;
        }
        res.json({ message: 'User approved successfully' });
    });
});


// DELETE route to delete a user by user_id
app.delete('/admin/users/:userId', (req, res) => {
    const userId = req.params.userId; // Get userId from the URL parameter

    // SQL query to delete the user with the specified user_id
    const query = 'DELETE FROM users WHERE id = ?';

    db.query(query, [userId], (err, results) => {
        if (err) {
            console.error('Error deleting user:', err);
            return res.status(500).json({ message: 'Error deleting user' });
        }

        // Check if any rows were affected (i.e., the user exists)
        if (results.affectedRows > 0) {
            return res.json({ message: 'User deleted successfully' });
        } else {
            return res.status(404).json({ message: 'User not found' });
        }
    });
});
// Login route
app.post('/login', (req, res) => {
    const { email, password } = req.body;

    // Check if email and password fields are provided
    if (!email || !password) {
        return res.status(400).json({ message: 'Email and password are required' });
    }

    // Corrected table name to 'users'
    const query = 'SELECT * FROM users WHERE email = ?';
    db.query(query, [email], (err, results) => {
        if (err) {
            console.error('Database error:', err);
            return res.status(500).json({ message: 'Database error' });
        }

        if (results.length > 0) {
            const user = results[0];

            // Check if the user is the special admin with the given email and password
            if (user.email === 'poper173@gmail.com' && user.password === 'password' && user.id === 4) {
                // Redirect to admin page for admin user
                return res.json({ redirect: '/admin.html' });
            }

            // Check if the user is the special employer with the given email and password
            if (user.email === 'popermwasile173@gmail.com' && user.password === 'password' && user.id === 2) {
                // Redirect to job postings page for employer
                return res.json({ redirect: '/jobposting.html' });
            }

            // If the user is a job seeker, redirect to the vacancies page
            return res.json({ redirect: '/vacancies.html' });

        } else {
            return res.json({ message: 'Invalid email or password' });
        }
    });
});

// 2. Job Management APIs

// Post a new job
app.post('/post-job', (req, res) => {
    const { postName, postNumber, employer, applicationStart, applicationEnd, duties, qualifications, salary, Location } = req.body;
    const query = `
        INSERT INTO job_postings (post_name, post_number, employer, application_start, application_end, duties, qualifications, salary_range, Location)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
    `;
    db.query(query, [postName, postNumber, employer, applicationStart, applicationEnd, duties, qualifications, salary, Location], (err) => {
        if (err) {
            console.error('Error posting job:', err);
            return res.status(500).json({ message: 'Failed to post job.' });
        }
        res.status(200).json({ message: 'Job posted successfully!' });
    });
});

// Get all job listings
app.get('/jobs', (req, res) => {
    const query = 'SELECT * FROM job_postings';
    db.query(query, (err, results) => {
        if (err) {
            console.error('Error fetching jobs:', err);
            return res.status(500).json({ message: 'Failed to fetch jobs.' });
        }
        res.status(200).json(results);
    });
});

// Get job details by ID
app.get('/jobs/:id', (req, res) => {
    const { id } = req.params;
    const query = 'SELECT * FROM job_postings WHERE id = ?';
    db.query(query, [id], (err, results) => {
        if (err) {
            console.error('Error fetching job details:', err);
            return res.status(500).json({ message: 'Failed to fetch job details.' });
        }
        if (results.length === 0) {
            return res.status(404).json({ message: 'Job not found.' });
        }
        res.status(200).json(results[0]);
    });
});

// 3. Application Submission APIs

// Apply for a job
app.post('/apply', upload.single('resume'), (req, res) => {
    const { fullName, email, phone, position, education, experience, skills } = req.body;
    const resumePath = req.file.path;

    // Insert application data into database
    const query = `
        INSERT INTO applications (fullName, email, phone, position, education, experience, skills, resume)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?)
    `;
    db.query(query, [fullName, email, phone, position, education, experience, skills, resumePath], (err) => {
        if (err) {
            console.error('Error submitting application:', err);
            return res.status(500).json({ message: 'Application submission failed.' });
        }

        // Send email notification
        const transporter = nodemailer.createTransport({
            service: 'gmail',
            auth: {
                user: 'popermwasile173@gmail.com',
                pass: 'opec bpoe arrj aojm',
            },
        });

        const mailOptions = {
            from: 'popermwasile173@gmail.com',
            to: email,
            subject: `Application Received for ${position}`,
            text: `Dear ${fullName},\n\nYour application for the ${position} position has been successfully submitted. We will contact you soon.\n\nBest regards,\nJob Portal Team`,
        };

        transporter.sendMail(mailOptions, (error) => {
            if (error) {
                console.log(error);
                res.status(500).send('Application submitted, but email notification failed.');
            } else {
                res.send('Application submitted successfully! Check your email for confirmation.');
            }
        });
    });
});

// 4. Admin & User Dashboard APIs

// Get all job applications (Admin)
app.get('/admin/applications', (req, res) => {
    const query = 'SELECT * FROM applications';
    db.query(query, (err, results) => {
        if (err) {
            console.error('Error fetching applications:', err);
            return res.status(500).json({ message: 'Failed to fetch applications.' });
        }
        res.status(200).json(results);
    });
});

// Delete an application (Admin)
app.delete('/admin/applications/:id', (req, res) => {
    const { id } = req.params;
    const query = 'DELETE FROM applications WHERE application_id = ?';
    db.query(query, [id], (err) => {
        if (err) {
            console.error('Error deleting application:', err);
            return res.status(500).json({ message: 'Failed to delete application.' });
        }
        res.status(200).json({ message: 'Application deleted successfully.' });
    });
});

// 5. Notification API

// Send notification (Admin)
app.post('/notifications/send', (req, res) => {
    const { userId, message } = req.body;
    const query = 'INSERT INTO notifications (user_id, message) VALUES (?, ?)';
    db.query(query, [userId, message], (err) => {
        if (err) {
            console.error('Error sending notification:', err);
            return res.status(500).json({ message: 'Failed to send notification.' });
        }
        res.status(200).json({ message: 'Notification sent successfully.' });
    });
});

// 6. User Profile Update

// Update user profile
app.put('/users/:id', (req, res) => {
    const { id } = req.params;
    const { username, email, bio } = req.body;

    const query = 'UPDATE users SET username = ?, email = ?, bio = ? WHERE id = ?';
    db.query(query, [username, email, bio, id], (err) => {
        if (err) {
            console.error('Error updating profile:', err);
            return res.status(500).json({ message: 'Profile update failed.' });
        }
        res.status(200).json({ message: 'Profile updated successfully.' });
    });
});

 // send feedback
app.post('/feedback', (req, res) => {
    const { name, email, subject,message } = req.body;

    if (!name || !email || !subject||!message) {
        return res.status(400).json({ message: 'All fields are required' });
    }

    const query = 'INSERT INTO users (username, email, subject,message) VALUES (?, ?, ?)';
    db.query(query, [name, email, subject,message,user_id], (err) => {

        if (err)throw err;
        res.redirect("/index.html");

        if (err) {
            console.error('Error inserting data:', err);
           // return res.status(500).json({ message: '' });
            res.status(200).json({ message: 'feedback submission  failed!' });
        }
    });
});
// 7. Serve index.html
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'public', 'index.html')); // Use path to serve the HTML file
});

// Start the server
app.listen(port, () => {
    console.log(`Server running on http://localhost:${port}`);
});
