require 'rubygems'
require 'mongo'

# MongoDBに接続
client = Mongo::Client.new('mongodb://localhost/tutorial')
collection = client[:users]

# usersコレクション初期化
collection.delete_many()

# usersコレクションにデータ登録
3.times{|i|
    collection.insert_one({"lastname" => "smith" + i.to_s ,"num" => i })
}

# usersコレクションをすべて取得
document = collection.find().sort({"lastname" => -1})

# カーソル操作
document.each do |rec|
    puts rec["lastname"]
end

# usersコレクションのアップデート(Ruby version2.2以降)
collection.update_one({lastname: "smith2"}, {"$set": {age: 33}})
# どのRubyのバージョンでもokな書き方
#collection.update_one({ "lastname" => "smith2" }, { "$set" => { age: 33 } })

document = collection.find()

# カーソル操作
document.each do |rec|
    puts rec
end