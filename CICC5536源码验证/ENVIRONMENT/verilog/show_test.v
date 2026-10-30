module show_test();

	reg sys_clk;
	reg rst_n;
	wire OLED_SCL;
	wire Light_SCL;
	wire [15:0] light_data;
	wire [7:0] data_tempL;
	wire [7:0] data_tempH;
	wire [7:0] data_humidityH;
	wire [7:0] data_humidityL;
	wire OLED_SDA;
	wire dht11;
	wire Light_SDA;

	//----Code starts here: integrated by Robei-----
	   reg light_en;
	   reg r_light_sda;
	   reg reg_dht11;
	   reg dht11_en;
	   reg oled_en;
	   reg r_oled_sda;
	   
	 initial begin
			rst_n <= 1'b0;
		    sys_clk <= 1'b0;
			r_light_sda <= 1'b0;
			light_en <= 1'b0;
			reg_dht11 <= 1'b0;
			dht11_en <= 1'b0;
			r_oled_sda <= 1'b0;
			oled_en <= 1'b0;	
	        #15
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
			reg_dht11 <= 1'b1;                           //给出上升沿
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
		    #112                                                        
		    reg_dht11 <= 1'b1;
		    #52                                                             
		    reg_dht11 <= 1'b0;
		    
		    
		    //bit18                       
		    #112                                                           
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
	
	        
	
		    #50850
			$finish;	
		end
			always #1 
		    sys_clk <= ~sys_clk;
		    
	assign light_sda = (light_en)? r_light_sda:1'bz;
	assign dht11 = (dht11_en)? reg_dht11:1'bz;
	assign oled_sda = (oled_en)? r_oled_sda:1'bz;  
	
	initial begin
		$dumpfile ("E:/hls/Robei/eachmodule/ENVIRONMENT/show_test.vcd");
		$dumpvars;
	end
	//---Module instantiation---
	environment_main environment_main1(
		.sys_clk(sys_clk),
		.rst_n(rst_n),
		.OLED_SCL(OLED_SCL),
		.Light_SCL(Light_SCL),
		.light_data(light_data),
		.dht11(dht11),
		.OLED_SDA(OLED_SDA),
		.Light_SDA(Light_SDA),
		.tempL(data_tempL),
		.humidityH(data_humidityH),
		.tempH(data_tempH),
		.humidityL(data_humidityL));

endmodule    //show_test

