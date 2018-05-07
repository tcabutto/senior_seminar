import React from 'react';
import Deal from './Deal';

export default class DealCollection extends React.Component{
    constructor(props) {
        super(props);
    }

    handleUpVote = (id,voteState) => {
        this.props.handleUpVote(id,voteState);
    }
    
    handleDownVote = (id,voteState) => {
      this.props.handleDownVote(id,voteState);
    }
    
    handleFavorite = (id,favState) => {
        this.props.handleFavorite(id,favState);
    }

    render = (id) =>{
        var deals = [];
        var self = this;
        
        this.props.deals.forEach(function(deal,index){
            deals.push(
                <Deal
                    favState = {deal[0].favState}
                    voteState = {deal[0].voteState}
                    deal={deal}
                    personnel={self.props.personnel}
                    key={'deal' + deal[0].deal.id}
                    handleUpVote={self.handleUpVote}
                    handleDownVote={self.handleDownVote}
                    handleFavorite={self.handleFavorite}
                />    
            );
        });
        
        return(
            <div >
                {deals}
            </div>
            
        );
    }
}