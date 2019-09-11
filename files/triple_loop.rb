# -*- coding: utf-8 -*-

m = 20988936657440586486151264256610222593863921
a = [20854741892953721313579450578412110250365764, 18680817802620471097741715254727912433116119, 6940806529732886823501244513145497481453282, 2867691954961114213525714459161687907853756, 10506096932732460220933844464593096212832743, 11886301775769248494192465948774166438103820, 2955671471753993505641921656109974899004833, 18084017212135061768267590190883837116164755, 11264519305196511475439088629965085272566740, 14049594801150429470609017143454509976379563, 18045652255248609272797904352185309464325008, 17711746433382383096172306706277744059338596, 14834902197252867253135308889105249615528571, 2503878433416501615362384643227733325324072, 1825492463781365862219509586566930627833200, 6414147930749259186828922841995265025000286]
b = [20242533674995851388916550430817556652144761, 17502538788421563805183983632909482554489617, 14714724621880848278824948105836909582454155, 2929312900047153647136570698883829315985771, 4405008558519366806515601459788067615615261, 8051064219618408760093004809019202742553617, 19578165392705183456962494940175485132198066, 12238084565719475487769270687337650796226881, 2868638886907752565136030100487748461345666, 9105297368066925852217457326033345342394204, 8325951035061220383896370020680742024804181, 3245885587266947438166457744621520112234683, 18794457538552281406756982277185699641297747, 18312358470491859373832076755398557441004683, 12774749986137971716348099918363467658216854, 16094280680927402640211997426473155462541614]
c = [862, 685, 688, 1796, 1269, 284, 758, 22, 767, 34, 1716, 740, 1620, 269, 517, 367]

for i in 0...16
  c[i].times do
    for k in 1...m
      if a[i] == k * b[i] % m
        a[i] = k
        break
      end
    end
  end
end

puts "n5b2019summer{#{a.map{|e| (e % 256).chr}.join}}"
