require "kittikrb/cursor"

cursor = KittikRb::Cursor.create.reset_tty!

TITLE = "This example shows how fast builds difference between two frames"
EXAMPLE_STRING = "ABCDEFGHIJKLMNOP"

x, y = 0, 0
height, width = $stdout.winsize

loop do
  cursor.move_to(0, 0).background(:white).foreground(:black).write(TITLE)
  cursor.move_to(x, y).background(:yellow).write(EXAMPLE_STRING)
  cursor.move_to(x * 2, y).write(EXAMPLE_STRING)
  cursor.move_to(x * 3, y).write(EXAMPLE_STRING)
  cursor.flush.erase_screen

  x = x > width ? 0 : x + 1
  y = y > height ? 0 : y + 1

  sleep 0.001
end
