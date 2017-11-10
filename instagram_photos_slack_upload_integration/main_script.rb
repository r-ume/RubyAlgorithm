require './api_handler.rb'

ApiHandler.calls_image_api




# $(function() {
#   var accessToken = 'アクセストークンをここに入れる';
#   var username = 'nanjolno'; // ユーザーID
#   $.ajax({
#              url: 'https://api.instagram.com/v1/users/search?q=' + username + '&access_token=' + accessToken,
#              dataType: 'jsonp',
#              success: function(data) {
#                for (var i = 0; i < data['data'].length; i++) {
#                    // 近いusernameが複数出るので、一致するものを取得
#                if(data['data'][i]['username'] == username) {
#                    console.log(data['data'][0]['id']); // 5001435
#                }
#                };
#                }
#                });
#                });
