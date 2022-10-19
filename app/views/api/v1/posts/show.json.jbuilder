# frozen_string_literal: true

json.id @post.id
json.title @post.title
json.description @post.description
json.name @post.user.name
json.likes @post.get_likes.size
json.published @post.created_at
json.content @post.content
json.commentcount @post.comments.count
json.comments @post.comments do |comment|
  json.commentid comment.id
  json.name comment.user.name
  json.body comment.body
end
json.suggestions @post.suggestions do |suggestion|
  json.suggestid suggestion.id
  json.name suggestion.user.name
  json.body suggestion.body
end
