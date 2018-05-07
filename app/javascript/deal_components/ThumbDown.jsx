import React from 'react';

export default class ThumbDown extends React.Component{
    constructor(props) {
        super(props);
    }
    render = () =>{
        if(this.props.voteState == -1){
             return <span className="glyphicon glyphicon-thumbs-down" style={{ color: "red" }}/>
        }
        else {
            return <span className="glyphicon glyphicon-thumbs-down"/>
        }
    }
}