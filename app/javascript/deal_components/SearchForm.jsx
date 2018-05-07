import React from 'react';
import ReacTDOM from 'react-dom';


export default class SearchForm extends React.Component{
   
    constructor(props){
       super(props);
   }
   state ={query: ""};
    /*handleSearch = () => {
        var query = ReactDom.findDOMNode(this.refs.query).value;

        
       var self = this;
        axios.defaults.headers.common['X-Requested-With'] = "XMLHttpRequest";
        axios.get('/', {params: {query: query}})
            .then(function(response){
                console.log(response.data);
                self.props.handleSearch(response.data);
            })
            .catch(function(error){
                console.log(error);
                alert('Cannot sort events: ', error);
            });
    };*/
    handleSearchChange = (e) => {
        this.props.handleSearchChange(e);
    }
    
    handleKeyPress = (e) => {
        
        if(e.key ==='Enter'){
            e.preventDefault();
            var query = e.target.value;
            //console.log("In handleKeyPress " + query);
            this.props.handleSearchParams();

        }
    }
    
    render = () => {
         var self = this;
        return(
           
            <input 
                className="form-control"
                id="text-field-default"
                value={this.props.query}
                placeholder="Search for deals..."
                onKeyPress={self.handleKeyPress}
                onChange={self.handleSearchChange}
                type="text"
                ref="query"
            />
            
        )
    }
}