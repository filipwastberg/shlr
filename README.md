shlr
----

This is an API client to retrieve data from the Swedish Hockey League
Open API.

You can install the package with `devtools`.

    devtools::install_github("filipwastberg/shlr")

To be able to use it you need to apply for a client id and client secret
from
<a href="http://doc.openapi.shl.se/" class="uri">http://doc.openapi.shl.se/</a>.

When you have these you can save them as environment variables:

    Sys.setenv('SHL_CLIENT_ID' = "xxxxxx")
    Sys.setenv('SHL_CLIENT_SECRET' = "xxxxxxxx")

If you need to repeat this procedure during start up then save them to
your `.Renviron` usually done by `file.edit("~/.Renviron")`

Using the package
-----------------

For example you can get the top 10 players of a team (or the whole
league) using `get_top10_player_stats()`.

    library(shlr)

    ## Loading required package: httr

    ## Loading required package: magrittr

    ## Loading required package: stringr

    get_top10_player_stats(season = "2017", team_id = "DIF")

    ## # A tibble: 10 x 23
    ##    games_played name  height weight  rank nationality number player_id
    ##           <int> <chr>  <int>  <int> <int> <chr>        <int>     <int>
    ##  1           48 Dick…    191     96    13 SWE             31         0
    ##  2           52 Jona…    181     82    27 SWE             71         0
    ##  3           44 Linu…    180     89    35 SWE             33         0
    ##  4           52 Nicl…    179     94    91 SWE             10         0
    ##  5           27 Andr…    190     91    96 SWE             21         0
    ##  6           39 Marc…    181     87    99 SWE             70         0
    ##  7           41 Gust…    182     86   112 SWE             80         0
    ##  8           49 Bobb…    181     80   116 SWE             53         0
    ##  9           40 Jako…    184     89   128 SWE             15         0
    ## 10           42 Axel…    182     73   157 SWE             91         0
    ## # … with 15 more variables: position <chr>, team <chr>, toi <int>,
    ## #   toi_gp <chr>, assists <int>, bk_s <int>, goals <int>, gwg <int>,
    ## #   hits <int>, minus <int>, plus <int>, pim <int>, ppg <int>, sog <int>,
    ## #   tp <int>

You can aquire the same information but for only goalies with
`get_top10_player_stats()`.

You can get all the games for a season with `get_games()`.

    get_games(season = "2018")

    ## # A tibble: 364 x 17
    ##    away_team_code away_team_result game_center game_id game_type game_uuid
    ##    <chr>                     <int> <lgl>         <int> <chr>     <chr>    
    ##  1 BIF                           0 FALSE          8597 Regular … qUv-ZF3X…
    ##  2 LHC                           0 FALSE          8595 Regular … qUv-ZF3X…
    ##  3 OHK                           0 FALSE          8596 Regular … qUv-ZF3A…
    ##  4 DIF                           0 FALSE          8594 Regular … qUv-ZF2W…
    ##  5 TIK                           0 FALSE          8592 Regular … qUv-ZF2D…
    ##  6 SAIK                          0 FALSE          8593 Regular … qUv-ZF24…
    ##  7 VLH                           0 FALSE          8591 Regular … qUv-ZF1o…
    ##  8 HV71                          0 FALSE          8589 Regular … qUv-ZF1A…
    ##  9 RBK                           0 FALSE          8590 Regular … qUv-ZF1A…
    ## 10 LHF                           0 FALSE          8587 Regular … qUv-ZF0O…
    ## # … with 354 more rows, and 11 more variables:
    ## #   highlights_coverage_enabled <lgl>, home_team_code <chr>,
    ## #   home_team_result <int>, live_coverage_enabled <lgl>, overtime <lgl>,
    ## #   penalty_shots <lgl>, played <lgl>, season <chr>, series <chr>,
    ## #   date <date>, start_time <S3: times>

Active teams and meta information about the teams:

    get_teams()

    ## # A tibble: 14 x 6
    ##    team_code chairman  president  finals        founded contact_adress     
    ##    <chr>     <chr>     <chr>      <chr>         <chr>   <chr>              
    ##  1 BIF       Jürgen L… Michael C… 11 st (1966,… 1912    "Brynäs IF \r\nGav…
    ##  2 DIF       Kaarel L… Jenny Sil… 25 st (1923,… 1891    "Djurgården Hockey…
    ##  3 FHC       Mats Gra… Christian… 6 st (1980, … 1944    "Frölunda HC\r\nFr…
    ##  4 FBK       Sture Em… Stefan La… 20 st (1976,… 1932    "Färjestad BK\r\nB…
    ##  5 HV71      Sten-Åke… Agne Beng… 5 st (1995, … 1971    "HV71\r\nKinnarps …
    ##  6 LHC       Per Magn… Anders Mä… 2 st (2007, … 1976    "Stångebro Ishall\…
    ##  7 LHF       Anders O… Stefan En… 4 st (1993, … 1977    "Luleå Hockey\r\nO…
    ##  8 MIF       Mats Lar… Patrik Sy… 2 st (1992, … 1972    "Malmö Redhawks\r\…
    ##  9 MIK       Helene K… Peter Her… 1 st (1950)   1935    "Hantverkaregatan …
    ## 10 OHK       Ulf Gejh… Pontus Gu… 0 st          1990    "Orvar Bergmarks P…
    ## 11 RBK       Håkan Er… Marcus Th… 0 st          1932    "Rögle BK\r\nLinda…
    ## 12 SAIK      Pär Nord… Pea Israe… 8 st (1978, … 1921    "Skellefteå AIK\r\…
    ## 13 TIK       Lars Bac… Jörgen Wa… 0 st          1928    "Timrå IK\r\nNHK A…
    ## 14 VLH       Michael … Stefan Hö… 2 st (2015, … 1997    "Storgatan 86\r\n3…

The current standing in SHL:

    get_team_standing(season = "2018")

    ## # A tibble: 14 x 19
    ##       gp  rank team_code  diff     g    ga non_reg_l non_reg_non_w
    ##    <int> <int> <chr>     <int> <int> <int>     <int>         <int>
    ##  1    39     1 LHF          21   105    84         4             4
    ##  2    39     2 FBK          24   117    93         4             4
    ##  3    39     3 HV71         15   101    86         5             5
    ##  4    39     4 DIF          28   117    89         6             6
    ##  5    39     5 FHC          -3    99   102         4             4
    ##  6    39     6 SKE          11   107    96         6             6
    ##  7    39     7 LHC           5   107   102         5             5
    ##  8    38     8 MIF           4    94    90         3             3
    ##  9    39     9 VLH           0    90    90         7             7
    ## 10    39    10 BIF          -8    89    97        10            10
    ## 11    39    11 RBK          -9    93   102         6             6
    ## 12    39    12 ÖRE         -20    97   117         6             6
    ## 13    39    13 MIK         -30    90   120         2             2
    ## 14    38    14 TIK         -38    91   129         2             2
    ## # … with 11 more variables: non_reg_t <int>, non_reg_w <int>, otl <int>,
    ## #   ott <int>, otw <int>, points <int>, reg_l <int>, reg_t <int>,
    ## #   reg_w <int>, sol <int>, sow <int>
