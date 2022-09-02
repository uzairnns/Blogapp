json.posts @posts do |post|
  json.id post.id
  json.title post.title
  json.description post.description
  json.name post.user.name
  json.likes post.get_likes.size
  json.comments post.comments do |comment|
    json.name comment.user.name
    json.body comment.body
  end
  json.suggestions post.suggestions do |suggestion|
    json.name suggestion.user.name
    json.body suggestion.body
  end
end
