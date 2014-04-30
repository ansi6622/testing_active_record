class ChangeActiveToBeADate < ActiveRecord::Migration
  def change
    add_column :urls, :inactivated_on, :date
    # in the real world, you would want to somehow
    # make sure that the data in the active column
    # was transferred into the new inactivated_on
    # so you don't lose stuff.
    remove_column :urls, :active

  end
end
