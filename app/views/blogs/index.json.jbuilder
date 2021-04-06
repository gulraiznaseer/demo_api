json.array! @blogs do |blog|
  json.id blog.id
  json.title blog.title
  json.body blog.body
  json.created_at blog.created_at
end
