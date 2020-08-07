Rails.application.routes.draw do
  root "events#index"
  get "/events/selectEvent" => "events#selectEvent" # if this line is after resources events, it will think selectEvent is an id
  get "/events/qrCode/:id" => "events#qrCode", as: "event_qrCode"
  get "/rewards/testEmail" => "rewards#testEmail"
  get "/rewards/:id/editRedemption" => "rewards#editRedemption", as: "edit_redemption"
  resources :users
  resources :announcements
  resources :rewards
  resources :events
  resources :redemptions
 
  get "/cheese" => "events#getAllEvents"
  get "/userFromToken" => "users#user_info"
  get "/userRewards" => "users#getRewards"
  patch "/usersMobile/:netid" => "users#updateFromMobile"
  patch "/usersMobile" => "users#updateFromMobile"
  patch "/redeem/:id" => "rewards#redeemReward"
  get "/users/showImage/:id" => "users#showImage", as: :user_showImage
  post "/attend/:id" => "users#eventScan"
  get "/confirmReward/:qrcode" => "rewards#confirmReward"
  get "/uniqueUsername" => "users#uniqueUsername"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # Render Web App Interface

  # get "/events" => "events#index"
  # get "/rewards" => "rewards#index"
  # get "/announcements" => "announcements#index"
  # get "/users" => "users#index"

end
