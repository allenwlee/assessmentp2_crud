helpers do
  def confirm_delete(note)
    @note = note
    erb :confirmation
  end
end
