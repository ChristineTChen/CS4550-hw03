# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Microblog.Repo.insert!(%Microblog.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Microblog.Repo
alias Microblog.Accounts.User
alias Microblog.Accounts.Follow
alias Microblog.Blog.Post
alias Microblog.Blog.Hashtag
alias Microblog.Blog.Tagpost

Repo.delete_all(Follow)
Repo.delete_all(Post)
Repo.delete_all(User)
Repo.delete_all(Hashtag)
Repo.delete_all(Tagpost)

cc = Repo.insert!(%User{name: "christine", display_name: "CC", email: "chen.chr@husky.neu.edu"})
tg = Repo.insert!(%User{name: "taliah", display_name: "TG", email: "green.ta@husky.neu.edu"})
cw = Repo.insert!(%User {name: "cindy", display_name: "CW", email: "wu.cindy@husky.neu.edu"})
rh = Repo.insert!(%User {name: "ryan", display_name: "RH", email: "hughes.ry@husky.neu.edu"})


Repo.insert!(%Follow{follower_user_id: cc.id, following_user_id: tg.id})
Repo.insert!(%Follow{follower_user_id: cc.id, following_user_id: cw.id})
Repo.insert!(%Follow{follower_user_id: cc.id, following_user_id: rh.id})
Repo.insert!(%Follow{follower_user_id: tg.id, following_user_id: cc.id})
Repo.insert!(%Follow{follower_user_id: tg.id, following_user_id: cw.id})
Repo.insert!(%Follow{follower_user_id: tg.id, following_user_id: rh.id})
Repo.insert!(%Follow{follower_user_id: cw.id, following_user_id: cc.id})
Repo.insert!(%Follow{follower_user_id: cw.id, following_user_id: tg.id})

Repo.insert!(%Post{title: "First post", user_id: cc.id, content: "This is the first blog post! Welcome!"})
Repo.insert!(%Post{title: "Doing homework all week", user_id: cc.id, content: "Wow! This week is really hectic. I have a lot of work to do!"})
Repo.insert!(%Post{title: "About me", user_id: tg.id, content: "Hi, I'm a Bio major!"})

#hw = Repo.insert!(%Post{tag_name: "#school"})
#st = Repo.insert!(%Post{tag_name: "#STRESSED"})

#Repo.insert!(%Tagpost{hashtag_id: hw.id, post_id: cc1.id})
#Repo.insert!(%Tagpost{hashtag_id: hw.id, post_id: cc2.id})
#Repo.insert!(%Tagpost{hashtag_id: st.id, post_id: cc2.id})
#Repo.insert!(%Tagpost{hashtag_id: st.id, post_id: tg1.id})
