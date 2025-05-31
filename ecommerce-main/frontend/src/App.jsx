import reactLogo from './assets/react.svg'
import viteLogo from '/vite.svg'
import './App.css'
import SignupPage from './pages/SignupPage'
import LoginPage from './pages/LoginPage'
import { Route, Router, Routes } from 'react-router-dom'
import PublicLayout from './layouts/PublicLayout'
import PrivateLayout from './layouts/PrivateLayout'
import ProductList from './components/Product/ProductList'
import ProductDetail from './components/Product/ProductDetail'
import Cart from './components/Cart/Cart'
import Profile from './components/Profile/Profile'
import Order from './components/Order/Order'
import { useContext } from 'react'
import { AuthContext } from './context/AuthContext'
import ProductEdit from './components/Product/ProductEdit'
import CartAdmin from './components/Cart/CartAdmin'
import OrderAdmin from './components/Order/OrderAdmin'
import ProfileUsers from './components/Profile/ProfileUsers'
import ProfileAdmins from './components/Profile/ProfileAdmins'

function App() {

  const { role } = useContext(AuthContext);
  return (

    <Routes>
      {/* Public Layout */}
      <Route element={<PublicLayout />}>
        <Route path="/signup" element={<SignupPage />} />
        <Route path="/login" element={<LoginPage />} />
      </Route>
      {
        role === 'USER' && (
          //  User Private Layout 
          <Route element={<PrivateLayout />}>
            <Route path='/' element={<ProductList />} />
            <Route path='/:productId' element={<ProductDetail />} />
            <Route path='/cart' element={<Cart />} />
            <Route path='/orders' element={<Order />} />
            <Route path='/user' element={<Profile />} />
          </Route>)
      }
      {
        role === 'ADMIN' && (
          <Route element={<PrivateLayout />}>
            <Route path='/' element={<ProductList />} />
            <Route path='/user' element={<Profile />} />
            <Route path='/users' element={<ProfileUsers />} />
            <Route path='/admins' element={<ProfileAdmins />} />
            <Route path='/cart' element={<CartAdmin />} />
            <Route path='/orders' element={<OrderAdmin />} />
            <Route path='/product' element={<ProductEdit />} />
            <Route path='/product/:productId' element={<ProductEdit />} />
          </Route>
        )
      }

    </Routes>

  )
}

export default App
