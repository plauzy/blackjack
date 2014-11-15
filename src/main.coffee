# choose a table
# buy chips
# making a bet
# cashing in

#RULES
# want to have a hand value that is closer to 21 than the dealer, without going over 21
# dealer makes two passes around hte table to deal cards clockwise, 

#card values
# ace - 1 or 11
# 10, J, Q, K all worth 10
# cards 2-9 face value

# PLAYER DECISIONS
# surrender ... you lose half original bet
# hit/stand
# Double down... increase your bet up to double the original bet, 
#     but you can only choose one additional card. Advantageous with totals of 11
# Split - if you are dealt two of hte same cards, can split the hand, but you have 
# to place an equal bet with both hands

#Assumptions
#Dealer stands on 17


new AppView(model: new App()).$el.appendTo 'body'


