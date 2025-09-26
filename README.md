# Alumee
The best place for students to connect with alumni

# Alumee: Alumni Engagement Platform 🎓

![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)

**Alumee** is a centralized, feature-rich platform designed to manage alumni data and foster meaningful engagement between students, alumni, faculty, and recruiters. Built with the power of **FlutterFlow** and **Supabase**, this app serves as a comprehensive solution for educational institutions.


*The main dashboard of the Alumee application.*

---

## 📝 Overview

Alumee addresses the challenge of disconnected alumni networks by providing a single, intuitive application for communication, mentorship, and opportunity sharing. The platform is designed with distinct user roles and permissions, ensuring a tailored and secure experience for everyone. From real-time chat and a student problem hub to a unique gamification system, Alumee is built to drive active participation and add lasting value to the alumni community.

---

## ✨ Key Features

### Core Platform Features
* **Role-Based Access:** A tailored experience for **Students, Alumni, Faculty, and Recruiters**, ensuring users only see relevant information and features.
* **Secure Onboarding:** A mandatory profile completion step ensures all user profiles are complete before they can access the app's main features.
* **Smart Profile Pages:** A dynamic profile page that shows an "Edit" button for your own profile and a "Send Message" button for others.
* **Searchable Directories:** Easily find and connect with students and alumni through dedicated, searchable directories.
* **Comprehensive Admin Panel:** A powerful dashboard for admins to approve new users and manage all platform content (events, opportunities, etc.) with an efficient two-tab (Manage/Add) design.

### Engagement Modules
* **Real-Time Chat:** A robust, one-on-one messaging system to facilitate direct communication. The app intelligently finds existing chats or creates new ones to prevent duplicates.
* **Student Problem Hub:** A dedicated space where students can post challenges they are facing, and alumni can provide detailed solutions.
* **Gamification & Incentives:** A unique system to reward alumni for their contributions. Alumni earn points for solved problems and completed mentorships, automatically unlocking achievement badges.
* **The Alumni Time Capsule:** A personal space where alumni can create and lock digital time capsules containing messages and media for their future selves.
* **AI Chatbot (Alumee Assistant):** An intelligent, app-aware assistant available throughout the application to answer questions and guide users.
* **Events & Opportunities:** Centralized boards for posting and discovering events, job openings, and internships.

---

## 🛠️ Tech Stack & Implementation

* **Frontend & UI Logic:** [**FlutterFlow**](https://flutterflow.io/) was used for rapid, visual development of the entire user interface and application logic.
* **Backend & Database:** [**Supabase**](https://supabase.io/) serves as the all-in-one backend.
    * **Database:** A PostgreSQL database stores all user data, content, and application state.
    * **Authentication:** Manages secure user sign-up, login, and session management.
    * **Realtime:** Powers the live chat and instant data updates across the app.
    * **Storage:** Handles uploads for profile pictures, background images, and problem/solution attachments.
    * **Edge Functions (RPC):** A serverless function (`check_and_award_badges`) is used to automate the gamification and badge awarding logic securely on the backend.

---

## ⚙️ User Flow Highlights

1.  **Seamless Onboarding:** A new user signs up and is automatically logged in. They are immediately directed to a "Complete Your Profile" screen. An `onboarding_complete` flag in the database ensures this step can't be skipped.
2.  **Admin Approval:** New user accounts are inactive until an admin reviews and approves them via a dedicated management page, setting the `is_approved` flag to `true`.
3.  **Smart Content Editing:** Admins use a unified form for both creating and editing content. When editing, the form is pre-filled with existing data, and conditional logic ensures the correct Supabase `Update` or `Create` action is performed.
4.  **Automated Gamification:**
    * A student marks an alumnus's solution as "Helpful."
    * The `problems_solved` counter for that alumnus is incremented.
    * This action triggers the `check_and_award_badges` Supabase function.
    * The function checks the user's new score against the `badges` table and inserts a record into the `user_badges` table if a new badge is earned.

---

## 📜 License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.

---

## 📧 Contact

Rohit Biradar / nullCommand – [@RohitBiradarLinkedIn](http://linkedin.com/in/rohit-biradar-862a1932b) – rohitop492@gmail.com

Project Link: ([https://github.com/your_username/your_repository](https://github.com/rohit-biradar/Alumee/tree/main))
```
