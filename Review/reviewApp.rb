
def post_review(a_posts)
  posts = {}
  puts "put a genre"
  posts[:genre] = gets.chomp
  puts "put a title"
  posts[:title] = gets.chomp
  puts "put a review"
  posts[:review] = gets.chomp

  line = "-----"

  puts "genre #{posts[:genre]}\n #{line}"
  puts "title #{posts[:title]}\n #{line}"
  puts "review #{posts[:review]}\n #{line}"

  a_posts << posts
  return a_posts

end

def read_reviews(a_posts)
  num = 0
  a_posts.each do |post|
    puts "[#{number}]: #{post[:title]}のレビュー"
    num += 1
  end

  puts "¥n put the number of review you wanna see"
  input = gets.to_i

  post = a_posts[input]

  line = "-----"
  puts "genre: #{posts[:genre]}\n #{line}"
  puts "title: #{posts[:title]}\n #{line}"
  puts "review: #{posts[:review]}\n #{line}"
end

def end_program
  exit
end

def exception
   puts "入力された値は無効です。"
end

posts = []


while true do
  puts "the number of review: #{posts.length}"
  puts "0: post_review"
  puts "1: read_reviews"
  puts "2: end_program"
  input = gets.to_i

  if input == 0 then
    posts = post_review(posts)
  elsif input == 1 then
    read_reviews(posts)
  elsif input == 2 then
    end_program
  else
    exception
  end
end
