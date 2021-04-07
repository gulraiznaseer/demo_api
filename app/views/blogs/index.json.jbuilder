json.array! @blogs do |blog|
  json.user_id blog.user_id
  json.id blog.id
  json.title blog.title
  json.body blog.body
  json.created_at blog.created_at
end
