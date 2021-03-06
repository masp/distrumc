-module(mc_nbt_tests).

-include_lib("eunit/include/eunit.hrl").

-define(HELLO_WORLD, <<"hello world"/utf8>>).
-define(NAME, <<"name"/utf8>>).
-define(BANANRAMA, <<"Bananrama"/utf8>>).
-define(TAG_End, 0).
-define(TAG_String, 8).
-define(TAG_Compound, 10).

bananrama_binary() ->
    <<
        ?TAG_Compound,
        (byte_size(?HELLO_WORLD)):16/integer,
        ?HELLO_WORLD/binary,
        ?TAG_String,
        (byte_size(?NAME)):16/integer,
        ?NAME/binary,
        (byte_size(?BANANRAMA)):16/integer,
        ?BANANRAMA/binary,
        ?TAG_End
    >>.

bananrama_term() ->
    {tag_compound, <<"hello world">>, [{tag_string, <<"name">>, <<"Bananrama">>}]}.

bigtest_binary() ->
    % from bigtest.nbt found at this link: https://wiki.vg/NBT#bigtest.nbt
    zlib:gunzip(
        <<16#1f, 16#8b, 16#08, 16#00, 16#00, 16#00, 16#00, 16#00, 16#00, 16#00, 16#ed, 16#54, 16#cf,
            16#4f, 16#1a, 16#41, 16#14, 16#7e, 16#c2, 16#02, 16#cb, 16#96, 16#82, 16#b1, 16#c4,
            16#10, 16#63, 16#cc, 16#ab, 16#b5, 16#84, 16#a5, 16#db, 16#cd, 16#42, 16#11, 16#89,
            16#b1, 16#88, 16#16, 16#2c, 16#9a, 16#0d, 16#1a, 16#d8, 16#a8, 16#31, 16#86, 16#b8,
            16#2b, 16#c3, 16#82, 16#2e, 16#bb, 16#66, 16#77, 16#b0, 16#f1, 16#d4, 16#4b, 16#7b,
            16#6c, 16#7a, 16#eb, 16#3f, 16#d3, 16#23, 16#7f, 16#43, 16#cf, 16#bd, 16#f6, 16#bf,
            16#a0, 16#c3, 16#2f, 16#7b, 16#69, 16#cf, 16#bd, 16#f0, 16#32, 16#c9, 16#f7, 16#e6,
            16#bd, 16#6f, 16#e6, 16#7b, 16#6f, 16#26, 16#79, 16#02, 16#04, 16#54, 16#72, 16#4f,
            16#2c, 16#0e, 16#78, 16#cb, 16#b1, 16#4d, 16#8d, 16#78, 16#f4, 16#e3, 16#70, 16#62,
            16#3e, 16#08, 16#7b, 16#1d, 16#c7, 16#a5, 16#93, 16#18, 16#0f, 16#82, 16#47, 16#dd,
            16#ee, 16#84, 16#02, 16#62, 16#b5, 16#a2, 16#aa, 16#c7, 16#78, 16#76, 16#5c, 16#57,
            16#cb, 16#a8, 16#55, 16#0f, 16#1b, 16#c8, 16#d6, 16#1e, 16#6a, 16#95, 16#86, 16#86,
            16#0d, 16#ad, 16#7e, 16#58, 16#7b, 16#8f, 16#83, 16#cf, 16#83, 16#4f, 16#83, 16#6f,
            16#cf, 16#03, 16#10, 16#6e, 16#5b, 16#8e, 16#3e, 16#be, 16#a5, 16#38, 16#4c, 16#64,
            16#fd, 16#10, 16#ea, 16#da, 16#74, 16#a6, 16#23, 16#40, 16#dc, 16#66, 16#2e, 16#69,
            16#e1, 16#b5, 16#d3, 16#bb, 16#73, 16#fa, 16#76, 16#0b, 16#29, 16#db, 16#0b, 16#e0,
            16#ef, 16#e8, 16#3d, 16#1e, 16#38, 16#5b, 16#ef, 16#11, 16#08, 16#56, 16#f5, 16#de,
            16#5d, 16#df, 16#0b, 16#40, 16#e0, 16#5e, 16#b7, 16#fa, 16#64, 16#b7, 16#04, 16#00,
            16#8c, 16#41, 16#4c, 16#73, 16#c6, 16#08, 16#55, 16#4c, 16#d3, 16#20, 16#2e, 16#7d,
            16#a4, 16#c0, 16#c8, 16#c2, 16#10, 16#b3, 16#ba, 16#de, 16#58, 16#0b, 16#53, 16#a3,
            16#ee, 16#44, 16#8e, 16#45, 16#03, 16#30, 16#b1, 16#27, 16#53, 16#8c, 16#4c, 16#f1,
            16#e9, 16#14, 16#a3, 16#53, 16#8c, 16#85, 16#e1, 16#d9, 16#9f, 16#e3, 16#b3, 16#f2,
            16#44, 16#81, 16#a5, 16#7c, 16#33, 16#dd, 16#d8, 16#bb, 16#c7, 16#aa, 16#75, 16#13,
            16#5f, 16#28, 16#1c, 16#08, 16#d7, 16#2e, 16#d1, 16#59, 16#3f, 16#af, 16#1d, 16#1b,
            16#60, 16#21, 16#59, 16#df, 16#fa, 16#f1, 16#05, 16#fe, 16#c1, 16#ce, 16#fc, 16#9d,
            16#bd, 16#00, 16#bc, 16#f1, 16#40, 16#c9, 16#f8, 16#85, 16#42, 16#40, 16#46, 16#fe,
            16#9e, 16#eb, 16#ea, 16#0f, 16#93, 16#3a, 16#68, 16#87, 16#60, 16#bb, 16#eb, 16#32,
            16#37, 16#a3, 16#28, 16#0a, 16#8e, 16#bb, 16#f5, 16#d0, 16#69, 16#63, 16#ca, 16#4e,
            16#db, 16#e9, 16#ec, 16#e6, 16#e6, 16#2b, 16#3b, 16#bd, 16#25, 16#be, 16#64, 16#49,
            16#09, 16#3d, 16#aa, 16#bb, 16#94, 16#fd, 16#18, 16#7e, 16#e8, 16#d2, 16#0e, 16#da,
            16#6f, 16#15, 16#4c, 16#b1, 16#68, 16#3e, 16#2b, 16#e1, 16#9b, 16#9c, 16#84, 16#99,
            16#bc, 16#84, 16#05, 16#09, 16#65, 16#59, 16#16, 16#45, 16#00, 16#ff, 16#2f, 16#28,
            16#ae, 16#2f, 16#f2, 16#c2, 16#b2, 16#a4, 16#2e, 16#1d, 16#20, 16#77, 16#5a, 16#3b,
            16#b9, 16#8c, 16#ca, 16#e7, 16#29, 16#df, 16#51, 16#41, 16#c9, 16#16, 16#b5, 16#c5,
            16#6d, 16#a1, 16#2a, 16#ad, 16#2c, 16#c5, 16#31, 16#7f, 16#ba, 16#7a, 16#92, 16#8e,
            16#5e, 16#9d, 16#5f, 16#f8, 16#12, 16#05, 16#23, 16#1b, 16#d1, 16#f6, 16#b7, 16#77,
            16#aa, 16#cd, 16#95, 16#72, 16#bc, 16#9e, 16#df, 16#58, 16#5d, 16#4b, 16#97, 16#ae,
            16#92, 16#17, 16#b9, 16#44, 16#d0, 16#80, 16#c8, 16#fa, 16#3e, 16#bf, 16#b3, 16#dc,
            16#54, 16#cb, 16#07, 16#75, 16#6e, 16#a3, 16#b6, 16#76, 16#59, 16#92, 16#93, 16#a9,
            16#dc, 16#51, 16#50, 16#99, 16#6b, 16#cc, 16#35, 16#e6, 16#1a, 16#ff, 16#57, 16#23,
            16#08, 16#42, 16#cb, 16#e9, 16#1b, 16#d6, 16#78, 16#c2, 16#ec, 16#fe, 16#fc, 16#7a,
            16#fb, 16#7d, 16#78, 16#d3, 16#84, 16#df, 16#d4, 16#f2, 16#a4, 16#fb, 16#08, 16#06,
            16#00, 16#00>>
    ).

