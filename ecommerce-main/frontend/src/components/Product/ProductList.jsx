import React, { useContext, useEffect, useState } from 'react'
import { useDeleteReq, useGetReq, usePostReq } from '../../hooks/useHttp'
import { AuthContext } from '../../context/AuthContext';
import { useNavigate } from 'react-router-dom';
import Loader from '../Loader/Loader';

const ProductList = () => {

    const navigate = useNavigate();
    const { role, user, token } = useContext(AuthContext);
    const [loading, setLoading] = useState(true);
    const [products, setProducts] = useState();

    const fetchAllProducts = async () => {
        try {
            const data = await useGetReq('api/products', null);
            setProducts(data);
            return data;
        } catch (e) {
            throw new Error(e.message);
        } finally {
            setLoading(false);
        }
    }

    useEffect(() => {
        fetchAllProducts();
    }, [loading])

    const handleClickUser = (productId) => {
        navigate(`/${productId}`);
    }
    const handleClickAdmin = (productId) => {
        navigate(`/product/${productId}`);
    }

    const handleAddCart = async (product) => {
        try {
            setLoading(true);
            const cartItems = await useGetReq(`api/cart/view/${user.userId}`, token);
            const productInCart = cartItems?.items?.find(item => item.productId === product.productId);
            const existingQuantity = productInCart ? productInCart.quantity : 0;
            await usePostReq(`api/cart/add`, {
                user: {
                    id: user.userId
                },
                product: {
                    productId: product.productId
                },
                quantity: existingQuantity + 1,
            }, token);
            navigate('/cart')
        } finally {
            setLoading(false);
        }
    }
    const handleEditProduct = (product) => {
        navigate(`/product/${product.productId}`);
    }
    const handleDeleteProduct = async (product) => {
        await useDeleteReq(`api/products/${product.productId}`, token);
        setLoading(true);
    }

    return (
        <div className='p-4 md:p-8 bg-gradient-to-b from-purple-50 to-purple-100 min-h-screen'>
            <h1 className='text-2xl md:text-4xl font-bold text-center mb-8'>Our Products</h1>
            {
                loading ? (
                    <Loader />
                ) : products?.length > 0 ? (
                    <div className='flex flex-wrap justify-center gap-8'>
                        {products.map(product =>
                            <div
                                key={product.productId}
                                className='bg-white w-full max-w-xs rounded-2xl overflow-hidden shadow-lg hover:shadow-2xl transition-shadow duration-300 flex flex-col'
                            >
                                <div
                                    className="relative h-72 bg-gradient-to-br from-purple-100 via-pink-100 to-yellow-100 flex items-center justify-center cursor-pointer group"
                                    onClick={() => {
                                        if (role === 'USER')
                                            handleClickUser(product.productId)
                                        else
                                            handleClickAdmin(product.productId)
                                    }}
                                >
                                    <img
                                        src={product.imageUrl}
                                        alt={product.name}
                                        className='object-contain h-64 w-full transition-transform duration-300 group-hover:scale-110 drop-shadow-xl rounded-2xl'
                                    />
                                </div>
                                <div className="p-5 flex flex-col flex-1">
                                    <h2
                                        className='text-lg font-bold text-purple-800 mb-2 cursor-pointer truncate'
                                        title={product.name}
                                        onClick={() => handleClick(product.productId)}
                                    >
                                        {product.name}
                                    </h2>
                                    <p
                                        className='text-base text-gray-500 mb-2 line-clamp-2 min-h-[2.5em]'
                                        title={product.description}
                                    >
                                        {product.description}
                                    </p>
                                    <div className='flex items-center justify-between mt-auto mb-4'>
                                        <span className='text-xl font-bold text-purple-600'>&#8377; {product.price}</span>
                                        {product.category && (
                                            <span className='bg-purple-50 text-purple-500 text-xs px-2 py-1 rounded-full font-semibold'>{product.category}</span>
                                        )}
                                    </div>
                                    <div className='flex gap-2'>
                                        {user && user.role === 'USER' && (
                                            <button
                                                className='flex-1 bg-gradient-to-r from-purple-600 to-pink-500 text-white py-2 rounded-lg font-semibold shadow hover:from-purple-500 hover:to-pink-400 transition'
                                                onClick={() => handleAddCart(product)}
                                            >
                                                Add to Cart
                                            </button>
                                        )}
                                        {user && user.role === 'ADMIN' && (
                                            <>
                                                <button
                                                    className='flex-1 bg-green-500 text-white py-2 rounded-lg font-semibold shadow hover:bg-green-600 transition'
                                                    onClick={() => handleEditProduct(product)}
                                                >
                                                    Edit
                                                </button>
                                                <button
                                                    className='flex-1 bg-red-500 text-white py-2 rounded-lg font-semibold shadow hover:bg-red-600 transition'
                                                    onClick={() => handleDeleteProduct(product)}
                                                >
                                                    Delete
                                                </button>
                                            </>
                                        )}
                                    </div>
                                </div>
                            </div>
                        )}
                    </div>
                ) : (
                    <p className='text-center text-lg text-gray-500'>No Products</p>
                )
            }
        </div>
    )
}

export default ProductList