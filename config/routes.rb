Rails.application.routes.draw do
  get '/rconsole' => 'rconsole#dump'
end