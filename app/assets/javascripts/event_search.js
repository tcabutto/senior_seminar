$(function () {
    $("#events  div button a , #events paginate div").on("click", function(e) {
    //    e.preventDefault();
        $.getScript(this.href);
        return false;
  });
    $("#events_list_search input").keypress(function (e) {
        var code = (e.keyCode ? e.keyCode : e.which);
        if(code == 13){
            //e.preventDefault()
            $.get($("#events_list_search").attr("action"), $("#events_list_search").serialize(), null,"script");
            return false;
        }
    })
    
})
    