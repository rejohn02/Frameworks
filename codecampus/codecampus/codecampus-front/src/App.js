import { BrowserRouter as Router, Routes, Route, Outlet } from 'react-router-dom';
import Home from './components/Home';
import Login from './components/Login';

function App() {
  return (
    <Router>
      <Routes>
        <Route path='/' element={<Login/>} />
        <Route path='/Home' element={<Home/>} />
        <Route path='*' element={<Outlet />} />
      </Routes>
    </Router>
  );
}

export default App;
