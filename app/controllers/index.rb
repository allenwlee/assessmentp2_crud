get '/' do
  @notes = Note.all
  erb :index
end

get '/note/create' do
  erb :create_note
end

post '/note/create' do
  @note = Note.create(params[:note])
  erb :note
end

get '/note/:note_id' do
  @note = Note.find(params[:note_id])
  erb :note
end


get '/note/:note_id/edit' do
  @note = Note.find(params[:note_id])
  erb :edit_note
end

put '/note/:note_id/edit' do
  Note.find(params[:note_id]).update_attributes(params[:note])
  redirect '/'
end

get '/note/:note_id/delete' do
  @note = Note.find(params[:note_id])
  confirm_delete(@note)

end

delete '/note/:note_id/delete/confirm' do
  @note = Note.find(params[:note_id])
  @note.delete
  redirect '/'
end
