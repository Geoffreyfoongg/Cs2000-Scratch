use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

data Payment:
  | cash
  | card(card-number :: String, expiry :: String)
  | venmo
  | checks(account-num :: String, routing :: String)
end

fun payment-to-str(p :: Payment) -> String:
  doc:"describes the payment"
  cases (Payment) p:
    | cash => "cash"
    | card(cn, exp) => "card " + cn
    | venmo => "venmo"
    | checks(an, r) => "check with number " + an
  end
 
where:
  payment-to-str(cash) is "cash"
  payment-to-str(card("213487193274", "11/29")) is "card 213487193274"
end