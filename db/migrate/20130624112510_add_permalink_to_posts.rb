class AddPermalinkToPosts < ActiveRecord::Migration
  def up
    transaction do
      add_column :posts, :permalinks, :string

      Post.all.each_with_index do |p, i|
        title = p.title.gsub(/[^0-9a-z]/i, '')
        while !p.update_attributes(permalinks: title)
          title += i.to_s
        end
      end
    end
  end

  def down
    remove_column :posts, :permalinks
  end
end
