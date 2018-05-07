import React from 'react';

export default class PopularityBtn extends React.Component{
    
    constructor(props){
        super(props);
       
    }
    render =() => {

        if(this.props.sort_by == 'popularity'){
            if(this.props.direction == 'desc'){
                return  <span className="glyphicon glyphicon-collapse-down"/>; 
            }
            else{
                return <span className="glyphicon glyphicon-collapse-up"/>; 
            }
        }
        else {
            return <span className="glyphicon glyphicon-unchecked"/>;
        }
    }
    
}