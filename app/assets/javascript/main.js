//= require_tree .

var users = new Users();
users.fetch({
	success: function(model, response, options)
	{
		var usersview = new UsersView({ el: "#container", model: model });
		usersview.render();
	}
});