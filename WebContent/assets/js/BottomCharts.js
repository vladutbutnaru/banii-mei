function getLast5DaysTransactions(emailAddress){
	var params = {
		    email: emailAddress

		};
	console.log(emailAddress);
	var values = [];
	var values2 = [];
	$.get("/MyMoney/GetLast5DaysSpendingsServlet", $.param(params), function(responseJson) {    // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response JSON...
	    	
	        $.each(responseJson, function(index, item) { // Iterate over the JSON array.
	         
	        	
	        		values.push([item]);
	        		
	        });
	        // sidebar bottom graphs
	        $("#sidebar_visitors").sparkline(values, {
	            type: 'bar',
	            barColor: '#fa8564',
	            height: '20',
	            barWidth: '4',
	            barSpacing: 1,
	        });
	    });
	
	$.get("/MyMoney/GetLast5DaysEarningsServlet", $.param(params), function(responseJson) {    // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response JSON...
    	
        $.each(responseJson, function(index, item) { // Iterate over the JSON array.
         
        	
        		values2.push([item]);
        	
        });
        // sidebar bottom graphs
        $("#sidebar_orders").sparkline(values2, {
            type: 'bar',
            barColor: '#00ff00',
            height: '20',
            barWidth: '4',
            barSpacing: 1,
        });
    });
	
	
	
	
	
	
}