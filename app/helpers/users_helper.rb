module UsersHelper
  include TweetButton
  
  TweetButton.default_tweet_button_options = {:via => "http://thebirdisthewor.de",
                                              :related => "@wesnolte",
                                              :count => "horizontal"}
end
