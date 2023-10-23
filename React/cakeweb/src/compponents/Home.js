import { useContext, useEffect, useState } from "react"
import MySpinner from "../layout/MySpinner";
import Apis, { endpoints } from "../configs/Apis";
import { Alert, Button, Card, Col, Row } from "react-bootstrap";
import { Link, useSearchParams } from "react-router-dom";
import { MyCartContext } from "../App";
import cookie from "react-cookies";

const Home =() =>{
    const [products,setProducts]=useState(null);
    const [,cartDispatch] =useContext(MyCartContext);
    const [q] =useSearchParams();
    useEffect(() =>{
        const loadProducts =async ()=>{
            try{
                let e=endpoints['products'];

                let cateId=q.get("cateId");
                if(cateId !== null)
                e=`${e}?cateId=${cateId}`;
                else{

                let kw = q.get("kw");
                if(kw!==null)
                    e=`${e}?kw=${kw}`;
                }
                let res=await Apis.get(e);
                 setProducts(res.data);
            }catch (ex){
                console.error(ex);
            }
        
        }
        loadProducts();
    },[q]);

    const order =(product) =>{
        cartDispatch({
            "type":"inc",
            "payload":1 
        });

        //cookie
        let cart =cookie.load("cart") || null;
        if(cart == null)
            cart={};
        if(product.cakeId in cart) {
            cart[product.cakeId]["quantity"] +=1;
        }else{
            cart[product.cakeId]={
                "id":product.cakeId,
                "name":product.name,
                "quantity":1,
                "unitPrice":product.price
            }
        }
        cookie.save("cart",cart);

        console.info(cart);
    }

    if(products===null)
        return <MySpinner/>
    if(products.length ===0)
    return <Alert variant="danger" className="mt-1">Không có sản phẩm nào</Alert>
    return(
    <>
    <h1 className="text-center text-info">Danh sách bánh kem</h1>
    <Row>
            {products.map(p=>{
                let url=`/products/${p.cakeId}`;
                return   <Col xs={12} md={3} className="mt-1">
                    <Card style={{ width: '18rem' }}>
                <Card.Img variant="top" src={p.img} />
                <Card.Body>
                  <Card.Title>{p.name}</Card.Title>
                  <Card.Text>{p.price} VNĐ</Card.Text>
                  <Link to={url} className="btn btn-success"variant="success">Xem chi tiết</Link>
                  <Button variant="info" className="ms-1" onClick={() =>order(p)}>Đặt hàng</Button>
                </Card.Body>
              </Card>
              </Col>
            })}
    </Row>
    </>
        
    )
}
export default Home