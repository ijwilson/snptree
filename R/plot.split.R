

plot.split <-
  function (a, pie = FALSE, length = FALSE) 
{
  #require(ape)
  plot(a$tree, show.tip.label = FALSE)
  if (pie == TRUE) {
    nodelabels(pie = a$ccnode)
    tiplabels(pie = a$cctip)
  }  else {
      nodelabels(a$ccnode[, 2], adj = c(1.3, 1.2), frame = "n", 
                 cex = 0.6)
      nodelabels(a$ccnode[, 1], adj = c(1.3, -0.2), frame = "n", 
                 cex = 0.6)
      tiplabels(a$cctip[, 2], adj = c(1.3, 1.2), frame = "n", 
                cex = 0.6)
      tiplabels(a$cctip[, 1], adj = c(1.3, -0.2), frame = "n", 
                cex = 0.6)
    if (length==FALSE) {
      propcase <- length(a$cases)/a$n
      nn <- rowSums(a$ccnode)
      s <- (a$ccnode[, 1] - nn * propcase)/(sqrt(nn * propcase * 
                                                 (1 - propcase)))
      hl <- cut(s, c(-1e+100, -2, 2, 1e+100))
      cols <- c("green", "white", "red")[as.numeric(hl)]
      nodelabels(round(s, 2), adj = -0.2, cex = 0.6, font = 2, 
                 bg = cols)
      nn <- rowSums(a$cctip)
      s <- (a$cctip[, 1] - nn * propcase)/(sqrt(nn * propcase * 
                                                (1 - propcase)))
      hl <- cut(s, c(-1e+100, -2, 2, 1e+100))
      cols <- c("green", "white", "red")[as.numeric(hl)]
      tiplabels(round(s, 2), adj = -0.2, cex = 0.6, font = 2, 
                bg = cols)

    } else {
      l <- a$nodepos$right-a$nodepos$left
      nodelabels(l , adj = -0.2, cex = 0.6, font = 2)
      lt <- a$tippos$right-a$tippos$left
      tiplabels(lt , adj = -0.2, cex = 0.6, font = 2)
    }
  }
}
