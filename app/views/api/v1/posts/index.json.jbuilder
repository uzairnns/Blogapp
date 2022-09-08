json.posts @posts do |post|
  json.id post.id
  json.title post.title
  json.description post.description
  json.name post.user.name
  json.likes post.get_likes.size
end
