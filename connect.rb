require 'rubygems'
require 'mongo'

# MongoDBに接続
client = Mongo::Client.new('mongodb://localhost/tutorial')

# usersコレクションをすべて取得
document = client[:users].find()

# カーソル操作
document.each do |rec|
    puts rec["lastname"]
end

