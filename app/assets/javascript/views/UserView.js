var addUser = Backbone.View.extend({

	events: {
		"click .add": "onClick"
	},

	onClick: function(){
		var user = new User({
			name: $("#name").val()
		});
		user.save();
	},

	render: function(){
		this.$el.html("<input type='text' id='name'><button class='add'>Add user</button>");
		return this;
	}
});

var UserView = Backbone.View.extend({
	render: function(){
		this.$el.html(this.model.get("name"));
		return this;
	}
});

var UsersView = Backbone.View.extend({
	render: function(){
		var self = this;
		var adduser = new addUser();
		self.$el.append(adduser.render().$el);
		this.model.each(function(user){
			var userview = new UserView({ model: user });
			self.$el.append(userview.render().$el);
		});
	}
});