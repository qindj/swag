{

   Flush the keyboard: removes all characters present in the buffer


               浜様様様様様様様様様様様様様様様様様様様融
               �                                        紺
               �          AVONTURE CHRISTOPHE           紺
               �              AVC SOFTWARE              紺
               �     BOULEVARD EDMOND MACHTENS 157/53   紺
               �           B-1080 BRUXELLES             紺
               �              BELGIQUE                  紺
               �                                        紺
               藩様様様様様様様様様様様様様様様様様様様夕�
               旭旭旭旭旭旭旭旭旭旭旭旭旭旭旭旭旭旭旭旭旭�

}

Procedure FlushKeyboard;

Begin

   Inline ($Fa);
   MemW[$40:$1A] := MemW [$40:$1C];
   Inline ($Fb);

End;

{ Another solution is  While KeyPressed Do ReadKey; }
