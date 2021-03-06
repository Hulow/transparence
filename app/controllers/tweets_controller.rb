class TweetsController < ApplicationController
  before_action :set_tweet
  skip_before_action :authenticate_user!, only: [:index]

  def index

    if params[:name].present?
      @tweets = policy_scope(
        (Tweet
          .where(is_relevant?: nil, is_selected?: false)
          .or(Tweet.where(is_relevant?: true, is_selected?: false))
          .order(date: "DESC"))
        .search_by_politician(params[:name])
      )
    else
      @tweets = policy_scope(Tweet.where(is_relevant?: nil, is_selected?: false).or(Tweet.where(is_relevant?: true, is_selected?: false)).order(date: "DESC"))
    end
    @posts = policy_scope(Post.all)
    @politicians = policy_scope(Politician.all)
    @policy_areas = policy_scope(PolicyArea.all)
    @project_laws = policy_scope(ProjectLaw.all)
    @project_laws_tags = @project_laws.map {|project_law| { title: "#{project_law.name[0..20]}...", value: project_law.name, id: project_law.id} }.to_json
    @political_parties = policy_scope(PoliticalParty.all)
    @political_group = policy_scope(PoliticalGroup.all)
    @post = Post.new
    @match = Match.new

  end

  def edit
    authorize @tweet
  end

  def update
    if @tweet.update!(is_relevant?: params[:is_relevant?])
      if @tweet.is_relevant?
        Post.create(user: current_user, tweet: @tweet, name: @tweet.name)
      end
      redirect_to "#{tweets_path}#tweet#{@tweet.id}", notice: "tweet relevant"
    else
      render "edit"
    end
    authorize @tweet
  end

  private

  def match_params
    params.require(:match).permit(:policy_area_id, :project_law_id)
  end

  def tweet_params
    params.require(:tweet).permit(:is_relevant?)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id]) if params[:id]
  end



  def set_match
    @match = Match.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:tweet_id, :user_id)
  end

end

