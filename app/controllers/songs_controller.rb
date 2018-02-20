class SongsController < ApplicationController
	def create
		@playlist = Playlist.find(params[:playlist_id])

		@song = Song.new(song_params)
		@song.playlist = @playlist #El dueño de ese comentario es ese @post.
		#Esto es lo mismo que .post_id = @post.id

		@song.save

		redirect_to @playlist
	end

	def destroy
		@playlist = Playlist.find(params[:playlist_id])
		@song = Song.find(params[:id])
		@song.destroy
		redirect_to @playlist, notice: 'Se ha eliminado con exito'
		
	end

	private

	def song_params
		params.require(:song).permit(:artist, :name)
	end
end
