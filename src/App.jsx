// src/App.jsx
import React from 'react';
import './App.css';
import { Amplify } from 'aws-amplify';
import awsconfig from './aws-exports'; 
import { MantineProvider } from '@mantine/core';
import { BrowserRouter as Router, Routes, Route, Navigate } from 'react-router-dom';
import Login from './components/login/Login.jsx';
import ResetPasswordPage from './components/login/ResetPassword.jsx'
import SignUp from './components/signUp/SignUp.jsx';
import VerificationResult from './components/verify/Verify.jsx';
import { Toaster } from "sonner";


Amplify.configure(awsconfig);


function App() {
  return (
    <MantineProvider >
     <Toaster richColors position="top-right" /> 
	<Router>
        <Routes>
          <Route path="/" element={<Navigate to="/login" />} />
          <Route path="/login" element={<Login />} />
          <Route path="/signup" element={<SignUp />} />
	<Route path="/verify" element={<VerificationResult />} />
	  <Route path="/reset-password" element={<ResetPasswordPage />} />
        </Routes>
      </Router>

    </MantineProvider>
  );
}

export default App;
