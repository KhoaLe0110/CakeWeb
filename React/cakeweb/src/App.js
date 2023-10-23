import { BrowserRouter, Route, Routes } from "react-router-dom";
import Header from "./layout/Header";
import Home from "./compponents/Home";
import Footer from "./layout/Footer";
import 'bootstrap/dist/css/bootstrap.min.css'
import { Container } from "react-bootstrap";
import Login from "./compponents/Login";
import { createContext, useReducer } from "react";
import MyUserReducer from "./reducers/MyUserReducer";
import cookie from "react-cookies";
import Register from "./compponents/Register";
import MyCartCounterReducer from "./reducers/MyCartCounterReducer";
import Cart from "./compponents/Cart";
import ProductDetail from "./compponents/ProductDetails";

export const MyUserContext=createContext();
export const MyCartContext=createContext();

const countCart =() =>{
  let cart= cookie.load("cart") || null;
  if(cart !==null)
    return Object.values(cart).reduce((init, current) =>init + current["quantity"],0);
  return 0;
}

const App =() =>{
  const [user,dispatch]=useReducer(MyUserReducer,cookie.load("user")||null);
  const [cartCounter,cartDispatch] =useReducer(MyCartCounterReducer,countCart());

  return (
    <MyUserContext.Provider value={[user,dispatch]}>
      <MyCartContext.Provider value={[cartCounter,cartDispatch]}>
    <BrowserRouter>
    <Header />
      <Container>
      <Routes>
        <Route path="/" element={<Home/>}/>
        <Route path="/login" element={<Login/>}/>
        <Route path="/register" element={<Register/>}/>
        <Route path="/cart" element={<Cart/>}/>
        <Route path="/products/:cakeId" element={<ProductDetail/>}/>
      </Routes>
      </Container>
    <Footer/>
    </BrowserRouter>
    </MyCartContext.Provider>
    </MyUserContext.Provider>
  )
}
export default App;