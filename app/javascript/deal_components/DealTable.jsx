import React from 'react';
import axios from 'axios';
import DealCollection from './DealCollection';
import SearchForm from './SearchForm';
import PopularityBtn from './PopularityBtn';
import NameBtn from './NameBtn';
import DateBtn from './DateBtn';




export default class DealTable extends React.Component{
    state = {deals: [], direction: 'desc', selectcategory: 8, sort_by: 'popularity', query: "", page: 0, pagecount: 0}; 
    
    handleUpVote = (id, voteState) => {
        var self = this;
        
        axios.defaults.headers.common['X-Requested-With'] = "XMLHttpRequ]est";
        axios.patch('/deals/'+id+'/upvote', {voteState: voteState})
        .then(function(response){
            console.log(response.data);
           axios.defaults.headers.common['X-Requested-With'] = "XMLHttpRequest";
            axios.get('/', {params: {query: self.state.query, category: self.state.selectcategory, sort_by: self.state.sort_by, direction: self.state.direction, page: self.state.page}})
                .then(function(response_1){
                    console.log(response_1.data);
                    self.setState({deals: response_1.data});
                })
                .catch(function(error_1){
                    console.log(error_1);
                });
                
        })
        .catch(function(error){
            console.log(error);
        });
    }
    
    handleDownVote = (id, voteState) => {
        var self = this;
        
        axios.defaults.headers.common['X-Requested-With'] = "XMLHttpRequ]est";
        axios.patch('/deals/'+id+'/downvote', {voteState: voteState})
        .then(function(response){
            axios.defaults.headers.common['X-Requested-With'] = "XMLHttpRequest";
            axios.get('/', {params: {query: self.state.query, category: self.state.selectcategory, 
              sort_by: self.state.sort_by, direction: self.state.direction, page: self.state.page}})
                .then(function(response_1){
                    console.log(response_1.data);
                    self.setState({deals: response_1.data});
                })
                .catch(function(error_1){
                    console.log(error_1);
                });
        })
        .catch(function(error){
            console.log(error);
        });
    }
    
    handleFavorite = (id,favState) => {
         var self = this;
        
        axios.defaults.headers.common['X-Requested-With'] = "XMLHttpRequ]est";
        axios.patch('/deals/'+id+'/favorite', {favState: favState})
        .then(function(response){
            axios.defaults.headers.common['X-Requested-With'] = "XMLHttpRequest";
            axios.get('/', {params: {query: self.state.query, category: self.state.selectcategory, 
              sort_by: self.state.sort_by, direction: self.state.direction, page: self.state.page}})
                .then(function(response_1){
                    console.log(response_1.data);
                    self.setState({deals: response_1.data});
                })
                .catch(function(error_1){
                    console.log(error_1);
                });
        })
        .catch(function(error){
            console.log(error);
        });
        
    }

    handleSearch = (deals) => {
        this.setState({deals: deals});
    }
    
    handleSelectCategory = (e) => {
        this.setState({selectcategory: parseInt(e.target.value)}, this.handleSearchParams);
        
    }
    
    
    handleSortByChange = (value) => {
        this.setState({sort_by: value})
        //in this spot is where the method goes
    }
    

    handleDirectionClick = () => {
        if(this.state.direction == 'desc'){
            this.setState({direction: 'asc'})
        }
        else{
            this.setState({direction: 'desc'})
        }
            
    
    }
    
    handleSearchChange = (e) => {
        this.setState({query: e.target.value})
    }
    
    //Handles both Direction click and SortBy change
    handleBoth = (value) =>{
        if(this.state.sort_by == value){
            this.handleDirectionClick();
        }
        else{
            this.setState({direction: 'desc'});
        }
        this.setState({sort_by: value},this.handleSearchParams);
    }
    
    handleSearchParams =() => {
        //console.log(self.state.query);
        var self = this;
        axios.defaults.headers.common['X-Requested-Wit']="XMLHttpRequest";
        axios.get('/', {params: {query: self.state.query, category: self.state.selectcategory, 
          sort_by: self.state.sort_by, direction: self.state.direction, page: self.state.page}})
        .then(function(response){
            console.log(response.data);
            self.setState({deals: response.data});
            
        })
        .catch(function(error){
            console.log(error);
        });
    }
    
    handleDealsRender = () => {
        this.handleSearchParams();
        this.setState({deals: this.state.page +1});
    }
   
    
    componentDidMount(){
        var self = this;
        
        axios.defaults.headers.common['X-Requested-With'] = "XMLHttpRequest";
        axios.get('/',{params :{page: self.state.page}})
            .then(function(response){
               // console.log(response.data.limit);
                self.setState({deals: response.data, pagecount:  Math.ceil(response.data.length / 5)});
            })
            .catch(function(error){
                console.log(error);
            });
            //this.handleDealsRender();
    }
    
    render() {
        return (
          <div>
            <nav className="navbar navbar-default" style={{marginBottom: "1.5em"}}>
              <form className="navbar-form navbar-left" id="search_bar">
                <SearchForm handleSearchParams={this.handleSearchParams.bind(this)} 
                  handleSearchChange={this.handleSearchChange} query={this.state.query}/>
              </form>
              <div className="form-group">
                <select className="form-control" type="number" id="search_dropdown" 
                  value={this.state.selectcategory} onChange={this.handleSelectCategory} 
                  style={{textAlign:"center", width: "180px"}}>
                    <option value={0}>Food</option> 
                    <option value={1}>Clothing</option> 
                    <option value={2}>Electronics</option> 
                    <option value={3}>Services</option> 
                    <option value={4}>Health & Fitness</option> 
                    <option value={5}>Education</option> 
                    <option value={6}>Automotive</option> 
                    <option value={7}>Other</option> 
                    <option value={8}>All</option> 
                </select>
              </div>
              <h4 style={{color: "white"}} id="pop_sort_text">Popularity</h4>
              <button className="btn btn-default" id="pop_sort_button" label="Popularity" value="popularity" 
                onClick={() => this.handleBoth('popularity')}  >
                  <PopularityBtn direction={this.state.direction} sort_by={this.state.sort_by}/>
              </button>
              <h4 style={{color: "white"}} id="name_sort_text">Name</h4>
              <button className="btn btn-default" id="name_sort_button" label="Name" value={"name"}  
                onClick={() => this.handleBoth('name')} >
                  <NameBtn direction={this.state.direction} sort_by={this.state.sort_by} />
              </button>
              <h4 style={{color: "white"}} id="date_sort_text">Start Date</h4>
              <button className="btn btn-default" id="date_sort_button" label="Date" value="start_date"  
                onClick={() => this.handleBoth('start_date')} >
                  <DateBtn direction={this.state.direction} sort_by={this.state.sort_by}/>
              </button>
            </nav>

            <div style={{margin: "auto", width: "500px", height: "250px"}}>
              <div>
                <DealCollection
                  deals={this.state.deals}
                  handleUpVote={this.handleUpVote.bind(this)}
                  handleDownVote={this.handleDownVote.bind(this)}
                  handleFavorite={this.handleFavorite.bind(this)}
                  handleDealsRender={this.handleDealsRender.bind(this)}
                  pagecount={this.state.pagecount}
                  personnel={this.props.personnel}
                /> 
              </div>
            </div>
          </div>
        );
    }
}