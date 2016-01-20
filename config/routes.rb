Api::Application.routes.draw do
  namespace :api, constraints: { subdomain: 'api' }, path: '/' do
    get '/status', to: 'heartbeat#status'

    resources :posts, except: [:new, :edit] do
      member do
        put :like
      end
      resources :comments, except: [:new, :edit] do
        member do
          put :like
        end
      end
    end

    root to: 'heartbeat#status'
  end
end
