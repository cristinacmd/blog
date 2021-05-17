class ArticlesController < ApplicationController

  before_action :find_article, except: [:new,:create,:index]
  before_action :authenticate_user!, only: [:new,:create,:edit,:update,:destroy]

  def index
    @articles = Article.all # array con todos los articulos
  end

  # mostrar un form q nos permita crear articulo (vista: new.html.erb)
  def new
    @article = Article.new #crea un articulo vacio (con el @ esta disponible en la vista)
    # @article.title = 'Demo' #aparece el control con la info que mando (util para editarlos)
  end

  # guardar los que hayamos recibido del form que mostró "new"
  def create
    # para crear un nuevo registro, al articulo le hay que pasar un hash y como vengo de un formulario 
    # el nombre del control es articletitle y se obtiene con lo puesto
    # @article = Article.create(title: params[:article][:title],content: params[:article][:content])
    @article = current_user.articles.create(title: params[:article][:title],content: params[:article][:content])
    # como no quiero crear aun la vista lo renderizo en json
    render json: @article
  end


  # buscar un articulo y mostrarlo
  def show
    # @article = Article.find(params[:id])
  end


  # editar un articulo
  def edit # desplegara un form parecido a new
    # @article = Article.find(params[:id]) 
    # puts "\n\n\n #{article.persisted?} \n\n\n" # para saber si esta en la bbdd
  end

  def update
    # @article = Article.find(params[:id]) 
    @article.update(title: params[:article][:title],content: params[:article][:content]) # metodo del obj (no es de clase como create)
    redirect_to @article # redireccionar al articulo
  end

  # eliminar articulo
  def destroy
    # @article = Article.find(params[:id]) 
    @article.destroy
    redirect_to root_path
  end


  def find_article
    @article = Article.find(params[:id])
  end
end
