# -*- coding: utf-8 -*-
class Mastermind
  attr_accessor :que    #問題
  attr_accessor :ans    #答え
  attr_accessor :flag1  #位置・数字が一致したカウンター
  attr_accessor :flag2  #数字のみ一致したカウンター
  attr_accessor :kai    #挑戦回数カウンター
  MASK = "ABCD"        #マスク用定数

  def initialize(max=10000)
    @que = rand(max).to_s
    if @que.to_i < 1000
      @que = "0" * (4 - @que.length) + @que
    end
    @ans = "0000"
    @flag1 = 0
    @flag2 = 0
    @kai = 1
  end

end

print "*----------------------------------------------------------------------------*\n"
print "　マスターマインド　　　　　by ぱぱのすけ\n"
print "　コンピューターがランダムに選択した４ケタの数字を当てるゲームです！\n"
print "　<<ルール>>\n"
print "　・0000～9999の数をコンピュータがランダムに選択します\n"
print "　・人間の答えに対してコンピュータがヒントをくれます\n"
print "　・少ない回数で正解を当てましょう\n"
print "*----------------------------------------------------------------------------*\n"

d = Mastermind.new
##確認表示
#===>DEBUG
#print "問題=",d.que,"\n"
#print "答え=",d.ans,"\n"
#<====DEBUG
#
while true
  while true
    print "*----------------------------------------------------------------------------*\n"
    print "　★　#{d.kai}回目のチャレンジです　★\n"
    print "　♪４ケタの数字を入力してください　♪\n"
    print "*----------------------------------------------------------------------------*\n"
    print "==> "
    num = gets.chomp!
    if num.length == 4
      d.ans = num
      break
    else
      print "*----------------------------------------------------------------------------*\n"
      print "　数字が正しくありません！！\n"
      print "*----------------------------------------------------------------------------*\n"
    end
#
  end
#判定
  if d.que == d.ans
    print "*----------------------------------------------------------------------------*\n"
    print "　♪おめでとう♪　正解です！！\n"
    print "　答え＝#{d.ans}\n"
    print "　回数＝#{d.kai}\n"
    print "*----------------------------------------------------------------------------*\n"
    break
  else
    ary1 = d.que.split("")
    ary2 = d.ans.split("")
#
##判定ルーチン
    d.flag1 = 0
    d.flag2 = 0
#
##判定①　位置も数字も正解
    for i in 0..3
      if ary1[i] == ary2[i]
        d.flag1 += 1
        ary1[i] = Mastermind::MASK[i] #この後一致が発生しないようにマスク
        ary2[i] = Mastermind::MASK[i] #この後一致が発生しないようにマスク
      end
    end
#
##判定②　位置のみ正解
    for i in 0..3
      for j in 0..3
          if i == j
          else
          if ary1[i] == ary2[j]
            ary1[i] = Mastermind::MASK[i] #この後一致が発生しないようにマスク
            ary2[j] = Mastermind::MASK[j] #この後一致が発生しないようにマスク
            d.flag2 += 1
          end
        end
      end
#===>DEBUG
#     print "1=",ary1,"\n","2=",ary2,"\n"
#<====DEBUG
    end
    print "*----------------------------------------------------------------------------*\n"
    print "　残念～↓↓　ヒントを出すから次は頑張って！！\n"
    print "　<<ヒント>>\n"
    print "★位置・数字が一致=",d.flag1,"\n","☆数字のみ一致　　=",d.flag2,"\n"
#
    d.kai +=1
#
    break if d.flag1 == 4
  end
end
#確認表示
#===>DEBUG
#print "問題=",d.que,"\n"
#print "答え=",d.ans,"\n"
#<====DEBUG
