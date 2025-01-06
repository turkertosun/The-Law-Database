import React from 'react';
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';
import Main from './components/main/main'; 
import MainAdmin from './components/mainAdmin/mainAdmin';
import LoginPage from './components/loginPages/loginPage'; 

function App() {
  return (
    <Router>
      <Routes>
        <Route path="/" element={<LoginPage />} />
        <Route path="/main" element={<Main />} />
        <Route path="/mainAdmin" element={<MainAdmin />} />
      </Routes>
    </Router>
  );
}

export default App;
