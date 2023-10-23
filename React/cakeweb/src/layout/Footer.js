import { Alert, Container } from "react-bootstrap"
import { Link } from "react-router-dom"

const Footer =() =>{
    return(
      <>
       <Alert className="mt-5">
          <Container className="text-center">
          <Link className="ms-5">Địa chỉ cửa hàng</Link>
          <Link className="ms-5">Contact</Link>
          </Container>
          CakeWeb &copy; 2023
        </Alert>
      </>
    )
}
export default Footer