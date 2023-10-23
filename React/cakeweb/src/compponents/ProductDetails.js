import { useContext, useEffect, useState } from "react";
import { Link, useParams} from "react-router-dom";
import MySpinner from "../layout/MySpinner";
import Apis, { authApi, endpoints } from "../configs/Apis";
import { Button, Col, Form, Image, ListGroup, Row } from "react-bootstrap";
import { MyUserContext } from "../App";
import Moment from "react-moment";
import 'moment/locale/vi';

const ProductDetail = () => {
    const [user, ] = useContext(MyUserContext);
    const {cakeId} = useParams();
    const [product, setProduct] = useState(null);
    const [comments, setComments] = useState(null);
    const [content, setContent] = useState();

    useEffect(() => {
        const loadProduct = async () => {
            let {data} = await Apis.get(endpoints['details'](cakeId));
            setProduct(data); 
        }

        const loadComments = async () => {
            let {data} = await Apis.get(endpoints['comments'](cakeId));
            setComments(data);
        }

        loadProduct();
        loadComments();
    }, []);

    const addComment = () => {
        const process = async () => {
            let {data} = await authApi().post(endpoints['add-comment'], {
                "content": content, 
                "cakeId": product.cakeId
            });

            setComments([...comments, data]);
        }

        process();
    }
    
    if (product === null)
        return <MySpinner /> 
    if(comments===null)
    return <MySpinner/>;

    let url = `/login?next=/products/${cakeId}`;
    return <>
        <h1 className="text-center text-info mt-2">CHI TIẾT SẢN PHẨM ({cakeId})</h1>
        <Row>
            <Col md={5} xs={6}>
                <Image src={product.img} rounded fluid />
            </Col>
            <Col md={5} xs={6}>
                <h2 className="text-danger">{product.name}</h2>
                <p>{product.description}</p>
                <h3>{product.price} VNĐ</h3>
            </Col>
        </Row>
        <hr />
        

        {user===null?<p>Vui lòng <Link to={url}>đăng nhập</Link> để bình luận! </p>:<>
        <Form.Control as="textarea" aria-label="With textarea" value={content} onChange={e => setContent(e.target.value)} placeholder="Nội dung bình luận" />
        <Button onClick={addComment} className="mt-2" variant="info">Bình luận</Button>
        </>}
        <hr />
        <ListGroup>
            {comments.map(c => <ListGroup.Item id={c.id}>
                       {c.content} - <Moment locale="vi" fromNow>{c.createdDate}</Moment>
                    </ListGroup.Item>)
            }
        </ListGroup>
    </>
}
export default ProductDetail;