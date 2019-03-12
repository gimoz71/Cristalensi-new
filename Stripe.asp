<% Response.Expires = 0 %>
<% Response.Buffer = true %>

<!--#include file="Log.asp"-->
<!--#include file="cStripeFunctions.asp"-->
<%
Dim number,cvc,month,year,orderId
number = Request.Form("card-number")
cvc = Request.Form("card-cvc")
month = Request.Form("card-month")
year = Request.Form("card-year")
orderId = Request.Form("orderId")
totale_da_pagare = Request.Form("totale_da_pagare")

'aspLog("number=" & number)
'aspLog("cvc=" & cvc)
'aspLog("month=" & month)
'aspLog("year=" & year)
aspLog("orderId=" & orderId)

Set stripe = New cStripeFunctions

stripe.ApiKey = "sk_live_TI73VpEZ4ITzmQFZkNDZs8nT"

'Response.Write "<pre>Ordine OK - OrderId: " & responseCharge.data("metadata")("orderId") & "</pre>"

Dim result

result = stripe.createToken(month, year, cvc, number)

aspLog(result)

if (result<>"KO") then
	'Wscript.Echo("passo dal chargeCardWithToken")
	result = stripe.chargeCardWithToken(result, totale_da_pagare, "eur", orderId)
End If

if (result<>"KO") then
	'response.Write "OK " & result
	session("ordine_shop")=result
	response.redirect("/pagamento_cc_ok.asp")
else
	'response.Write result & " " & orderId
	session("ordine_shop")=orderId
	response.redirect("/pagamento_cc_ko.asp")
End If


set stripe=nothing
set responseCharge=nothing

%>
