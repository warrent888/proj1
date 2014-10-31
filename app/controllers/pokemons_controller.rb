class PokemonsController < ApplicationController
  def capture
    @pokemon = Pokemon.find(params[:id])
    @pokemon.update_attributes(:trainer_id => current_trainer.id)
    redirect_to root_path
  end

  def damage
  	@pokemon = Pokemon.find(params[:id])
  	@pokemon.update_attributes(:health => @pokemon.health - 10)
  	if @pokemon.health <= 0
  		@pokemon.destroy
  	end
  	redirect_to trainer_path(current_trainer.id)
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)
    @pokemon.health = 100
    @pokemon.level = 1
    @pokemon.trainer_id = current_trainer.id
    if @pokemon.save == true
      redirect_to trainer_path(current_trainer.id)
    else
      redirect_to pokemons_new_path, :flash => {:error => @pokemon.errors.full_messages.to_sentence}
      end
  end

  def new
  end

  def pokemon_params
    params.require(:pokemon).permit(:name)
  end
end


#To flash the appropriate error, use the line flash[:error] = 
#@pokemon.errors.full_messages.to_sentence. This works because in 
#views/layouts/application.html.erb, it is rendering something at the very 
#end. Take a look at that file and see what it is doing. If you don't 
#already know what application.html.erb does, you should Google it and 
#understand its function.