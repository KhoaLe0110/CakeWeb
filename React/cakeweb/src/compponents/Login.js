import { useContext, useState } from "react";
import { Button, Form } from "react-bootstrap";
import Apis, { authApi, endpoints } from "../configs/Apis";
import cookie from "react-cookies";

import { Navigate, useSearchParams } from "react-router-dom";
import { MyUserContext } from "../App";

const Login = () =>{
    const [user,dispatch]=useContext(MyUserContext);
    const [username,setUsername] =useState();
    const [password,setPassword] =useState();
    const [q]=useSearchParams();
    


    const login =(evt) =>{
        evt.preventDefault();

        const process =async() =>{
           try{
            let res= await Apis.post(endpoints['login'],{
                "username":username,
                "password":password
            });
            cookie.save("token",res.data);
            let {data} =await authApi().get(endpoints['current-user']);
            cookie.save("user",data);
            console.info(data);

            dispatch({
                "type":"login",
                "payload":data
            })
           }catch(err){
            console.error(err);
           }
        }
        process();
    }
    if(user !==null){
    let next= q.get("next") || "/";
    return <Navigate to={next}/>
    }
return(
    <>
    <h1 className="text-center text-info">ĐĂNG NHẬP TÀI KHOẢN</h1>
    <Form onSubmit={login}>
      <Form.Group className="mb-3" >
        <Form.Label>Tên đăng nhập</Form.Label>
        <Form.Control value={username} onChange={e => setUsername(e.target.value)} type="text" placeholder="Tên đăng nhập" />
      </Form.Group>
      <Form.Group className="mb-3" >
        <Form.Label>Mật khẩu</Form.Label>
        <Form.Control value={password} onChange={e => setPassword(e.target.value)} type="password" placeholder="Mật khẩu" />
      </Form.Group>
      <Form.Group className="mb-3" >
        <Button variant="primary" type="submit">Đăng nhập</Button>
      </Form.Group>
      </Form>
    </>
)
}
export default Login;