class FavoriteMailer < ApplicationMailer
  default from: 'cmshreve@gmail.com'

  def new_comment(user, post, comment)
   # headers["Message-ID"] = "<comments/#{comment.id}@your-app-name.example>"
   # headers["In-Reply-To"] = "<post/#{post.id}@your-app-name.example>"
   # headers["References"] = "<post/#{post.id}@your-app-name.example>"

   headers["Message-ID"] = "<comments/#{comment.id}@radiant-meadow-79731.herokuapp.com>"
   headers["In-Reply-To"] = "<post/#{post.id}@radiant-meadow-79731.herokuapp.com>"
   headers["References"] = "<post/#{post.id}@radiant-meadow-79731.herokuapp.com>"
   @user = user
   @post = post
   @comment = comment

   mail(to: user.email, subject: "New comment on #{post.title}")
  end
end
