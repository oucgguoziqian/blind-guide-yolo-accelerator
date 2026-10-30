module TH_test();

	reg sys_clk;
	reg rst_n;
	wire [31:0] data_valid;
	wire dht11_done;
	wire dht11;

	//----Code starts here: integrated by Robei-----
	        reg             dht11_en;
			reg             reg_dht11;
			initial begin
			rst_n <= 1'b0;
		    sys_clk <= 1'b0;
			reg_dht11 <= 1'b0;
			dht11_en <= 1'b0;                           //前期FPGA做输出，测试文件中inout作为输入，高阻即可
			#2;
			rst_n <= 1'b1;
			//等待FPGA操作
		    #200
			//FPGA拉低总线
			#144                                              
			//释放总线
			#96                          
			dht11_en <= 1'b1;                            //作为输出，给源代码传输需要接收的数据
			reg_dht11 <= 1'b0;
			#120                                          
			reg_dht11 <= 1'b1;                          //给出上升沿
			#120                                                
			reg_dht11 <= 1'b0;
		    //data_begin   注意先输入的是高位
			    
			//bit0                     
		    #112
		    reg_dht11 <= 1'b1;
		    #52
		    reg_dht11 <= 1'b0;
		    
		    
		    //bit1                   
		    #112
		    reg_dht11 <= 1'b1;
		    #52
		    reg_dht11 <= 1'b0;
		    
		    
		    //bit2                     
		    #112
		    reg_dht11 <= 1'b1;
		    #146
		    reg_dht11 <= 1'b0;
		    
		    //bit3
		    #112
		    reg_dht11 <= 1'b1;
		    #52
		    reg_dht11 <= 1'b0;
		  
		    
		    //bit4                       
		    #112
		    reg_dht11 <= 1'b1;
		    #146
		    reg_dht11 <= 1'b0;
		    
		    
		    //bit5                        
		    #112
		    reg_dht11 <= 1'b1;
		    #52
		    reg_dht11 <= 1'b0;
		   
		    
		    //bit6                       
		    #112
		    reg_dht11 <= 1'b1;
		    #146
		    reg_dht11 <= 1'b0;
		   
		    
		    //bit7                      
		    #112
		    reg_dht11 <= 1'b1;
		    #146
		    reg_dht11 <= 1'b0;
		   
		    
		    //bit8                        
		    #112
		    reg_dht11 <= 1'b1;
		    #52
		    reg_dht11 <= 1'b0;
		   
		    
		    //bit9                      
		    #112
		    reg_dht11 <= 1'b1;
		    #52
		    reg_dht11 <= 1'b0;
		   
		    
		    //bit10                     
		    #112
		    reg_dht11 <= 1'b1;
		    #52
		    reg_dht11 <= 1'b0;
		    
		    //bit11
		    #112
		    reg_dht11 <= 1'b1;
		    #52
		    reg_dht11 <= 1'b0;
		    
		    
		    //bit12                     
		    #112
		    reg_dht11 <= 1'b1;
		    #52
		    reg_dht11 <= 1'b0;
		   
		    
		    //bit13                      
		    #112
		    reg_dht11 <= 1'b1;
		    #52
		    reg_dht11 <= 1'b0;
		    
		    
		    //bit14                       
		    #112
		    reg_dht11 <= 1'b1;
		    #52
		    reg_dht11 <= 1'b0;
		   
		    
		    //bit15                                        
		    #112
		    reg_dht11 <= 1'b1;
		    #52
		    reg_dht11 <= 1'b0;
		   
		    
		    //bit16                      
		    #112
		    reg_dht11 <= 1'b1;
		    #52
		    reg_dht11 <= 1'b0;
		    
		    
		    //bit17                      
		    #112                                                        //54_000
		    reg_dht11 <= 1'b1;
		    #52                                                              //25_000
		    reg_dht11 <= 1'b0;
		    
		    
		    //bit18                       
		    #112                                                           //54_000
		    reg_dht11 <= 1'b1;
		    #52
		    reg_dht11 <= 1'b0;
		    
		    
		    //bit19                       
		    #112
		    reg_dht11 <= 1'b1;
		    #146
		    reg_dht11 <= 1'b0;
		    
		    
		    //bit20                      
		    #112
		    reg_dht11 <= 1'b1;
		    #146
		    reg_dht11 <= 1'b0;
		   
		    //bit21
		    #112
		    reg_dht11 <= 1'b1;
		    #146
		    reg_dht11 <= 1'b0;
		    
		     
		    //bit22                     
		    #112
		    reg_dht11 <= 1'b1;
		    #52
		    reg_dht11 <= 1'b0;
		   
		    //bit23                      
		    #112
		    reg_dht11 <= 1'b1;
		    #52
		    reg_dht11 <= 1'b0;
		    
		    
		    //bit24                     
		    #112
		    reg_dht11 <= 1'b1;
		    #52
		    reg_dht11 <= 1'b0;
		   
		    
		    //bit25                     
		    #112                 
		    reg_dht11 <= 1'b1;
		    #52
		    reg_dht11 <= 1'b0;
		    
		    
		    //bit26                     
		    #112
		    reg_dht11 <= 1'b1;
		    #52
		    reg_dht11 <= 1'b0;
		    
		    
		    //bit27                 
		    #112
		    reg_dht11 <= 1'b1;
		    #52
		    reg_dht11 <= 1'b0;
		    
		    
		    //bit28                 
		    #112
		    reg_dht11 <= 1'b1;
		    #52
		    reg_dht11 <= 1'b0;
		    
		    
		    //bit29                 
		    #112
		    reg_dht11 <= 1'b1;
		    #52
		    reg_dht11 <= 1'b0;
		    
		    
		    //bit30                
		    #112
		    reg_dht11 <= 1'b1;
		    #52
		    reg_dht11 <= 1'b0;
		   
		    
		    //bit31               
		    #112
		    reg_dht11 <= 1'b1;
		    #52
		    reg_dht11 <= 1'b0;
		    
		    
		    //bit32              
		    #112
		    reg_dht11 <= 1'b1;
		    #52
		    reg_dht11 <= 1'b0;
		    
		    
		    //bit33           
		    #112        
		    reg_dht11 <= 1'b1;
		    #146
		    reg_dht11 <= 1'b0;
		    
		    
		    //bit34             
		    #112
		    reg_dht11 <= 1'b1;
		    #52
		    reg_dht11 <= 1'b0;
		   
		    
		    //bit35            
		    #112
		    reg_dht11 <= 1'b1;
		    #52
		    reg_dht11 <= 1'b0;
		    //data_1
		    
		    //bit36           
		    #112
		    reg_dht11 <= 1'b1;
		    #52
		    reg_dht11 <= 1'b0;
		    
		    
		    //bit37          
		    #112
		    reg_dht11 <= 1'b1;
		    #146
		    reg_dht11 <= 1'b0;
		   
		    
		    //bit38     
		    #112
		    reg_dht11 <= 1'b1;
		    #146
		    reg_dht11 <= 1'b0;
		    
		    
		    //bit39          5_1
		    #112
		    reg_dht11 <= 1'b1;
		    #146
		    reg_dht11 <= 1'b0;
		   
	        //bit40          //无效
	        #112
	        reg_dht11 <= 1'b1;
	        #146
	        reg_dht11 <= 1'b0;
	        //data_1
		    #40
	        reg_dht11 <= 1'b1;
	        #1
	        dht11_en <= 1'b0;
		    #50
		   
		    $finish;
		end
		
	   always #1 begin
		    sys_clk <= ~sys_clk;
		end
		assign dht11 = (dht11_en)? reg_dht11:1'bz;
	
	
	
	initial begin
		$dumpfile ("E:/hls/Robei/environment/TempAndHumi_drive/TH_test.vcd");
		$dumpvars;
	end
	//---Module instantiation---
	TempAndHumi_drive TempAndHumi_drive1(
		.sys_clk(sys_clk),
		.rst_n(rst_n),
		.data_valid(data_valid),
		.dht11_done(dht11_done),
		.dht11(dht11));

endmodule    //TH_test

