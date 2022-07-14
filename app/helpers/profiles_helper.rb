module ProfilesHelper

    def uniq_category_name(p)
            p.categories.each do |c|
                @liked_games = []
                @liked_games << c.name
            end
        @liked_games
    end

end
