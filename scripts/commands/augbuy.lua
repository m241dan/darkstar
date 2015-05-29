cmdprops =
{
    permission = 0,
    parameters = "si"
};

function onTrigger(player, arg, amount)
   if( arg == nil ) then
      player:PrintToPlayer( "Buy AugBuys using what currency and for how much(@augbuy <currency> <amount>)?:", 0xE );
      player:PrintToPlayer( " - Currencies: tabs(1000) ", 0xE );
      return;
   end

   if( amount == nil or amount < 1 ) then
      player:PrintToPlayer( "AugBuy Error: None or invalid amount entered.", 0xE );
      return;
   end

   if( arg == "tabs" ) then
      currency = "valor_point";
      exchange = 1000; 
   else
      player:PrintToPlayer( "AugBuy Error: invalid currency entered.", 0xE );
      return;
   end

   total = exchange * amount;
   if( total > player:getCurrency( currency ) ) then
      player:PrintToPlayer( "You don't have enough currency to buy that many AugBuys.", 0xE );
      return;
   end

   player:PrintToPlayer( string.format( "You gain %d AugBuys.", amount ),0xE );
   player:delCurrency( currency, total );
   player:setVar( "AugBuys", player:getVar( "AugBuys" ) + amount );      
end;

