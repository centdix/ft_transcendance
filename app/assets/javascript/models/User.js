var User = Backbone.Model.extend({
	url: '/users',
	initialize: function(){
		console.log("Hello");
	}
});