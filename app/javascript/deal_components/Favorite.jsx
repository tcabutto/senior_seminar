import React from 'react';

export default class Favorite extends React.Component{
    constructor(props){
        super(props);
    }
    
    render = () =>{
        if (this.props.favState == 1) {
            return <span className="glyphicon glyphicon-star"/>
        }
        else {
            return <span className="glyphicon glyphicon-star-empty"/>
        }
    }
    
}