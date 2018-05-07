import React from 'react';


export default class ThumbUp extends React.Component{
    constructor(props) {
        super(props);
    }
    
    render = () =>{
        if (this.props.voteState == 1) {
             return <span className="glyphicon glyphicon-thumbs-up" style={{ color: "green" }}/>
        }
        else {
            return <span className="glyphicon glyphicon-thumbs-up"/>
        }
    }
}