{

   Very fast screen output in 80*25 mode by direct access to video memory


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

Procedure WriteStr   (Texte : String);

Var Attribut : Word;
    Offset   : Word;
    i        : Byte;

Begin

     Attribut := ((TextAttr + (TextBack Shl 4)) shl 8);

     { The Pge variable is the current screen page -There is a function in
       interrupt 10h nammed GetActivePage- So you should code something like
       Pge := GetActivePage where GetActivePage is a function that call this
       interrupt. You can also set this variable manually so if you code
       Pge := 0 then the screen output will be made to the first screen; if
       you code Pge := 1, this output will be made to the second screen, and
       so on until 7.  Be carefull: if the active screen page is the third
       and you have code Pge := 0 then you can't see the output because
       there are made on an invisible video page. }

     offset := WhereY * 160 + WhereX Shl 1 + (Pge shl 12);

     For i:= 1 to Length (Texte) do
         Begin
            MemW[$B800:Offset] := Attribut or ord(Texte[i]);
            Inc (Offset,2);
         End;

     GotoXy (WhereX + Length(Texte), WhereY);

End;


Procedure WriteStrLn   (Texte : String);

Var Attribut : Word;
    Offset   : Word;
    i        : Byte;

Begin

     Attribut := (((TextBack Shl 4) + TextAttr) shl 8);

     { The Pge variable is the current screen page -There is a function in
       interrupt 10h nammed GetActivePage- So you should code something like
       Pge := GetActivePage where GetActivePage is a function that call this
       interrupt. You can also set this variable manually so if you code
       Pge := 0 then the screen output will be made to the first screen; if
       you code Pge := 1, this output will be made to the second screen, and
       so on until 7.  Be carefull: if the active screen page is the third
       and you have code Pge := 0 then you can't see the output because
       there are made on an invisible video page. }

     offset := WhereY * 160 + WhereX Shl 1 + (Pge shl 12);

     For i:= 1 to Length (Texte) do
         Begin
            MemW[$B800:Offset] := Attribut or ord(Texte[i]);
            Inc (Offset,2);
         End;

     GotoXy (0, WhereY+1);

End;

Procedure WriteStrXY (X, Y, TAttr, TBack : Word; Text : String);

{ Ecrit sur la page sp�cifi�e, le texte donn�}

Var Offset   : Word;
    I        : Byte;
    Attr     : Word;
    AdressP  : Word Absolute $0040:$004E;{Address of the Active Screen Page}

Begin

    Offset := Y * 160 + X Shl 1 + AdressP;
    Attr := ((TAttr+(TBack Shl 4)) Shl 8);

    For I := 1 to Length (Text) Do
        Begin
           MemW[RamVideo:Offset] := Attr OR Ord(Text[I]);
           Inc (Offset,2);
        End;

End;
