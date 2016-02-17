class TicTacToeBoard {
  val leftToRightIndices = List(0, 3, 9)
  val rightToLeftIndices = List(2, 4, 6)

  val board = Array.fill(3, 3) {
    Symbol.BLANK
  }

  def hasWin(symbol: Symbol): Boolean = {
    hasColumnWin(symbol) ||
      hasRowWin(symbol) ||
      hasDiagonalWin(symbol)
  }

  def hasDiagonalWin(symbol: Symbol): Boolean = {
    hasRightDiagonalWin(symbol) ||
      hasLeftDiagonalWin(symbol)
  }

  def hasRightDiagonalWin(symbol: Symbol): Boolean = {
    for (i <- 0 to 2) {
      if (board(i)((board.length - 1) - i) != symbol)
        return false
    }
    return true
  }

  def hasLeftDiagonalWin(symbol: Symbol): Boolean = {
    for (i <- 0 to 2) {
      if (board(i)(i) != symbol)
        return false
    }
    return true
  }

  def hasRowWin(symbol: Symbol): Boolean = {
    board.exists(r => r.forall(_ == symbol))
  }

  def hasColumnWin(symbol: Symbol): Boolean = {
    board.transpose.exists(r => r.forall(_ == symbol))
  }

  def hasBlankSpace(): Boolean = {
    board.exists(_.contains(Symbol.BLANK))
  }

  def printBoard(): Unit = {
    board.foreach { row =>
      println(row.mkString("[", ", ", "]"))
    }
  }
}
