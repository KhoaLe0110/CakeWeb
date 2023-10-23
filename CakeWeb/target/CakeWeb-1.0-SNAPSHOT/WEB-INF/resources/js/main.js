function delPro(path, cakeId) {
    if (confirm("Bạn chắc chắn xóa không?") === true) {
        fetch(path,{
            method: "delete"
        }).then(res => {
            if (res.status === 204)
                location.reload();
            else
                alert("Something wrong!!!");
        });
    }
}

function addToCart(cakeId){
    fetch(`/CakeWeb/api/cart/${cakeId}`).then(res => res.json()).then(data => {
        var d=document.getElementById("cart-counter");
        if(d !==null)
            d.innerText=data;
    })
    
}
function loadComments(endpoint) {
    fetch(endpoint).then(function(res) {
        return res.json();
    }).then(function(data) {
        let c = document.getElementById("comment");
        let h = '';
        for (let d of data) 
            h += `
                <li class="list-group-item"><em>${d.content}</em> duoc binh luan boi <strong>${d.user.username}</strong> vao luc <strong>${moment(d.createdDate).locale("vi").fromNow()}</strong></li>
            `;
        c.innerHTML = h;
    });
} 

function addComment(endpoint, cakeId) {
    fetch(endpoint, {
        method: "post",
        body: JSON.stringify({
            "content": document.getElementById("contentId").value,
            "cakeId": proId
        }),
        headers: {
            "Content-Type": "application/json"
        }
    }).then(function(res) {
        return res.json();
    }).then(function(data) {
        let d = document.querySelector("#comment li:first-child");
        let h = `
                <li class="list-group-item"><em>${data.content}</em> duoc binh luan boi <strong>${data.user.username}</strong> vao luc <strong>${moment(data.createdDate).locale("vi").fromNow()}</strong></li>
            `;
        d.insertAdjacentHTML("beforebegin", h);
    });
}
