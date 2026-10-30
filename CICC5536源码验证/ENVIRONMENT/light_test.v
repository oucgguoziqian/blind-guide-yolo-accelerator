module light_test();

	reg clk;
	reg rst_n;
	wire scl;
	wire [15:0] data;
	wire sda;

	//----Code starts here: integrated by Robei-----
	 reg             en;
			reg             r_sda;
		
		initial begin
			rst_n <= 1'b0;
		    clk <= 1'b0;
			r_sda <= 1'b0;
			en <= 1'b0;      	
	        #1
		    rst_n <= 1'b1; 
		    
		    #15_001                        //拿控制权
		    en <= 1'b1;                      
		    r_sda <= 1'b0;                  //应答
		    #2_000
		    en <= 1'b0;                     //还回控制权
		    
	        #12_000                        //拿控制权
		    en <= 1'b1;                      
		    r_sda <= 1'b0;                  //应答
		    #2_000
		    en <= 1'b0;                     //还回控制权
		    
		    /*#250_000                        //拿控制权
		    en <= 1'b1;                      
		    r_sda <= 1'b0;                  //应答
		    #30_000
		    en <= 1'b0;                     //还回控制权
		    
		    #180_000                        //拿控制权
		    en <= 1'b1;                      
		    r_sda <= 1'b0;                  //应答
		    #30_000
		    en <= 1'b0;                     //还回控制权
		    
		    #250_000                        //拿控制权
		    en <= 1'b1;                      
		    r_sda <= 1'b0;                  //应答
		    #30_000
		    en <= 1'b0;                     //还回控制权
		    
		    #180_000                        //拿控制权
		    en <= 1'b1;                      
		    r_sda <= 1'b0;                  //应答
		    #30_000
		    en <= 1'b0;                     //还回控制权
		    #206_790
		    #20_000_000                     //等待测量
		    
		    #210_000                        //拿控制权
		    en <= 1'b1;                      
		    r_sda <= 1'b0;                  //应答
		    
		    #30_000                        //数据0127          
			r_sda <= 1'b0;  //放第一个数据   0
			#30_000
			r_sda <= 1'b0;  //0
			#30_000
			r_sda <= 1'b0;  //0
			#30_000
			r_sda <= 1'b0;   //0
			#30_000
			r_sda <= 1'b0;  //0
			#30_000
			r_sda <= 1'b0;   //0
			#30_000
			r_sda <= 1'b0;   //0 
			#30_000
			r_sda <= 1'b1;   //1        01
			
			#30_000
			en <= 1'b0;                   //还回控制权
			#30_000
			en <= 1'b1;                  //拿控制权
			
			                            
			r_sda <= 1'b0;  //放第一个数据   0
			#40_000
			r_sda <= 1'b0;  //0
			#30_000
			r_sda <= 1'b1;  //1
			#30_000
			r_sda <= 1'b0;   //0
			#30_000
			r_sda <= 1'b0;  //0
			#30_000
			r_sda <= 1'b1;   //1
			#30_000
			r_sda <= 1'b1;   //1
			#30_000
			r_sda <= 1'b1;   //1        27*/
			
		    
			$finish;	
		end	
			always #1 
		    clk <= ~clk;
		
		assign sda = (en)? r_sda:1'bz;
	
	
	
	initial begin
		$dumpfile ("E:/hls/Robei/light_drive/light_test.vcd");
		$dumpvars;
	end
	//---Module instantiation---
	light_drive light_drive1(
		.clk(clk),
		.rst_n(rst_n),
		.scl(scl),
		.data_out(data),
		.sda(sda));

endmodule    //light_test

