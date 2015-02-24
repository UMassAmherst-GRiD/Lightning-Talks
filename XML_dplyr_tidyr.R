library(XML)

site <- "http://www.basketball-reference.com/players/a/antetgi01/gamelog/2015/"

tables <- readHTMLTable(site)

giannis <- tables$pgl_basic
names(giannis)[which(names(giannis)=="")] <- paste0("bla", seq(1, length(which(names(giannis)==""))))

library(dplyr)
giannis <- as.tbl(giannis)
giannis

select(giannis, G, contains("%"))

giannis <- select(giannis, G, Date, Age, Opp, PTS)
giannis
giannis <- rename(giannis, Points = PTS)
summary(giannis)
giannis <- filter(giannis, G != "G")
summary(giannis)
giannis <- mutate(giannis, G = as.numeric(as.character(G)),
                  Date = as.Date(Date),
                  Points = as.numeric(as.character(Points)))
summary(giannis)
arrange(giannis, desc(Points))
sample_frac(giannis, 0.1, replace = FALSE)
sample_n(giannis, 10, replace = FALSE)
slice(giannis, 19:24)
top_n(giannis, 5, Points)
mutate(giannis, lead_points = lead(Points))
mutate(giannis, lag_points = lag(Points))
mutate(giannis, rank_points = dense_rank(desc(Points)))
mutate(giannis, rank_points = percent_rank(Points))
mutate(giannis, quartile = ntile(Points, 4))
mutate(giannis, points_per_game = cummean(Points))
mutate(giannis, total_points = cumsum(Points))
mutate(giannis, max_points = cummax(Points))
summarise(giannis, total_games = n(), points_per_game = mean(Points))
giannis <- group_by(giannis, Opp)
summarise(giannis, total_games = n(), points_per_game = mean(Points))
giannis <- ungroup(giannis)

g2 <- tables$pgl_basic
names(g2)[which(names(g2)=="")] <- paste0("bla", seq(1, length(which(names(g2)==""))))

g2 %>% 
        as.tbl() %>%
        select(G, Date, Age, Opp, PTS) %>%
        rename(Points = PTS) %>%
        filter(G != "G") %>%
        mutate(G = as.numeric(as.character(G)),
               Date = as.Date(Date),
               Points = as.numeric(as.character(Points))) %>%
        sample_frac(0.5, replace = FALSE) %>%
        group_by(Opp) %>%
        summarise(total_games = n(), points_per_game = mean(Points)) %>%
        arrange(desc(points_per_game))
        
site2 <- "http://www.basketball-reference.com/players/k/koufoko01/gamelog/2015/"
tables2 <- readHTMLTable(site2)
kosta <- tables2$pgl_basic
names(kosta)[which(names(kosta)=="")] <- paste0("bla", seq(1, length(which(names(kosta)==""))))

bind_rows(g2, kosta)
left_join(select(g2, Date, PTS), select(kosta, Date, kosta_PTS = PTS))
right_join(select(g2, Date, PTS), select(kosta, Date, kosta_PTS = PTS))
full_join(select(g2, Date, PTS), select(kosta, Date, kosta_PTS = PTS))
inner_join(select(g2, Date, PTS), select(kosta, Date, kosta_PTS = PTS))

library(tidyr)
giannis <- giannis

g3 <- spread(select(giannis, Date, Opp, Points), Date, Points)

gather(g3, "Date", "Points", -1, na.rm=TRUE)
