import React, { useContext } from 'react'
import { AuthContext } from '../../context/AuthContext'
import { useNavigate } from 'react-router-dom';

const Navbar = () => {
    const { logout, user } = useContext(AuthContext);
    const navigate = useNavigate();
    // console.log(user);
    const handleLogout = () => {
        logout();
        navigate('/login');
    }
    const handleLogin = () => navigate('/login');
    const handleSignup = () => navigate('/signup');
    const handleCart = () => navigate('/cart');
    const handleOrders = () => navigate('/orders');
    const handleProfile = () => navigate('/user');
    const handleUsers = () => navigate('/users');
    const handleAdmins = () => navigate('/admins');
    const handleHome = () => navigate('/');
    return (
        <nav className='w-full shadow bg-white sticky top-0 z-50'>
            <div className="bg-gradient-to-r from-purple-600 to-pink-600 h-1 " />
            <div className="flex flex-col md:flex-row items-center justify-between px-4 py-3">
                <div className="flex items-center gap-3 mb-2 sm:mb-0">
                    <span onClick={handleHome} className='text-3xl text-transparent font-extrabold bg-clip-text bg-gradient-to-r from-purple-700 to-pink-500 cursor-pointer tracking-tight select-none'>
                        <span className='align-middle'>🛒</span>E-Shop
                    </span>
                </div>
                {user ? (
                    user.role === 'USER' ? (
                        <div className='flex gap-4 flex-wrap items-center select-none'>
                            <span onClick={handleProfile} className='hidden sm:flex items-center px-3 py-1 bg-gradient-to-r from-purple-100 to-pink-100 text-purple-700 rounded-full font-semibold text-sm shadow mr-2 hover:cursor-pointer'>
                                <svg className='w-5 h-5 mr-1 text-purple-400' fill='none' stroke='currentColor'><circle cx="12" cy="7" r="4" /><path d="M5.5 21a7.5 7.5 0 0 1 13 0" /></svg>
                                {user.name}
                            </span>
                            {/* <button onClick={handleHome} className='px-4 py-2 font-semibold rounded-lg text-purple-700 hover:bg-purple-50 hover:text-purple-900 hover:cursor-pointer transition'>Home</button> */}
                            <button onClick={handleCart} className='px-4 py-2 font-semibold rounded-lg text-purple-700 hover:bg-purple-50 hover:text-purple-900 hover:cursor-pointer transition'>Cart</button>
                            <button onClick={handleOrders} className='px-4 py-2 font-semibold rounded-lg text-purple-700 hover:bg-purple-50 hover:text-purple-900 hover:cursor-pointer transition'>Orders</button>
                            <button onClick={handleProfile} className='sm:hidden px-4 py-2 font-semibold rounded-lg text-purple-700 hover:bg-purple-50 hover:text-purple-900 hover:cursor-pointer transition'>Profile</button>
                            <button onClick={handleLogout} className='px-4 py-2 font-semibold rounded-lg bg-gradient-to-r from-red-500 to-pink-500 text-white hover:from-red-400 hover:to-pink-400 transition shadow hover:cursor-pointer'>Logout</button>
                        </div>
                    ) : user.role==='ADMIN' && (
                        <div className='flex gap-4 flex-wrap items-center select-none'>
                            <span onClick={handleProfile} className='hidden sm:flex items-center px-3 py-1 bg-gradient-to-r from-purple-100 to-pink-100 text-purple-700 rounded-full font-semibold text-sm shadow mr-2 hover:cursor-pointer'>
                                <svg className='w-5 h-5 mr-1 text-purple-400' fill='none' stroke='currentColor'><circle cx="12" cy="7" r="4" /><path d="M5.5 21a7.5 7.5 0 0 1 13 0" /></svg>
                                {user.name}
                            </span>
                            {/* <button onClick={handleHome} className='px-4 py-2 font-semibold rounded-lg text-purple-700 hover:bg-purple-50 hover:text-purple-900 hover:cursor-pointer transition'>Home</button> */}
                            <button onClick={handleUsers} className='px-4 py-2 font-semibold rounded-lg text-purple-700 hover:bg-purple-50 hover:text-purple-900 hover:cursor-pointer transition'>Users</button>
                            <button onClick={handleAdmins} className='px-4 py-2 font-semibold rounded-lg text-purple-700 hover:bg-purple-50 hover:text-purple-900 hover:cursor-pointer transition'>Admins</button>
                            <button onClick={handleCart} className='px-4 py-2 font-semibold rounded-lg text-purple-700 hover:bg-purple-50 hover:text-purple-900 hover:cursor-pointer transition'>Carts</button>
                            <button onClick={handleOrders} className='px-4 py-2 font-semibold rounded-lg text-purple-700 hover:bg-purple-50 hover:text-purple-900 hover:cursor-pointer transition'>Orders</button>
                            <button onClick={handleProfile} className='sm:hidden px-4 py-2 font-semibold rounded-lg text-purple-700 hover:bg-purple-50 hover:text-purple-900 hover:cursor-pointer transition'>Profile</button>
                            <button onClick={handleLogout} className='px-4 py-2 font-semibold rounded-lg bg-gradient-to-r from-red-500 to-pink-500 text-white hover:from-red-400 hover:to-pink-400 transition shadow hover:cursor-pointer'>Logout</button>
                        </div>
                    )
                ) : (
                    <div className='flex gap-2 md:gap-4 text-white font-semibold'>
                        <button onClick={handleSignup} className='px-3 py-2 bg-purple-600 rounded-md hover:bg-purple-700 hover:cursor-pointer transition shadow'>Register</button>
                        <button onClick={handleLogin} className='px-3 py-2 bg-pink-500 rounded-md hover:bg-pink-600 hover:cursor-pointer transition shadow'>Login</button>
                    </div>
                )}
            </div>
        </nav>
    )
}

export default Navbar
