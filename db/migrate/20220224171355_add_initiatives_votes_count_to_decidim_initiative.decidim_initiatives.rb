# frozen_string_literal: true
# This migration comes from decidim_initiatives (originally 20220224085818)

class AddInitiativesVotesCountToDecidimInitiative < ActiveRecord::Migration[5.2]
  def change
    add_column :decidim_initiatives, :initiatives_votes_count, :integer

    Decidim::Initiative.find_each do |initiative|
      Decidim::Initiative.reset_counters(initiative.id, :votes)
    end
  end
end
