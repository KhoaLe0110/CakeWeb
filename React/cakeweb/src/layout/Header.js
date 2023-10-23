import { useContext, useEffect, useState } from "react"
import { Badge, Button, Col, Container, Form, Nav, NavDropdown, Navbar, Row} from "react-bootstrap";

import Apis, { endpoints } from "../configs/Apis";
import MySpinner from "./MySpinner";
import { Link, useNavigate } from "react-router-dom";
import { MyCartContext, MyUserContext } from "../App";


const Header =() =>{
    const [user,dispatch]=useContext(MyUserContext);
    const [cartCounter,]= useContext(MyCartContext);
    const [categories, setCategories] =useState(null);
    const [kw,setKw]=useState("");
    const nav =useNavigate();
    const loadCates =async() =>{
       let res= await Apis.get(endpoints['categories'])
        setCategories(res.data);
    }
    useEffect(() => {
        loadCates();
    } ,[])
    const search =(evt)=>{
        evt.preventDefault();
        nav(`/?kw=${kw}`)
    }
    const logout =()=>{
      dispatch({
        "type":"logout"
      })
    }

    if(categories===null)
    
    return <MySpinner />;
    
    return( <>
    <Navbar bg="dark" data-bs-theme="dark">
        <Container>
          
            <Navbar.Brand href="/">&#129383; CakeWeb</Navbar.Brand>
            <Navbar.Toggle aria-controls="basic-navbar-nav" />
            <Navbar.Collapse id="basic-navbar-nav">
            <Nav className="me-auto">
                <Link className="nav-link" to="/">Trang Chủ</Link>
                <NavDropdown title="Danh mục bánh" id="basic-nav-dropdown">
                {categories.map(c =>{
                  let h= `/?cateId=${c.cateId}`; 
                  return <Link className="dropdown-item" to={h} key={c.id}>{c.name}</Link>
                })}
    
            </NavDropdown>
             {user===null?<>
             <Link className="nav-link text-success" to="/login">Đăng nhập</Link>
             <Link className="nav-link text-primary" to="/register">Đăng ký</Link>
             </> :<>
              <Link className="nav-link text-info" to="/">Hello, &#128075; {user.username}</Link> 
              <Link className="nav-link text-danger" onClick={logout}>Đăng xuất</Link>
             </>}
             
             <Link className="nav-link text-danger" to="/cart">&#128722; <Badge bg="danger">{cartCounter}</Badge></Link>

            </Nav>
            <Form onSubmit={search} inline>
        <Row>
          <Col xs="auto">
            <Form.Control
              type="text"
              value={kw}
              onChange={e => setKw(e.target.value)}
              placeholder="Nhập từ khóa..." name="kw"
              className=" mr-sm-2"
            />
          </Col>
          <Col xs="auto">
            <Button type="submit">Tìm</Button>
          </Col>
        </Row>
      </Form>
            </Navbar.Collapse>
        </Container>
        </Navbar>
    </>
)}
export default Header;