class AuthorsController < ApplicationController
  before_filter :authenticate_author! , :only => [:new, :create]
  before_filter :is_owner , :only => [:edit, :update, :destroy]

  # GET /authors
  # GET /authors.xml
  def index
    @authors = Author.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @authors }
    end
  end

  # GET /authors/1
  # GET /authors/1.xml
  def show
    @author = Author.find(params[:id])
  # @commit_list = @author.commits

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @author }
    end
  end

#in show_html.erb
  #<td><%= link_to 'Show commits of author', author_commits_path(author) %>

#My method
# /authors/commits/1
 def commits
    @author = Author.find(params[:id])
    @commit_list = @author.commits
    respond_to do |format|
      format.html #commits.html.erb
      #commits_list.html.erb
    end
end

  # GET /authors/new
  # GET /authors/new.xml
  def new
    @author = Author.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @author }
    end
  end

  # GET /authors/1/edit
  def edit
    @author = Author.find(params[:id])
  end

  # POST /authors
  # POST /authors.xml
  def create
    @author = Author.new(params[:author])

    respond_to do |format|
      if @author.save
        format.html { redirect_to(@author, :notice => 'Author was successfully created.') }
        format.xml  { render :xml => @author, :status => :created, :location => @author }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @author.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /authors/1
  # PUT /authors/1.xml
  def update
    @author = Author.find(params[:id])

    respond_to do |format|
      if @author.update_attributes(params[:author])
        format.html { redirect_to(@author, :notice => 'Author was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @author.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /authors/1
  # DELETE /authors/1.xml
  def destroy
    @author = Author.find(params[:id])
    @author.destroy

    respond_to do |format|
      format.html { redirect_to(authors_url) }
      format.xml  { head :ok }
    end
  end
  
  def is_owner
     if current_author != Author.find(params[:id])
        redirect_to(root_path, :notice => 'Invallid request.')       
     end
  end
end
