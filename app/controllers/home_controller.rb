class HomeController < ApplicationController
  skip_before_action :authenticate

  def show
    if logged_in?
      @active_word_chain_walk = current_user.word_chain_walks.active
                                            .includes(word_chain_walk_steps: { image_attachment: :blob })
                                            .first
      @finished_word_chain_walks = current_user.word_chain_walks.finished
                                                .includes(word_chain_walk_steps: { image_attachment: :blob })
                                                .order(id: :desc)
                                                .take(3)
    end
  end

  def terms;end

  def privacy;end

  def how_to_play;end
end
