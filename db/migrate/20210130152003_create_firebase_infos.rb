class CreateFirebaseInfos < ActiveRecord::Migration[6.1]
  def change
    create_table :firebase_infos do |t|
      t.string :apiKey
      t.string :authDomain
      t.string :databaseURL
      t.string :projectId
      t.string :storageBucket
      t.string :messagingSenderId
      t.string :appId
      t.string :measurementId

      t.timestamps
    end
  end
end
