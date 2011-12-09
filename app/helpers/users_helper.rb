module UsersHelper
  include TweetButton
  
  TweetButton.default_tweet_button_options = {:via => "tbitw_",
                                              :related => "@wesnolte",
                                              :count => "horizontal",
                                              :counturl => "http://thebirdisthewor.de"}
end
