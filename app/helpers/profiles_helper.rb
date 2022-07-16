module ProfilesHelper

    def uniq_category_name(p)
            p.map do |post|
                post.categories
            end.flatten.uniq.map {|c| c.name}.join(", ")
    end

end