bigtest_term() ->
    {tag_compound, <<"Level">>, [
        {tag_long, <<"longTest">>, 9223372036854775807},
        {tag_short, <<"shortTest">>, 32767},
        {tag_string, <<"stringTest">>, <<"HELLO WORLD THIS IS A TEST STRING ÅÄÖ!"/utf8>>},
        {tag_float, <<"floatTest">>, 0.49823147058486938},
        {tag_int, <<"intTest">>, 2147483647},
        {tag_compound, <<"nested compound test">>, [
            {tag_compound, <<"ham">>, [
                {tag_string, <<"name">>, <<"Hampus">>},
                {tag_float, <<"value">>, 0.75}
            ]},
            {tag_compound, <<"egg">>, [
                {tag_string, <<"name">>, <<"Eggbert">>},
                {tag_float, <<"value">>, 0.5}
            ]}
        ]},
        {tag_list, <<"listTest (long)">>, {tag_long, [11, 12, 13, 14, 15]}},
        {tag_list, <<"listTest (compound)">>,
            {tag_compound, [
                [
                    {tag_string, <<"name">>, <<"Compound tag #0">>},
                    {tag_long, <<"created-on">>, 1264099775885}
                ],
                [
                    {tag_string, <<"name">>, <<"Compound tag #1">>},
                    {tag_long, <<"created-on">>, 1264099775885}
                ]
            ]}},
        {tag_byte, <<"byteTest">>, 127},
        {tag_byte_array,
            <<"byteArrayTest (the first 1000 values of (n*n*255+n*7)%100, starting with n=0 (0, 62, 34, 16, 8, ...))">>,
            [(N * N * 255 + N * 7) rem 100 || N <- lists:seq(0, 999)]},
        {tag_double, <<"doubleTest">>, 0.49312871321823148}
    ]}.

decode_test_() ->
    [
        ?_assertEqual({bananrama_term(), <<>>}, mc_nbt:decode(bananrama_binary())),
        ?_assertEqual({bigtest_term(), <<>>}, mc_nbt:decode(bigtest_binary()))
    ].

encode_test_() ->
    [
        ?_assertEqual(bananrama_binary(), mc_nbt:encode(bananrama_term())),
        ?_assertEqual(bigtest_binary(), mc_nbt:encode(bigtest_term()))
    ].
