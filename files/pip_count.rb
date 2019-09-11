# frozen_string_literal: true

pos = []

eg = <<~POSITION
  Calculate pip count.
  X:bottom player  O:top player

  e.g.:
  +13-14-15-16-17-18------19-20-21-22-23-24-+
  | X           O    |   | O              X |
  | X           O    |   | O              X |
  | X           O    |   | O                |
  | X                |   | O                |
  | X                |   | O                |
  |                  |BAR|                  |
  | O                |   |                  |
  | O                |   | X                |
  | O                |   | X                |
  | O           X    |   | X  X           O |
  | O           X    |   | X  X           O |
  +12-11-10--9--8--7-------6--5--4--3--2--1-+
  X's pip count: 163
  O's pip count: 167
POSITION

pos[0] = <<~POSITION
  +13-14-15-16-17-18------19-20-21-22-23-24-+
  | X           O    |   | O           X  X |
  | X           O    |   | O                |
  | X           O    |   | O                |
  | X                |   | O                |
  |                  |   | O                |
  |                  |BAR|                  |
  | O                |   |                  |
  | O                |   | X                |
  | O           X    |   | X                |
  | O           X    |   | X  X             |
  | O  O        X    |   | X  X           O |
  +12-11-10--9--8--7-------6--5--4--3--2--1-+
POSITION

pos[1] = <<~POSITION
  +13-14-15-16-17-18------19-20-21-22-23-24-+
  |                  |   | O     O  O  O  O |
  |                  |   |       O  O  O  O |
  |                  |   |       O  O  O  O |
  |                  |   |                O |
  |                  |   |                  |
  |                  |BAR|                  |
  |                  |   |                  |
  |                  |   |                  |
  |                X |   | X  X             |
  |                X |   | X  X  X  X  X    |
  |                X |   | X  X  X  X  X  O |
  +12-11-10--9--8--7-------6--5--4--3--2--1-+
POSITION

pos[2] = <<~POSITION
  +13-14-15-16-17-18------19-20-21-22-23-24-+
  |       X     O  O |   | O  O  X  O  X  O |
  |             O  O |   | O  O  X  O  X  O |
  |                  |   |    O           O |
  |                  |   |                O |
  |                  |   |                  |
  |                  |BAR|                  |
  |                  |   |                  |
  |                  |   |                  |
  |                  |   | X                |
  |                  |   | X  X  X          |
  |             X  X |   | X  X  X  X       |
  +12-11-10--9--8--7-------6--5--4--3--2--1-+
POSITION

pos[3] = <<~POSITION
  +13-14-15-16-17-18------19-20-21-22-23-24-+
  | X                |   | O  O  O  O  O  X |
  | X                |   | O  O  O  O  O  X |
  | X                |   | O  O           X |
  |                  |   |                X |
  |                  |   |                X |
  |                  |BAR|                  |
  |                  |   |                  |
  |                  |   |                  |
  |             X    |   | X                |
  |             X    |   | X                |
  |          X  X    |   | X                |
  +12-11-10--9--8--7-------6--5--4--3--2--1-+
POSITION

pos[4] = <<~POSITION
  +13-14-15-16-17-18------19-20-21-22-23-24-+
  | X     O  O  O  O |   | O        X     X |
  | X        O  O  O |   | O                |
  |                  |   | O                |
  |                  |   |                  |
  |                  |   |                  |
  |                  |BAR|                  |
  |                  |   |                  |
  |                  |   |                  |
  | O                |   | X                |
  | O           X  X |   | X  X  X  O       |
  | O           X  X |   | X  X  X  O       |
  +12-11-10--9--8--7-------6--5--4--3--2--1-+
POSITION

pos[5] = <<~POSITION
  +13-14-15-16-17-18------19-20-21-22-23-24-+
  |                  |   | O  O  O  O     O |
  |                  |   | O  O     O       |
  |                  |   | O  O             |
  |                  |   |    O             |
  |                  |   |    O             |
  |                  |BAR|                  |
  |                  |   | X                |
  |                  |   | X                |
  |                  |   | X  X             |
  |                  |   | X  X        X    |
  |                  |   | X  X     X  X    |
  +12-11-10--9--8--7-------6--5--4--3--2--1-+
POSITION

pos[6] = <<~POSITION
  +13-14-15-16-17-18------19-20-21-22-23-24-+
  | X                |   | O  O  O  O  O    |
  | X                |   | O  O  O  O  O    |
  |                  |   |       O     O    |
  |                  |   |             O    |
  |                  |   |                  |
  |                  |BAR|                  |
  |                  |   |                  |
  |                  |   | X                |
  |                  |   | X     X          |
  |                O |   | X  X  X  X  X    |
  |                O |   | X  X  X  X  X    |
  +12-11-10--9--8--7-------6--5--4--3--2--1-+
POSITION

pos[7] = <<~POSITION
  +13-14-15-16-17-18------19-20-21-22-23-24-+
  |                  |   |       X  X  O    |
  |                  |   |             O    |
  |                  |   |             O    |
  |                  |   |                  |
  |                  |   |                  |
  |                  |BAR|                  |
  |                  | O |                  |
  |                  | O |                  |
  |                  |   |       X          |
  |                  |   | X  X  X  X  X  X |
  |                  |   | X  X  X  X  X  X |
  +12-11-10--9--8--7-------6--5--4--3--2--1-+
POSITION

pos[8] = <<~POSITION
  +13-14-15-16-17-18------19-20-21-22-23-24-+
  | O  O  O  O  O  O |   | O  O  O  O  O  O |
  |                  |   |                  |
  |                  |   |                  |
  |                  |   |                  |
  |                  |   |                  |
  |                  |BAR|                  |
  |                  |   |                  |
  |                  |   |                  |
  |                  |   |                  |
  |                  |   |                  |
  | X  X  X  X  X  X |   | X  X  X  X  X  X |
  +12-11-10--9--8--7-------6--5--4--3--2--1-+
POSITION

pos[9] = <<~POSITION
  +13-14-15-16-17-18------19-20-21-22-23-24-+
  | X  X  X  X  X  X |   | X  X  X  X  X  X |
  |                  |   |                  |
  |                  | X |                  |
  |                  | X |                  |
  |                  | X |                  |
  |                  |BAR|                  |
  |                  | O |                  |
  |                  | O |                  |
  |                  | O |                  |
  |                  |   |                  |
  | O  O  O  O  O  O |   | O  O  O  O  O  O |
  +12-11-10--9--8--7-------6--5--4--3--2--1-+
POSITION

puts eg
flag = ''
(0...10).each do |i|
  puts "Q #{i + 1} / 10:"
  puts pos[i]
  puts "input X's pip count:"
  flag += format('%03d', gets.to_i(10))
  puts "input O's pip count:"
  flag += format('%03d', gets.to_i(10))
end

puts "flag: n5b2019summer{#{flag}}"
