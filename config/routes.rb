Rails.application.routes.draw do

  get 'top' => 'homes#top'
  resources :lists

  #ここから下は2章〜7章まで記述したルーティング
  #get 'lists/new'
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #get '/top' => 'homes#top'
  #post 'lists' => 'lists#create'
  #get 'lists' => 'lists#index'
    #.../lists/1や.../lists/3に該当する
  #get 'lists/:id' => 'lists#show', as: 'list'
  #get 'lists/:id/edit' => 'lists#edit', as: 'edit_list'
  #patch 'lists/:id' => 'lists#update', as: 'update_list'
  #delete 'lists/:id' => 'lists#destroy', as: 'destroy_list'
end
