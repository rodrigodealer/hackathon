Atlas::Application.routes.draw do
  devise_for :users
  
  resources :users
  
  resources :chamados do
    member do
      get :adicionar_tramite
    end
  end
  
  resources :sistemas
  
  resources :clientes do  
    resources :sistemas, :only => [:por_cliente] do
      collection do
        get :por_cliente
      end
      
      member do
        get :contrato
      end
    end
    
    resources :contatos, :only => [:por_cliente] do
      collection do
        get :por_cliente
      end
    end
  end
  
  resources :roles
  
  match '/roles/:id/vincula_feature' => "roles#vincula_feature", :as => :vincula_feature, :via => :post

  root :to => "users#index"

end
