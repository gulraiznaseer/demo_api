json.user_id @blog.user_id
json.id @blog.id
json.title @blog.title
json.body @blog.body
json.created_at @blog.created_at
json.comments @blog.comments.count
json.comments @blog.comments do |comment|
  json.user_id comment.user_id
  json.comment_id comment.id
  json.body comment.body
  json.created_at @blog.created_at
end
