import React from 'react';
import PropTypes from 'prop-types';
import ThumbUp from './ThumbUp';
import ThumbDown from './ThumbDown';
import Favorite from './Favorite';
import Moment from 'react-moment';

export default class Deal extends React.Component{
   
    constructor(props){
        super(props);
    }

    static propTypes = {
        name: PropTypes.string,
        description: PropTypes.string,
        popularity: PropTypes.number,
        business_id : PropTypes.number,
        start_date: PropTypes.string, 
        end_date: PropTypes.string,
        logo: PropTypes.string
    }
    
    handleUpVote = (id, voteState) => {
        this.props.handleUpVote(this.props.deal[0].deal.id, this.props.deal[0].voteState);
    }
    
    handleDownVote = (id, voteState) => {
        this.props.handleDownVote(this.props.deal[0].deal.id, this.props.deal[0].voteState);
    }
    
    handleFavorite = (id, favState) => {
        this.props.handleFavorite(this.props.deal[0].deal.id, this.props.deal[0].favState);
    }

    render() {
      return (
        <div className="card" style={{ marginBottom: "1.5em", marginTop: "1.5em", width: "65em", position: "relative", marginLeft: "-15em" }}>
          <div className="card-header">
            <h3><a href={"deals/" + this.props.deal[0].deal.id}>{this.props.deal[0].deal.name}</a>  <span className="badge badge-secondary">{this.props.deal[0].deal.category}</span></h3>
          </div>
          <div className="card-body">
            <img src={this.props.deal[0].logo} style={{ width: "12em", float: "left", padding: "1.75em" }}/>
            <h4><a href={"businesses/" + this.props.deal[0].deal.business_id}>{this.props.deal[0].business}</a></h4>
            <h4><Moment format="MM/DD/YYYY">{this.props.deal[0].deal.start_date}</Moment>  -  <Moment format="MM/DD/YYYY">{this.props.deal[0].deal.end_date}</Moment></h4>
            <h4 dangerouslySetInnerHTML={{__html: this.props.deal[0].deal.description}}></h4>
          </div>
          { !this.props.personnel? <div/>:
          <div className="card-footer" style={{ display: "inline-block" }}>
            <div id="popularity">
              <button className="btn btn-default" id="upvote" onClick={() => this.handleUpVote()}><ThumbUp voteState = {this.props.deal[0].voteState} /> </button>
              <h5 id="pop">{this.props.deal[0].deal.popularity}</h5>
              <button className="btn btn-default" id="downvote" onClick={() => this.handleDownVote()}> <ThumbDown voteState = {this.props.deal[0].voteState} /> </button>
            </div>
            <div className="pull-right">
              <button className="btn btn-default" onClick={() => this.handleFavorite()}> <Favorite favState = {this.props.deal[0].favState} /> </button>
            </div>
          </div>
          }
   
          
        </div>
        
      );
    }
    
}