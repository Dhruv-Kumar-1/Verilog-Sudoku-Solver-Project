`timescale 1ns/1ps




module sudoku(
input clk, reset, start,
input [3:0] sudoku_number,
input [3:0] row, 
output [6:0] CA,
output [7:0] AN, 
output A, B, C, D, E, F,G,
output [9:1] led,
output solved
);
reg [323:0] input_sudoku;
wire [323:0] A1[15:0];
wire [323:0] solved_A1;
// solved 1
assign  A1[0] ={4'd2,4'd0,4'd3, 4'd6,4'd0,4'd4, 4'd0,4'd0,4'd1,
             4'd0,4'd0,4'd5, 4'd0,4'd2,4'd0, 4'd0,4'd0,4'd0,
             4'd1,4'd8,4'd0, 4'd9,4'd0,4'd3, 4'd0,4'd5,4'd0,
             
             4'd9,4'd0,4'd8, 4'd0,4'd0,4'd0, 4'd0,4'd0,4'd2,
             4'd0,4'd6,4'd0, 4'd2,4'd0,4'd1, 4'd0,4'd4,4'd0, 
             4'd5,4'd0,4'd0, 4'd0,4'd0,4'd0, 4'd1,4'd0,4'd3,
             
             4'd0,4'd5,4'd0, 4'd3,4'd0,4'd6, 4'd0,4'd2,4'd7,
             4'd0,4'd0,4'd0, 4'd0,4'd9,4'd0, 4'd3,4'd0,4'd0,
             4'd6,4'd0,4'd0, 4'd8,4'd0,4'd7, 4'd9,4'd0,4'd5};
 // random  solved 2
assign A1[1] = 
{4'd5, 4'd3, 4'd0,  4'd0, 4'd7, 4'd0,  4'd0, 4'd0, 4'd0,
4'd6, 4'd0, 4'd0,  4'd1, 4'd9, 4'd5,  4'd0, 4'd0, 4'd0,
4'd0, 4'd9, 4'd8,  4'd0, 4'd0, 4'd0,  4'd0, 4'd6, 4'd0,

4'd8, 4'd0, 4'd0,  4'd0, 4'd6, 4'd0,  4'd0, 4'd0, 4'd3,
4'd4, 4'd0, 4'd0,  4'd8, 4'd0, 4'd3,  4'd0, 4'd0, 4'd1,
4'd7, 4'd0, 4'd0,  4'd0, 4'd2, 4'd0,  4'd0, 4'd0, 4'd6,

4'd0, 4'd6, 4'd0,  4'd0, 4'd0, 4'd0,  4'd2, 4'd8, 4'd0,
4'd0, 4'd0, 4'd0,  4'd4, 4'd1, 4'd9,  4'd0, 4'd0, 4'd5,
4'd0, 4'd0, 4'd0,  4'd0, 4'd8, 4'd0,  4'd0, 4'd7, 4'd9};

// random solved 3 (easy)
assign A1[2] = 
{4'd8, 4'd7, 4'd6,  4'd9, 4'd0, 4'd0,  4'd0, 4'd0, 4'd0,
4'd0, 4'd1, 4'd0,  4'd0, 4'd0, 4'd6,  4'd0, 4'd0, 4'd0,
4'd0, 4'd4, 4'd0,  4'd3, 4'd0, 4'd5,  4'd8, 4'd0, 4'd0,

4'd4, 4'd0, 4'd0,  4'd0, 4'd0, 4'd0,  4'd2, 4'd1, 4'd0,
4'd0, 4'd9, 4'd0,  4'd5, 4'd0, 4'd0,  4'd0, 4'd0, 4'd0,
4'd0, 4'd5, 4'd0,  4'd0, 4'd4, 4'd0,  4'd3, 4'd0, 4'd6,

4'd0, 4'd2, 4'd9,  4'd0, 4'd0, 4'd0,  4'd0, 4'd0, 4'd8,
4'd0, 4'd0, 4'd4,  4'd6, 4'd9, 4'd0,  4'd1, 4'd7, 4'd3,
4'd0, 4'd0, 4'd0,  4'd0, 4'd0, 4'd1,  4'd0, 4'd0, 4'd4};

//naked pair solved 4
assign A1[3] = 
{4'd2, 4'd5, 4'd1, 4'd3, 4'd4, 4'd8, 4'd7, 4'd9, 4'd6,
4'd0, 4'd0, 4'd0, 4'd9, 4'd1, 4'd7, 4'd2, 4'd0, 4'd4,
4'd0, 4'd0, 4'd7, 4'd2, 4'd5, 4'd6, 4'd0, 4'd0, 4'd0,

4'd0, 4'd0, 4'd0, 4'd0, 4'd6, 4'd0,4'd8, 4'd3, 4'd2, 
4'd0, 4'd0, 4'd0, 4'd0, 4'd0, 4'd0, 4'd0, 4'd7, 4'd0, 
4'd0, 4'd0, 4'd8, 4'd0, 4'd0,4'd0, 4'd9, 4'd0, 4'd4,
 
4'd0, 4'd0, 4'd0, 4'd6, 4'd2, 4'd0, 4'd0, 4'd0, 4'd8, 
4'd8, 4'd0, 4'd0, 4'd7, 4'd0, 4'd0, 4'd0, 4'd0, 4'd0, 
4'd0, 4'd0, 4'd2, 4'd5, 4'd0, 4'd1, 4'd6, 4'd4, 4'd0};


assign A1[4] = 324'h100489006_730000040_000001295_007120600_500703008_006095700_914600000_020000037_800512004;
assign A1[5] =  324'h000260701680070090190004500820100040004602900050003028009300074040050036703018000;


assign A1[6] = 324'h926801005_800040000_400006000_010704038_000590062_005000000_000000910_002905600_007080204;
assign A1[7] = 324'h400010002_508902100_023400000_901080403_080000090_307050601_000005930_005803206_200070008;
assign A1[8] = 324'h080403590_005206704_000070008_007000309_020507060_504000800_400030000_308109600_071604080;
assign A1[9] = 324'h405209600_300050000_016804030_108000500_020506090_003000406_030402750_000080004_002107308;
assign A1[10] = 324'h030070050_204600000_095203600_019060720_400000003_028030140_001504360_000008205_050010080;
// solved medium
assign A1[11] = 324'h801504026_009670000_000009470_400000000_905008002_003020100_000047605_598010700_000050000;
assign A1[12] = 324'h000000007_706080402_000003010_105690800_009000050_048050060_020100040_010006005_000708631;
assign A1[13] = 324'h010300006_094700801_000890000_472003008_000000000_608050097_000008010_500060730_020079005;
assign A1[14] = 324'h340000062_020900805_000025007_400210050_000009700_000000201_010740500_200308000_680500300;
assign A1[15] = 324'h000400370_801000020_743908000_300070980_006000050_000040603_530204000_000090740_900050030; 

//324'h530070000600195000098000060800060003400803001700020006060000280000419005000080079;
always @(*)
begin
case(sudoku_number)
4'b0000 : input_sudoku <= A1[0];
4'b0001 : input_sudoku <= A1[1];
4'b0010 : input_sudoku <= A1[2];
4'b0011 : input_sudoku <= A1[3];
4'b0100 : input_sudoku <= A1[4];
4'b0101 : input_sudoku <= A1[5];
4'b0110: input_sudoku <= A1[6];
4'b0111 : input_sudoku <= A1[7];
4'b1000 : input_sudoku <= A1[8];
4'b1001 : input_sudoku <= A1[9];
4'b1010 : input_sudoku <= A1[10];
4'b1011 : input_sudoku <= A1[11];
4'b1100 : input_sudoku <= A1[12];
4'b1101 : input_sudoku <= A1[13];
4'b1110 : input_sudoku <= A1[14];
4'b1111 : input_sudoku <= A1[15];
default : input_sudoku <= A1[0];
endcase
end



naked_pairs N(clk,reset,start, input_sudoku, solved_A1,  solved);
seven_seg S(clk, reset, solved, row,solved_A1, CA, AN,A, B, C, D, E, F,G, led);
endmodule

module seven_seg(
input clk, reset,start, 
input [3:0] row,
input [323:0] sudoku,
output  [6:0] CA, 
output  [7:0] AN,
output  A, B, C, D, E, F,G,
output reg [9:1] led
);

reg [7:0] segment_state;
wire [6:0] cathode_out; 
reg [3:0] value;


assign AN = reset?(8'b1111_1111) : (start?  ~segment_state : 8'b1111_1111);
assign CA = reset? (7'b1111_111) : (start? ~cathode_out : 7'b1111_111); //(~reset || start) ? cathode_out : 7'b1111_111;


//wire [323:0] sudoku = 324'h00195706_3_00080607_0_76913080_5_00726135_0_31249578_6_05637800_0_10860950_7_09071060_8_6_74583000;
wire [6:0] nineth_digit;
binary_to_seven_seg S(sudoku[(3 + 36*row)-:4], nineth_digit);

assign {A, B, C ,D, E, F, G} = reset ? 7'b1111_111 : (start ? ~nineth_digit : 7'b1111_111);

/*always @(posedge clk)
    begin
    if(start == 0)
        led = 9'b0000_00000;
     else
        begin
        case(sudoku[(3 + 36*row)-:4])
        4'd1 : led = 9'b0000_00001;
        4'd2 : led = 9'b0000_00010;
        4'd3 : led = 9'b0000_00100;
        4'd4 : led = 9'b0000_01000;
        4'd5 : led = 9'b0000_10000;
        4'd6 : led = 9'b0001_00000;
        4'd7 : led = 9'b0010_00000;
        4'd8 : led = 9'b0100_00000;
        4'd9 : led = 9'b1000_00000;
        default : led = 9'b0000_00000;
        4'd1 : {A, B, C, D, E, F, G} <= 7'b1001111; //bc
        4'd2 : {A, B, C, D, E, F, G} <= 7'b       //abged
        4'd3 :  {A, B, C, D, E, F, G}     //abgcd
        4'd4 :  {A, B, C, D, E, F, G}   //fgbc
        4'd5 :  {A, B, C, D, E, F, G}  //afgcd
        4'd6 :  {A, B, C, D, E, F, G}  //afedcg
        4'd7 :  {A, B, C, D, E, F, G}  //abc
        4'd8 :  {A, B, C, D, E, F, G}  //abcdefg
        4'd9
        endcase
        end
    end*/
 always @(*)
 begin
    case(segment_state)
            8'b0000_0001:   value = sudoku[(7 + 36*row)-:4];
            8'b0000_0010:   value = sudoku[(11 + 36*row)-:4];
            8'b0000_0100:   value = sudoku[(15 + 36*row)-:4];
            8'b0000_1000:   value = sudoku[(19 + 36*row)-:4];
            8'b0001_0000:   value = sudoku[(23 + 36*row)-:4];
            8'b0010_0000:   value = sudoku[(27 + 36*row)-:4];
            8'b0100_0000:   value = sudoku[(31 + 36*row)-:4];
            8'b1000_0000:   value = sudoku[(35 + 36*row)-:4];
            default:        value = sudoku[(7 + 36*row)-:4];       
        endcase
 end
 
binary_to_seven_seg M(value, cathode_out);

reg[19:0] count; 
 
 always @(posedge clk)
 begin
    if(reset == 1 || start == 0)
        begin segment_state <= 8'b0000_0001; count <= 0; end
    else
        if(count >= 20'h186A0) begin segment_state <= {segment_state[6:0] , segment_state[7]}; count <= 0; end
        else begin segment_state <= segment_state; count <= count + 1; end
 end
 endmodule
 

 
 module binary_to_seven_seg(
 input [3:0] value,
 output reg [6:0] seven_seg
 );
 
 always @(*)
    begin
        case(value)
            4'd0 : seven_seg = 7'b1111_110;      //abcdef
            4'd1 : seven_seg = 7'b0110_000;     //bc
            4'd2 : seven_seg = 7'b1101_101;     //abged
            4'd3 : seven_seg = 7'b1111_001;     //abgcd
            4'd4 : seven_seg = 7'b0110_011;     //fgbc
            4'd5 : seven_seg = 7'b1011_011;    //afgcd
            4'd6 : seven_seg = 7'b1011_111;    //afedcg
            4'd7 : seven_seg = 7'b1110_000;    //abc
            4'd8 : seven_seg = 7'b1111_111;    //abcdefg
            4'd9 : seven_seg = 7'b1111_011;    //abcdfg
            default : seven_seg = 7'b0000_000;
          endcase
    end
 
 endmodule







module naked_pairs(clk,reset,start, A1, sudoku, solved_1d); //, solved_2d, state, nextstate, alldone
//, state_1d, next_state_1d, count, h);
  input clk,reset, start;
  reg [3:0]D1,D2,D3;
  reg alldone;
  reg solved_2d;
  output reg solved_1d;
  reg [8:0]state;
  reg [8:0]nextstate;
  reg [8:0]i,n;
  reg [8:0]p1,p2,e;
  reg [1:0]state1;
  reg flag1,flag2,flag3,done=0;
  reg done1,done2,done3,done4,done5,done6;
  reg d4,d5,d6,d7;
  reg [8:0]d;
  input [323:0] A1;
  output reg [323:0] sudoku;
  reg [3:0]A[80:0];
  reg [8:0]B[80:0];
  reg [8:0]E[80:0];
  reg [3:0]C[80:0];
  reg [8:0]q,w,x,y,p3,d2,d3;
  reg v;
  parameter S0=9'd1,S1=9'd2,S2=9'd3,S3=9'd4,S4=9'd5,S5=9'd6,S6=9'd7,S7=9'd8,S8=9'd9,S9=9'd10,S10=9'd11,S11=9'd12,S12=9'd13,S13=9'd14,S14=9'd15,S15=9'd0,S16=9'd16,S17=9'd17,S18=9'd18,S19=9'd19,S20=9'd20,S21=9'd21,S22=9'd22,S23=9'd23,S24=9'd24,S25=9'd25,S26=9'd26,S27=9'd27,S28=9'd28,S29=9'd29,S30=9'd30,S31=9'd31,S32=9'd32,S33=9'd33,S34=9'd34,S35=9'd35,S36=9'd36,S37=9'd37,S38=9'd38,S39=9'd39,S40=9'd40,S41=9'd41,S42=9'd42,S43=9'd43,S44=9'd44,S45=9'd45,S46=9'd46,S47=9'd47,S48=9'd48,S49=9'd49,S50=9'd50,S51=9'd51,S52=9'd52,S53=9'd53,S54=9'd54,S55=9'd55,S56=9'd56,S57=9'd57,S58=9'd58,S59=9'd59,S60=9'd60,S61=9'd61,S62=9'd62,S63=9'd63,S64=9'd64,S65=9'd65,S66=9'd66,S67=9'd67,S68=9'd68,S69=9'd69,S70=9'd70,S71=9'd71,S72=9'd72,S73=9'd73,S74=9'd74,S75=9'd75,S76=9'd76,S77=9'd77,S78=9'd78,S79=9'd79,S80=9'd80,S81=9'd81,S82=9'd82,S83=9'd83,S84=9'd84,S85=9'd85,S86=9'd86,S87=9'd87,S88=9'd88,S89=9'd89,S90=9'd90,S91=9'd91,S92=9'd92,S93=9'd93,S94=9'd94,S95=9'd95,S96=9'd96,S97=9'd97,S98=9'd98,S99=9'd99,S100=9'd100,S101=9'd101,S102=9'd102,S103=9'd103,S104=9'd104,S105=9'd105,S106=9'd106,S107=9'd107,S108=9'd108,S109=9'd109,S110=9'd110,S111=9'd111,S112=9'd112,S113=9'd113,S114=9'd114,S115=9'd115,S116=9'd116,S117=9'd117,S118=9'd118,S119=9'd119,S120=9'd120,S121=9'd121,S122=9'd122,S123=9'd123,S124=9'd124,S125=9'd125,S126=9'd126,S127=9'd127,S128=9'd128,S129=9'd129,S130=9'd130,S131=9'd131,S132=9'd132,S133=9'd133,S134=9'd134,S135=9'd135,S136=9'd136,S137=9'd137,S138=9'd138,S139=9'd139,S140=9'd140,S141=9'd141,S142=9'd142,S143=9'd143,S144=9'd144,S145=9'd145,S146=9'd146,S147=9'd147,S148=9'd148,S149=9'd149,S150=9'd150,S151=9'd151,S152=9'd152,S153=9'd153,S154=9'd154,S155=9'd155,S156=9'd156,S157=9'd157,S158=9'd158,S159=9'd159,S160=9'd160,S161=9'd161,S162=9'd162,S163=9'd163,S164=9'd164,S165=9'd165,S166=9'd166,S167=9'd167,S168=9'd168,S169=9'd169,S170=9'd170,S171=9'd171,S172=9'd172,S173=9'd173,S174=9'd174,S175=9'd175,S176=9'd176,S177=9'd177,S178=9'd178,S179=9'd179,S180=9'd180,S181=9'd181,S182=9'd182,S183=9'd183,S184=9'd184,S185=9'd185,S186=9'd186,S187=9'd187,S188=9'd188,S189=9'd189,S190=9'd190,S191=9'd191,S192=9'd192,S193=9'd193,S194=9'd194,S195=9'd195,S196=9'd196,S197=9'd197,S198=9'd198,S199=9'd199,S200=9'd200,S201=9'd201,S202=9'd202,S203=9'd203,S204=9'd204,S205=9'd205,S206=9'd206,S207=9'd207,S208=9'd208,S209=9'd209,S210=9'd210,S211=9'd211,S212=9'd212,S213=9'd213,S214=9'd214,S215=9'd215,S216=9'd216,S217=9'd217,S218=9'd218,S219=9'd219,S220=9'd220,S221=9'd221,S222=9'd222,S223=9'd223,S224=9'd224,S225=9'd225,S226=9'd226,S227=9'd227,S228=9'd228,S229=9'd229,S230=9'd230,S231=9'd231,S232=9'd232,S233=9'd233,S234=9'd234,S235=9'd235,S236=9'd236,S237=9'd237,S238=9'd238,S239=9'd239,S240=9'd240,S241=9'd241,S242=9'd242,S243=9'd243,S244=9'd244,S245=9'd245,S246=9'd246,S247=9'd247,S248=9'd248,S249=9'd249,S250=9'd250,S251=9'd251,S252=9'd252,S253=9'd253,S254=9'd254,S255=9'd255,S256=9'd256,S257=9'd257,S258=9'd258,S259=9'd259,S260=9'd260,S261=9'd261,S262=9'd262,S263=9'd263;
  
  always @ (posedge clk) begin 
    if(reset) state <= 9'd262;
    else state<=nextstate;
  end
  
  always @ (*) begin
    if(reset) nextstate<=9'd262;
    else if(start) nextstate<=S15;
    else begin
      case (state)
        S16: nextstate<=S16;
        S15: nextstate<=S14;
        S14: nextstate<=S0;
        
        
        S0: begin
          if (i<9'd81) nextstate<=S17;
          else nextstate<=S20;
        end
        S17: begin
          if (A1[(323-(i*4))-:4]==4'd0) nextstate<=S18;
          else nextstate<=S19;
        end
        S18: nextstate<=S21;
        S19: begin
          if (A1[(323-(i*4))-:4]==4'd1) nextstate<=S221;
          else if (A1[(323-(i*4))-:4]==4'd2) nextstate<=S222;
          else if (A1[(323-(i*4))-:4]==4'd3) nextstate<=S223;
          else if (A1[(323-(i*4))-:4]==4'd4) nextstate<=S224;
          else if (A1[(323-(i*4))-:4]==4'd5) nextstate<=S225;
          else if (A1[(323-(i*4))-:4]==4'd6) nextstate<=S226;
          else if (A1[(323-(i*4))-:4]==4'd7) nextstate<=S227;
          else if (A1[(323-(i*4))-:4]==4'd8) nextstate<=S228;
          else if (A1[(323-(i*4))-:4]==4'd9) nextstate<=S229;
          else nextstate<=S21;
        end
        S221: nextstate<=S21;
        S222: nextstate<=S21;
        S223: nextstate<=S21;
        S224: nextstate<=S21;
        S225: nextstate<=S21;
        S226: nextstate<=S21;
        S227: nextstate<=S21;
        S228: nextstate<=S21;
        S229: nextstate<=S21;
        S20: nextstate<=S1;
        S21: nextstate<=S0;
        
        
        S1: begin
          if (i<9'd81) nextstate<=S22;
          else nextstate<=S23;
        end
        S22: begin
          if (q<9'd9) nextstate<=S24;
          else nextstate<=S25;
        end
        S23: nextstate<=S2;
        S24: nextstate<=S230;
        S230: nextstate<=S231;
        S231: begin
          if (d2 && d4 && d3) nextstate<=S26;
          else nextstate<=S27;
        end
        S25: nextstate<=S1;
        S26: nextstate<=S1;
        S27: nextstate<=S1;
        
        
        S2: begin
          if (i<9'd81) nextstate<=S28;
          else nextstate<=S29;
        end
        S28: begin
          if (w<9'd81) nextstate<=S30;
          else nextstate<=S31;
        end
        S29: nextstate<=S3;
        S30: nextstate<=S232;
        S232: nextstate<=S233;
        S233: begin
          if (d2 && d4 && d3) nextstate<=S32;
          else nextstate<=S33;
        end
        S31: nextstate<=S2;
        S32: nextstate<=S2;
        S33: nextstate<=S2;
        
        
        S3: begin
          if(i<9'd81) nextstate<=S34;
          else nextstate<=S35;
        end
        S34:begin 
          if(e<9'd9) nextstate<=S36;
          else nextstate<=S37;
        end
        S35: nextstate<=S4;
        S36: begin
          if(i<9'd27 && i%9<9'd3) nextstate<=S38;
          else if(i<9'd27 && i%9<9'd6 && i%9>9'd2) nextstate<=S39;
          else if(i<9'd27 && i%9<9'd9 && i%9>9'd5) nextstate<=S40;
          else if(i<9'd54 && i>9'd26 && i%9<9'd3) nextstate<=S41;
          else if(i<9'd54 && i>9'd26 && i%9<9'd6 && i%9>9'd2) nextstate<=S42;
          else if(i<9'd54 && i>9'd26 && i%9<9'd9 && i%9>9'd5) nextstate<=S43;
          else if(i<9'd81 && i>9'd53 && i%9<9'd3) nextstate<=S44;
          else if(i<9'd81 && i>9'd53 && i%9<9'd6 && i%9>9'd2) nextstate<=S45;
          else if(i<9'd81 && i>9'd53 && i%9<9'd9 && i%9>9'd5) nextstate<=S46;
          else nextstate<=S36;
        end
        S37: nextstate<=S3;
        S38: begin
          case(e)
            9'd0, 9'd1, 9'd2: nextstate<=S47;
            9'd3, 9'd4, 9'd5: nextstate<=S48;
            9'd6, 9'd7, 9'd8: nextstate<=S49;
            default: nextstate<= S38;
          endcase
        end
        S39: begin
          case(e)
            9'd0, 9'd1, 9'd2: nextstate<=S50;
            9'd3, 9'd4, 9'd5: nextstate<=S51;
            9'd6, 9'd7, 9'd8: nextstate<=S52;
            default: nextstate<=S39;
          endcase
        end
        S40: begin
          case(e)
            9'd0, 9'd1, 9'd2: nextstate<=S53;
            9'd3, 9'd4, 9'd5: nextstate<=S54;
            9'd6, 9'd7, 9'd8: nextstate<=S55;
            default: nextstate<=S40;
          endcase
        end
        S41: begin
          case(e)
            9'd0, 9'd1, 9'd2: nextstate<=S56;
            9'd3, 9'd4, 9'd5: nextstate<=S57;
            9'd6, 9'd7, 9'd8: nextstate<=S58;
            default: nextstate<=S41;
          endcase
        end
        S42: begin
          case(e)
            9'd0, 9'd1, 9'd2: nextstate<=S59;
            9'd3, 9'd4, 9'd5: nextstate<=S60;
            9'd6, 9'd7, 9'd8: nextstate<=S61;
            default: nextstate<=S42;
          endcase
        end
        S43: begin
          case(e)
            9'd0, 9'd1, 9'd2: nextstate<=S62;
            9'd3, 9'd4, 9'd5: nextstate<=S63;
            9'd6, 9'd7, 9'd8: nextstate<=S64;
            default: nextstate<=S43;
          endcase
        end
        S44: begin
          case(e)
            9'd0, 9'd1, 9'd2: nextstate<=S65;
            9'd3, 9'd4, 9'd5: nextstate<=S66;
            9'd6, 9'd7, 9'd8: nextstate<=S67;
            default: nextstate<=S44;
          endcase
        end
        S45: begin
          case(e)
            9'd0, 9'd1, 9'd2: nextstate<=S68;
            9'd3, 9'd4, 9'd5: nextstate<=S69;
            9'd6, 9'd7, 9'd8: nextstate<=S70;
            default: nextstate<=S45;
          endcase
        end
        S46: begin
          case(e)
            9'd0, 9'd1, 9'd2: nextstate<=S71;
            9'd3, 9'd4, 9'd5: nextstate<=S72;
            9'd6, 9'd7, 9'd8: nextstate<=S73;
            default: nextstate<=S46;
          endcase
        end
        S47: nextstate<=S74;
        S48: nextstate<=S78;
        S49: nextstate<=S79;
        S50: nextstate<=S80;
        S51: nextstate<=S81;
        S52: nextstate<=S82;
        S53: nextstate<=S83;
        S54: nextstate<=S84;
        S55: nextstate<=S85;
        S56: nextstate<=S86;
        S57: nextstate<=S87;
        S58: nextstate<=S88;
        S59: nextstate<=S89;
        S60: nextstate<=S90;
        S61: nextstate<=S91;
        S62: nextstate<=S92;
        S63: nextstate<=S93;
        S64: nextstate<=S94;
        S65: nextstate<=S95;
        S66: nextstate<=S96;
        S67: nextstate<=S97;
        S68: nextstate<=S98;
        S69: nextstate<=S99;
        S70: nextstate<=S100;
        S71: nextstate<=S101;
        S72: nextstate<=S102;
        S73: nextstate<=S103;
        
        S74: nextstate<=S75;
        S75: nextstate<=S76;
        S76: begin
          if (d2 && d3 && d4) nextstate<=S77;
          else nextstate<=S234;
        end
        S234: nextstate<=S3;
        S77: nextstate<=S3;
        S78: nextstate<=S75;
        S79: nextstate<=S75;
        S80: nextstate<=S75;
        S81: nextstate<=S75;
        S82: nextstate<=S75;
        S83: nextstate<=S75;
        S84: nextstate<=S75;
        S85: nextstate<=S75;
        S86: nextstate<=S75;
        S87: nextstate<=S75;
        S88: nextstate<=S75;
        S89: nextstate<=S75;
        S90: nextstate<=S75;
        S91: nextstate<=S75;
        S92: nextstate<=S75;
        S93: nextstate<=S75;
        S94: nextstate<=S75;
        S95: nextstate<=S75;
        S96: nextstate<=S75;
        S97: nextstate<=S75;
        S98: nextstate<=S75;
        S99: nextstate<=S75;
        S100: nextstate<=S75;
        S101: nextstate<=S75;
        S102: nextstate<=S75;
        S103: nextstate<=S75;
        
          
        
        
        S4: begin
          if(i<9'd81 && flag1==0) nextstate<=S5;
          else if (i<9'd81 && flag1==1) begin nextstate<=S6; end
          else nextstate<=S104;
        end
        S104: nextstate<=S8;
        
        
        S5: begin
          if(i<9'd81) nextstate<=S105;
          else nextstate<=S106;
        end
        S105: begin
          if(p1<9'd8) nextstate<=S107;
          else nextstate<=S108;
        end
        S106: nextstate<=S4;
        S107: begin
          if(p2<9'd9) nextstate<=S109;
          else nextstate<=S110;
        end
        S108: nextstate<=S5;
        S109: nextstate<=S235;
        S235: begin
          if(d4 && d2 && d3) nextstate<=S111;
          else nextstate<=S112;
        end
        S110: nextstate<=S5;
        S111: nextstate<=S4;
        S112: nextstate<=S5;
        
        
        S6: begin
          if(p3<9'd9) nextstate<=S113;
          else nextstate<=S114;
        end
        S113: nextstate<=S236;
        S236: begin
          if(d4 && d5 && d6 && d2) nextstate<=S115;
          else nextstate<=S116;
        end
        S114: nextstate<=S4;
        S115: begin
          if(d7) nextstate<=S117;
          else nextstate<=S118;
        end 
        S116: nextstate<=S6;
        S117: nextstate<=S6;
        S118: nextstate<=S6;
        
        
        S7: begin 
          if(i<9'd9 && flag2==0) begin nextstate<=S8; end
          else if (i<9'd9 && flag2==1) begin nextstate<=S9; end
          else nextstate<=S119;
        end
        S119: nextstate<=S11;
        
        
        S8: begin
          if (i<9'd9) nextstate<=S120;
          else nextstate<=S121;
        end
        S120: begin
          if(p1<9'd72) nextstate<=S122;
          else nextstate<=S123;
        end
        S121: nextstate<=S7;
        S122: begin
          if(p2<9'd81) nextstate<=S124;
          else nextstate<=S125;
        end
        S123: nextstate<=S8;
        S124: nextstate<=S237;
        S237: begin
          if(d4 && d2 && d3) nextstate<=S126;
          else nextstate<=S127;
        end
        S125: nextstate<=S8;
        S126: nextstate<=S7;
        S127: nextstate<=S8;
        
        
        S9: begin
          if(p3<9'd81) nextstate<=S128;
          else nextstate<=S129;
        end
        S128: nextstate<=S238;
        S238: begin
          if(d4 && d5 && d6 && d2) nextstate<=S130;
          else nextstate<=S131;
        end
        S129: nextstate<=S7;
        S130: nextstate<=S261;
        S261: begin
          if(d7) nextstate<=S132;
          else nextstate<=S133;
        end
        S131: nextstate<=S9;
        S132: nextstate<=S9;
        S133: nextstate<=S9;
        
        
        S10: begin
          if(i<9'd61 && flag3==0) nextstate<=S246;
          else if (i<9'd61 && flag3==1) nextstate<=S247;
          else nextstate<=S248;
        end
        S246: nextstate<=S245;
        S245: begin
          if(d4) nextstate<=S249;
          else nextstate<=S250;
        end
        S247: nextstate<=S12;
        S248: nextstate<=S13;
        S249: nextstate<=S11;
        S250: nextstate<=S11;
        
        
        S11: begin
          if (p1<9'd8) nextstate<=S251;
          else nextstate<=S134;
        end
        S251: begin
          if (p2<9'd9) nextstate<=S135;
          else nextstate<=S136;
        end
        S134: nextstate<=S10;
        S135: begin
          if (p1==9'd0 || p1==9'd1 || p1==9'd2) nextstate<=S137;
          else if (p1==9'd3 || p1==9'd4 || p1==9'd5) nextstate<=S138;
          else nextstate<=S139;
        end
        S136: nextstate<=S11;
        S137: begin
          if (p2==9'd1 || p2==9'd2) nextstate<=S140;
          else if (p2==9'd3 || p2==9'd4 || p2==9'd5) nextstate<=S141;
          else nextstate<=S142;
        end
        S138: begin
          if (p2==9'd4 || p2==9'd5) nextstate<=S143;
          else nextstate<=S144;
        end
        S139: nextstate<=S145;
        S140: nextstate<=S239;
        S239: begin
          if (d4 && d2 && d3 && d5) nextstate<=S146;
          else nextstate<=S147;
        end
        S141: nextstate<=S240;
        S240: begin
          if (d4 && d2 && d3 && d5) nextstate<=S148;
          else nextstate<=S149;
        end
        S142: nextstate<=S241;
        S241: begin
          if (d4 && d2 && d3 && d5) nextstate<=S150;
          else nextstate<=S151;
        end
        S143: nextstate<=S242;
        S242: begin
          if(d4 && d2 && d3 && d5) nextstate<=S152;
          else nextstate<=S153;
        end
        S144: nextstate<=S243;
        S243: begin
          if(d4 && d2 && d3 && d5) nextstate<=S154;
          else nextstate<=S155;
        end
        S145: nextstate<=S244;
        S244: begin
          if(d4 && d2 && d3 && d5) nextstate<=S156;
          else nextstate<=S157;
        end
        S146: nextstate<=S10;
        S147: nextstate<=S11;
        S148: nextstate<=S10;
        S149: nextstate<=S11;
        S150: nextstate<=S10;
        S151: nextstate<=S11;
        S152: nextstate<=S10;
        S153: nextstate<=S11;
        S154: nextstate<=S10;
        S155: nextstate<=S11;
        S156: nextstate<=S10;
        S157: nextstate<=S11;
        
        
        S12: begin
          if(p3<9'd9) nextstate<=S158;
          else nextstate<=S159;
        end
        S158: begin
          if (p3==9'd0 || p3==9'd1 || p3==9'd2) nextstate<=S160;
          else if (p3==9'd3 || p3==9'd4 || p3==9'd5) nextstate<=S161;
          else nextstate<=S162;
        end
        S159: nextstate<=S10;
        S160: nextstate<=S252;
        S252: begin
          if(d4 && d5 && d6 && d3) nextstate<=S163;
          else nextstate<=S164;
        end
        S161: nextstate<=S253;
        S253: begin
          if(d4 && d5 && d6 && d3) nextstate<=S165;
          else nextstate<=S164;
        end
        S162: nextstate<=S254;
        S254: begin
          if(d4 && d5 && d6 && d3) nextstate<=S166;
          else nextstate<=S164;
        end
        S163: nextstate<=S255;
        S255: begin
          if(d7) nextstate<=S167;
          else nextstate<=S168;
        end
        S164: nextstate<=S12;
        S165: nextstate<=S256;
        S256: begin
          if(d7) nextstate<=S169;
          else nextstate<=S170;
        end
        S166: nextstate<=S257;
        S257: begin
          if(d7) nextstate<=S171;
          else nextstate<=S172;
        end
        S167: nextstate<=S12;
        S168: nextstate<=S12;
        S169: nextstate<=S12;
        S170: nextstate<=S12;
        S171: nextstate<=S12;
        S172: nextstate<=S12;
        
        
        S13: begin
          if(done1==0 && done2==0 && done3==0 && done4==0 && done5==0 && done6==0) nextstate<=S173;
          else nextstate<=S174;
        end
        S173: nextstate<=258;
        S258: begin
          if(alldone  &&  i>=9'd0) nextstate<=S175;
          else nextstate<=S258;
        end
        S259: nextstate<=S259;
        S174: begin
          if(i<9'd81) nextstate<=S177;
          else nextstate<=S178;
        end
        S175: begin
          if (B[n]==9'd1) nextstate<=S179;
          else if (B[n]==9'd2) nextstate<=S180;
          else if (B[n]==9'd4) nextstate<=S181;
          else if (B[n]==9'd8) nextstate<=S182;
          else if (B[n]==9'd16) nextstate<=S183;
          else if (B[n]==9'd32) nextstate<=S184;
          else if (B[n]==9'd64) nextstate<=S185;
          else if (B[n]==9'd128) nextstate<=S186;
          else if (B[n]==9'd256) nextstate<=S187;
          else nextstate<=S189;
        end
        S176: nextstate<=S13;
        S177: begin
          if (B[i]==9'd1) nextstate<=S211;
          else if (B[i]==9'd2) nextstate<=S212;
          else if (B[i]==9'd4) nextstate<=S213;
          else if (B[i]==9'd8) nextstate<=S214;
          else if (B[i]==9'd16) nextstate<=S215;
          else if (B[i]==9'd32) nextstate<=S216;
          else if (B[i]==9'd64) nextstate<=S217;
          else if (B[i]==9'd128) nextstate<=S218;
          else if (B[i]==9'd256) nextstate<=S219;
          else nextstate<=S260;
        end
        S260: nextstate<=S220;
        S178: nextstate<=S1;
        S179: nextstate<=S189;
        S180: nextstate<=S189;
        S181: nextstate<=S189;
        S182: nextstate<=S189;
        S183: nextstate<=S189;
        S184: nextstate<=S189;
        S185: nextstate<=S189;
        S186: nextstate<=S189;
        S187: nextstate<=S189;
        S188: nextstate<=S189;
        S189: begin
          if (i<9'd81) nextstate<=S13;
          else nextstate<=S190;
        end
        S211: nextstate<=S220;
        S212: nextstate<=S220;
        S213: nextstate<=S220;
        S214: nextstate<=S220;
        S215: nextstate<=S220;
        S216: nextstate<=S220;
        S217: nextstate<=S220;
        S218: nextstate<=S220;
        S219: nextstate<=S220;
        S220: nextstate<=S13;
        default: nextstate<=S16;
      endcase
    end
  end
  
  always @ (posedge clk) begin
      case (state) 

        9'd262 : begin alldone = 0;solved_2d <= 0; end
        
        //Taking input
        S16: ;
        S15: ;
        S14: begin
          D1<=4'd0;
          D2<=4'd0;
          D3<=4'd0;
          flag1<=0;
          flag2<=0;
          flag3<=0;
     	  done1<=0;
      	  done2<=0;
      	  done3<=0;
      	  done4<=0;
      	  done5<=0;
          done6<=0;
          q<=9'd0;
          w<=9'd0;
          e<=9'd0;
          i<=9'd0;
          d2<=9'd0;
          d3<=9'd0;
          d4<=0;
          d5<=0;
          d6<=0;
          d7<=0;
          p1<=9'd0;
          p2<=9'd1;
          p3<=9'd0;
          d<=9'd0;
          x<=9'd0;
          y<=9'd0;
          alldone<=0;
        end
        S0: ;
        S17: ;
        S18: begin
          A[i]<=A1[(323-(i*4))-:4];
          E[i]<=9'd0;
          B[i]<=9'd511;
          C[i]<=4'd9;
        end
        S19: begin
          A[i]<=A1[(323-(i*4))-:4];
          B[i]<=9'd0;
          C[i]<=4'd0;
        end
        S221: E[i]<=(9'd1<<0);
        S222: E[i]<=(9'd1<<1);
        S223: E[i]<=(9'd1<<2);
        S224: E[i]<=(9'd1<<3);
        S225: E[i]<=(9'd1<<4);
        S226: E[i]<=(9'd1<<5);
        S227: E[i]<=(9'd1<<6);
        S228: E[i]<=(9'd1<<7);
        S229: E[i]<=(9'd1<<8);
        S20: i<=9'd0;
        S21: i<=i+9'd1;
        
        //delete row
        S1: ;
        S22: ;
        S23: begin i<=9'd0; x<=9'd0; end
        S24: begin
          x<=i-(i%9)+q;
        end
        S230: begin
          d4<=!(!((B[x])^(B[x]&(~E[i]))));
          d3<=!(!(A[i]^4'd0));
          d2<=!(A[x]^4'd0);
        end
        S231: ;
        S25: begin i<=i+9'd1; q<=9'd0; end
        S26: begin
          B[x]<=B[x]&(~E[i]);
          C[x]<=C[x]-4'd1;
          done4<=1;
          q<=q+9'd1;
        end
        S27: q<=q+9'd1;
        
        
        
        
        //delete column
        S2: ;
        S28: ;
        S29: i<=9'd0;
        S30: begin 
          x<=(i%9)+w;
        end
        S232: begin
          d4<=!(!((B[x])^(B[x]&(~E[i]))));
          d3<=!(!(A[i]^4'd0));
          d2<=!(A[x]^4'd0);
        end
        S233: ;
        S31: begin i<=i+9'd1; w<=9'd0; end
        S32: begin
          B[x]<=B[x]&(~E[i]);
          C[x]<=C[x]-4'd1;
          done5<=1; 
          w<=w+9'd9;
        end 
        S33: w<=w+9'd9;
        
        
        
        //delete box
        S3: ;
        S34: ;
        S35: i<=9'd0;
        S36: ;
        S37: begin i<=i+9'd1; e<=9'd0; end
        S38: ;
        S39: ;
        S40: ;
        S41: ;
        S42: ;
        S43: ;
        S44: ;
        S45: ;
        S46: ;
        S47: ;
        S48: ;
        S49: ;
        S50: ;
        S51: ;
        S52: ;
        S53: ;
        S54: ;
        S55: ;
        S56: ;
        S57: ;
        S58: ;
        S59: ;
        S60: ;
        S61: ;
        S62: ;
        S63: ;
        S64: ;
        S65: ;
        S66: ;
        S67: ;
        S68: ;
        S69: ;
        S70: ;
        S71: ;
        S72: ;
        S73: ;
        S74: begin
          x<=e;
        end
        S75: begin
          d4<=!(!((B[x])^(B[x]&(~E[i]))));
          d3<=!(!(A[i]^4'd0));
          d2<=!(A[x]^4'd0);
        end
        S76: ;
        S77: begin
          B[x]<=B[x]&(~E[i]);
          C[x]<=C[x]-4'd1;
          done6<=1;
          e<=e+9'd1;
        end
        S234: e<=e+9'd1;
        S78: begin
          x<=e+9'd6;
        end
        S79: begin
          x<=e+9'd12;
        end
        S80: begin 
          x<=9'd3+e;
        end
        S81: begin
          x<=9'd9+e;
        end
        S82: begin
          x<=9'd15+e;
        end
        S83: begin
          x<=9'd6+e;
        end
        S84: begin
          x<=9'd12+e;
        end
        S85: begin
          x<=9'd18+e;
        end
        S86: begin
          x<=9'd27+e;
        end
        S87: begin
          x<=9'd33+e;
        end
        S88: begin
          x<=9'd39+e;
        end
        S89: begin
          x<=9'd30+e;
        end
        S90: begin
          x<=9'd36+e;
        end
        S91: begin
          x<=9'd42+e;
        end
        S92: begin
          x<=9'd33+e;
        end
        S93: begin
          x<=9'd39+e;
        end
        S94: begin
          x<=9'd45+e;
        end
        S95: begin
          x<=9'd54+e;
        end
        S96: begin
          x<=9'd60+e;
        end
        S97: begin
          x<=9'd66+e;
        end
        S98: begin
          x<=9'd57+e;
        end
        S99: begin
          x<=9'd63+e;
        end
        S100: begin
          x<=9'd69+e;
        end
        S101: begin
          x<=9'd60+e;
        end
        S102: begin
          x<=9'd66+e;
        end
        S103: begin
          x<=9'd72+e;
        end
        
        
        //check row
        S4: ;
        S104: begin
          i<=9'd0;
          p1<=9'd0;
          p2<=9'd9;
        end
        
        
        S5: ;
        S105: ;
        S106: ;
        S107: ;
        S108: begin i<=i+9'd9; p1<=9'd0; p2<=9'd1; end
        S109: begin
          x<=i+p1;
          y<=i+p2;
          d4<=!(B[i+p1]^B[i+p2]);
          d2<=!(C[i+p1]^4'd2);
          d3<=!(C[i+p2]^4'd2);
        end
        S235: ;
        S110: begin p1<=p1+9'd1; p2<=p1+9'd2; end
        S111: flag1<=1;
        S112: p2<=p2+9'd1;
        
        //update row
        S6: ;
        S113: begin
          x<=i+p3;
          y<=i+p1;
          d4<=!(!((B[i+p3])^(B[i+p3]&(~B[i+p1]))));
          d<=B[i+p3]&B[i+p1];
          d5<=!(!((i+p3)^(i+p1)));
          d6<=!(!((i+p3)^(i+p2)));
          d2<=!(A[i+p3]^4'd0);
        end
        S236: ;
        S114: begin p1<=p1+9'd1; p2<=p1+9'd2; p3<=9'd0; flag1<=0; end
        S115: begin
          done1<=1;
          d7<=!(!(!(d^9'd1) || !(d^9'd2) || !(d^9'd4) || !(d^9'd8) || !(d^9'd16) || !(d^9'd32) || !(d^9'd64) || !(d^9'd128) || !(d^9'd256)));
        end
        S116: p3<=p3+9'd1;
        S117: begin
          B[x]<=B[x]&(~B[y]);
          C[x]<=C[x]-4'd1;
          p3<=p3+9'd1;
        end
        S118: begin
          B[x]<=B[x]&(~B[y]);
          C[x]<=C[x]-4'd2;
          p3<=p3+9'd1;
        end
        
        
        
       //check column
        S7: ;
        S119: begin
          i<=9'd0;
          p1<=9'd0;
          p2<=9'd1;
        end
        
        
        S8: ;
        S120: ;
        S121: ;
        S122: ;
        S123: begin i<=i+9'd1; p1<=9'd0; p2<=9'd9; end
        S124: begin
          x<=i+p1;
          y<=i+p2;
          d4<=!(B[i+p1]^B[i+p2]);
          d2<=!(C[i+p1]^4'd2);
          d3<=!(C[i+p2]^4'd2);
        end
        S237: ;
        S125: begin p1<=p1+9'd9; p2<=p1+9'd18; end
        S126: flag2<=1;
        S127: p2<=p2+9'd9;
        
        
        //update column
        S9: ;
        S128: begin
          x<=i+p3;
          y<=i+p1;
          d4<=!(!((B[i+p3])^(B[i+p3]&(~B[i+p1]))));
          d<=B[i+p3]&B[i+p1];
          d5<=!(!((i+p3)^(i+p1)));
          d6<=!(!((i+p3)^(i+p2)));
        end
        S238: ;
        S129: begin p1<=p1+9'd9; p2<=p1+9'd18; p3<=9'd0; flag2<=0; end
        S130: ;
        S261: begin
          done2<=1;
          d7<=!(!(!(d^9'd1) || !(d^9'd2) || !(d^9'd4) || !(d^9'd8) || !(d^9'd16) || !(d^9'd32) || !(d^9'd64) || !(d^9'd128) || !(d^9'd256)));
        end
        S131: p3<=p3+9'd9;
        S132: begin
          B[x]<=B[x]&(~B[y]);
          C[x]<=C[x]-4'd1;
          p3<=p3+9'd9;
        end
        S133: begin
          B[x]<=B[x]&(~B[y]);
          C[x]<=C[x]-4'd2;
          p3<=p3+9'd9;
        end
        
        
        
        //check box
        S10: ;
        S246: d4<=(!(i^9'd0) || !(i^9'd3) || !(i^9'd27) || !(i^9'd30) || !(i^9'd54) || !(i^9'd57));
        S245: ;
        S247: ;
        S248: begin i<=9'd0; p1<=9'd0; p2<=9'd1; end
        S249: begin i<=i+9'd3; p1<=9'd0; p2<=9'd1; end
        S250: begin i<=i+9'd21; p1<=9'd0; p2<=9'd1; end
        
        
        S11: ;
        S251: ;
        S134: ;
        S135: ;
        S136: begin p1<=p1+9'd1; p2<=p1+9'd2; end
        S137: ;
        S138: ;
        S139: ;
        S140: begin
          x<=i+p1;
          y<=i+p2;
          d4<=!(B[i+p1]^B[i+p2]);
          d5<=!(!((i+p1)^(i+p2)));
          d2<=!(C[i+p1]^4'd2);
          d3<=!(C[i+p2]^4'd2);
        end
        S239: ;
        S141: begin
          x<=i+p1;
          y<=i+p2+9'd6;
          d4<=!(B[i+p1]^B[i+p2+9'd6]);
          d5<=!(!((i+p2+9'd6)^(i+p1)));
          d2<=!(C[i+p1]^4'd2);
          //d3<=!(C[i+p2]^4'd2);
          d3<=!(C[i+p2 + 9'd6]^4'd2);
        end
        S240: ;
        S142: begin
          x<=i+p1;
          y<=i+p2+9'd12;
          d4<=!(B[i+p1]^B[i+p2+9'd12]);
          d5<=!(!((i+p2+9'd12)^(i+p1)));
          d2<=!(C[i+p1]^4'd2);
         // d3<=!(C[i+p2]^4'd2);
         d3<=!(C[i+p2 + 9'd12]^4'd2);
        end
        S241: ;
        S143: begin
          x<=i+p1+9'd6;
          y<=i+p2+9'd6;
          d4<=!(B[i+p1+9'd6]^B[i+p2+9'd6]);
          d5<=!(!((i+p1+9'd6)^(i+p2+9'd6)));
          //d2<=!(C[i+p1]^4'd2);
          //d3<=!(C[i+p2]^4'd2);
          d2<=!(C[i+p1 + 9'd6]^4'd2);
          d3<=!(C[i+p2 + 9'd6]^4'd2);
        end
        S242: ;
        S144: begin
          x<=i+p1+9'd6;
          y<=i+p2+9'd12;
          d4<=!(B[i+p1+9'd6]^B[i+p2+9'd12]);
          d5<=!(!((i+p1+9'd6)^(i+p2+9'd12)));
//          d2<=!(C[i+p1]^4'd2);
//          d3<=!(C[i+p2]^4'd2);
          d2<=!(C[i+p1 + 9'd6]^4'd2);
          d3<=!(C[i+p2 + 9'd12]^4'd2);
        end
        S243: ;
        S145: begin
          x<=i+p1+9'd12;
          y<=i+p2+9'd12;
          d4<=!(B[+p1+9'd12]^B[i+p2+9'd12]);
          d5<=!(!((+p1+9'd12)^(i+p2+9'd12)));
//          d2<=!(C[i+p1]^4'd2);
//          d3<=!(C[i+p2]^4'd2);
          d2<=!(C[i+p1 + 9'd12]^4'd2);
          d3<=!(C[i+p2 + 9'd12]^4'd2);
        end
        S244: ;
        S146: begin
          d2<=p1;
          d3<=p2;
          flag3<=1;
        end
        S147: p2<=p2+9'd1;
        S148: begin
          d2<=p1;
          d3<=p2+9'd6;
          flag3<=1;
        end
        S149: p2<=p2+9'd1;
        S150: begin
          d2<=p1;
          d3<=p2+9'd12;
          flag3<=1;
        end
        S151: p2<=p2+9'd1;
        S152: begin
          d2<=p1+9'd6;
          d3<=p2+9'd6;
          flag3<=1;
        end
        S153: p2<=p2+9'd1;
        S154: begin
          d2<=p1+9'd6;
          d3<=p2+9'd12;
          flag3<=1;
        end
        S155: p2<=p2+9'd1;
        S156: begin
          d2<=p1+9'd12;
          d3<=p2+9'd12;
          flag3<=1;
        end
        S157: p2<=p2+9'd1;
        
        
        //update box
        S12: d=(B[i+p3])&(B[i+d2]);
        S158: ;
        S159: begin p1<=p1+9'd1; p2<=p1+9'd2; p3<=9'd0; flag3<=0; end
        S160: begin
          x<=i+p3;
          y<=i+d2;
          d4<=!(!((B[i+p3])^(B[i+p3]&(~B[i+d2]))));
          d5<=!(!((i+p3)^(i+d2)));
          d6<=!(!((i+p3)^(i+d3)));
        end
        S252: ;
        S161: begin
          x<=i+p3+9'd6;
          y<=i+d2;
          d4<=!(!((B[i+p3+9'd6])^(B[i+p3+9'd6]&(~B[i+d2]))));
          d5<=!(!((i+p3+9'd6)^(i+d2)));
          d6<=!(!((i+p3+9'd6)^(i+d3)));
        end
        S253: ;
        S162: begin
          x<=i+p3+9'd12;
          y<=i+d2;
          d4<=!(!((B[i+p3+9'd12])^(B[i+p3+9'd12]&(~B[i+d2]))));
          d5<=!(!((i+p3+9'd12)^(i+d2)));
          d6<=!(!((i+p3+9'd12)^(i+d3)));
        end
        S254: ;
        S163: begin
          done3<=1;
          d7<=(!(d^9'd1) || !(d^9'd2) || !(d^9'd4) || !(d^9'd8) || !(d^9'd16) || !(d^9'd32) || !(d^9'd64) || !(d^9'd128) || !(d^9'd256));
        end
        S255: ;
        S164: begin
          p3<=p3+9'd1;
        end
        S165: begin
          done3<=1;
          d7<=(!(d^9'd1) || !(d^9'd2) || !(d^9'd4) || !(d^9'd8) || !(d^9'd16) || !(d^9'd32) || !(d^9'd64) || !(d^9'd128) || !(d^9'd256));
        end
        S256: ;
        S166: begin
          done3<=1;
          d7<=(!(d^9'd1) || !(d^9'd2) || !(d^9'd4) || !(d^9'd8) || !(d^9'd16) || !(d^9'd32) || !(d^9'd64) || !(d^9'd128) || !(d^9'd256));
        end
        S257: ;
        S167: begin
          B[x]<=B[x]&(~B[y]);
          C[x]<=C[x]-4'd1;
          p3<=p3+9'd1;
        end
        S168: begin
          B[x]<=B[x]&(~B[y]);
          C[x]<=C[x]-4'd2;
          p3<=p3+9'd1;
        end
        S169: begin
          B[x]<=B[x]&(~B[y]);
          C[x]<=C[x]-4'd1;
          p3<=p3+9'd1;
        end
        S170: begin
          B[x]<=B[x]&(~B[y]);
          C[x]<=C[x]-4'd2;
          p3<=p3+9'd1;
        end
        S171: begin
          B[x]<=B[x]&(~B[y]);
          C[x]<=C[x]-4'd1;
          p3<=p3+9'd1;
        end
        S172: begin
          B[x]<=B[x]&(~B[y]);
          C[x]<=C[x]-4'd2;
          p3<=p3+9'd1;
        end
        
        
       
        //final result or repeat check and update (if possible)
        S13: ;
        S173: begin
          alldone<=1;
        end
        S258: ;
        S174: ;
        S175: ;
        S176: ;
        S177: ;
        S178: begin
          done1<=0;
          done2<=0;
          done3<=0;
          done4<=0;
          done5<=0;
          done6<=0;
          i<=9'd0;
        end
        S179: begin A[i]<=4'd1; end
        S180: begin A[i]<=4'd2; end
        S181: begin A[i]<=4'd3; end
        S182: begin A[i]<=4'd4; end
        S183: begin A[i]<=4'd5; end
        S184: begin A[i]<=4'd6; end
        S185: begin A[i]<=4'd7; end
        S186: begin A[i]<=4'd8; end
        S187: begin A[i]<=4'd9; end
        S189: i<=i+9'd1;
        S190 : solved_2d <= 1;
        S211: begin A[i]<=4'd1; C[i]<=4'd0; B[i]<=9'd0; E[i]<=(9'd1<<0);end
        S212: begin A[i]<=4'd2; C[i]<=4'd0; B[i]<=9'd0; E[i]<=(9'd1<<1);end
        S213: begin A[i]<=4'd3; C[i]<=4'd0; B[i]<=9'd0; E[i]<=(9'd1<<2);end
        S214: begin A[i]<=4'd4; C[i]<=4'd0; B[i]<=9'd0; E[i]<=(9'd1<<3);end
        S215: begin A[i]<=4'd5; C[i]<=4'd0; B[i]<=9'd0; E[i]<=(9'd1<<4);end
        S216: begin A[i]<=4'd6; C[i]<=4'd0; B[i]<=9'd0; E[i]<=(9'd1<<5);end
        S217: begin A[i]<=4'd7; C[i]<=4'd0; B[i]<=9'd0; E[i]<=(9'd1<<6);end
        S218: begin A[i]<=4'd8; C[i]<=4'd0; B[i]<=9'd0; E[i]<=(9'd1<<7);end
        S219: begin A[i]<=4'd9; C[i]<=4'd0; B[i]<=9'd0; E[i]<=(9'd1<<8);end
        S220: i<=i+9'd1;
        S260: ;
        S261: ;
        default : ;
      endcase
  end
  
   reg [2:0] state_1d;
   reg [2:0] next_state_1d;
   reg [6:0] count = 7'd0;
  
  always @(posedge clk)
  begin
    if(solved_2d == 0)
        state_1d <= 3'b000;
     else
        state_1d <= next_state_1d;
  end
  
  always @(posedge clk)
  begin
    case(state_1d)
        3'b000 : begin count = 0; sudoku <= 324'd0; solved_1d <= 0; end
        3'b001 : sudoku[(323 - 4*count)-:4] <= A[count];
        3'b010 : count <= count + 1;
        3'b011 : ;
        3'b100 : solved_1d <= 1;
        default : count = 0; 
        endcase
  end
  
  always @(*)
  begin
            case(state_1d)
            3'b000 : if(solved_2d == 1)  next_state_1d <= 3'b001; else next_state_1d <= 3'b000;
            3'b001 : next_state_1d <= 3'b010; 
            3'b010 : next_state_1d <= 3'b011;
            3'b011 : if(count < 7'd81) next_state_1d <= 3'b001; else next_state_1d <= 3'b100;
            3'b100 : next_state_1d <= 3'b100;
            default : next_state_1d <= 3'b001;
            endcase
  end
  
endmodule
