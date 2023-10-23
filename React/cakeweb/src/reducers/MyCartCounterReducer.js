const MyCartCounterReducer =(curentState, action) =>{
    switch(action.type){
        case "inc":
            return curentState +action.payload;
            
        case "dec":
            return curentState-action.payload;

        case "update":
            return action.payload;
    }

    return curentState;
}
export default MyCartCounterReducer;