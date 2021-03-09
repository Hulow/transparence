puts "username: #{tweet['user']['screen_name']}"
puts "content: #{tweet['full_text']}"
puts "hashtag: #{tweet['entities']['hashtags']}"
puts "date: #{Time.new(tweet['created_at']).strftime('%a %d %b %Y')}"
puts "tweet_id: #{tweet['id']}"
puts "user_description: #{tweet['user']['description']}"
#puts "followers_count: #{tweet['user']['followers_count']}"
#puts "friends_count: #{tweet['user']['friends_count']}"
#puts "listed_count: #{tweet['user']['listed_count']}"
puts "avatar_http: #{tweet['user']['profile_image_url']}"
puts "avatar_https: #{tweet['user']['profile_image_url_https']}"
puts "lang: #{tweet['lang']}"
puts "location: #{tweet['user']['location']}"
puts "politician_id: #{politician.id}"

#second step
puts "picture: #{api.fucking_nested_data(tweet, ['extended_entities','media', 0, 'media_url'])}"
puts "video: #{api.fucking_nested_data(tweet, ['extended_entities','media',0, 'video_info','variants',0, 'url'])}" # video

#third step
puts "retweet_username: #{api.fucking_nested_data(tweet, ['quoted_status','user','screen_name'])}"
puts "retweet_date: #{api.fucking_nested_data(tweet, ['quoted_status','created_at'])}"
puts "retweet_id: #{api.fucking_nested_data(tweet, ['quoted_status','id'])}"
puts "retweet_content: #{api.fucking_nested_data(tweet, ['quoted_status','full_text'])}"
puts "retweet_location: #{api.fucking_nested_data(tweet, ['quoted_status','user','location'])}"
puts "retweet_hashtag: #{api.fucking_nested_data(tweet, ['quoted_status','entities','hashtags',0,'text'])}"
puts "retweet_user_description: #{api.fucking_nested_data(tweet, ['quoted_status','user','description'])}"
puts "retweet_avatar_http: #{api.fucking_nested_data(tweet, ['quoted_status','user','profile_image_url'])}"
puts "retweet_avatar_https: #{api.fucking_nested_data(tweet, ['quoted_status','user','profile_image_url_https'])}"
puts "retweet_followers_count: #{api.fucking_nested_data(tweet, ['quoted_status','user','followers_count'])}"
puts "retweet_friends_count: #{api.fucking_nested_data(tweet, ['quoted_status','user','friends_count'])}"
puts "retweet_listed_count: #{api.fucking_nested_data(tweet, ['quoted_status','user','listed_count'])}"
puts "retweet_photo: #{api.fucking_nested_data(tweet, ['quoted_status','entities','media',0,'media_url_https'])}"
puts "retweet_media: #{api.fucking_nested_data(tweet, ['quoted_status','extended_entities','media',0,'video_info','variants',0,'url'])}"

#

