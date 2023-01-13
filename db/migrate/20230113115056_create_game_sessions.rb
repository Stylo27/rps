class CreateGameSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :game_sessions do |t|
      t.string :user_throw
      t.string :server_throw
      t.string :status

      t.timestamps
    end
  end
end
