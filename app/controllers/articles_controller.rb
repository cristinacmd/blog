class ArticlesController < ApplicationController
  # mostrar un form q nos permita crear articulo (vista: new.html.erb)
  def new
    @article = Article.new #crea un articulo vacio (con el @ esta disponible en la vista)
    @article.title = 'Demo' #aparece el control con la info que mando (util para editarlos)
  end

  # guardar los que hayamos recibido del form que mostró "new"
  def create
    # para crear un nuevo registro, al articulo le hay que pasar un hash y como vengo de un formulario 
    # el nombre del control es articletitle y se obtiene con lo puesto
    @article = Article.create(title: params[:article][:title],content: params[:article][:content])
    # como no quiero crear aun la vista lo renderizo en json
    render json: @article
  end
end
