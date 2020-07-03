class CreateUsers < ActiveRecord::Migration[6.0]
	def change
		create_table :users do |t|
			t.string :name
			t.string :guild
			t.boolean :status
			#t.avatar
			#t.history
			#t.friends
			#t.stats

			t.timestamps
		end
	end
end
