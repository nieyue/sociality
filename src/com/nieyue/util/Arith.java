package com.nieyue.util;

import java.math.BigDecimal;
import java.util.concurrent.atomic.AtomicInteger;

/**  
* 由于Java的简单类型不能够精确的对浮点数进行运算，这个工具类提供精  
* 确的浮点数运算，包括加减乘除和四舍五入。  
*/  
public class Arith{ //默认除法运算精度   
private static final int DEF_DIV_SCALE = 2; //默认精度2
private Arith(){   
}   
/**  
* 提供精确的加法运算。  
* @param v1 被加数  
* @param v2 加数  
* @return 两个参数的和  
*/  
public static double add(double v1,double v2){   
BigDecimal b1 = new BigDecimal(Double.toString(v1));   
BigDecimal b2 = new BigDecimal(Double.toString(v2));   
return b1.add(b2).doubleValue();   
}   
/**  
* 提供精确的减法运算。  
* @param v1 被减数  
* @param v2 减数  
* @return 两个参数的差  
*/  
public static double sub(double v1,double v2){   
BigDecimal b1 = new BigDecimal(Double.toString(v1));   
BigDecimal b2 = new BigDecimal(Double.toString(v2));   
return b1.subtract(b2).doubleValue();   
}   
/**  
* 提供精确的乘法运算。  
* @param v1 被乘数  
* @param v2 乘数  
* @return 两个参数的积  
*/  
public static double mul(double v1,double v2){   
BigDecimal b1 = new BigDecimal(Double.toString(v1));   
BigDecimal b2 = new BigDecimal(Double.toString(v2));   
return b1.multiply(b2).doubleValue();   
}   
/**  
* 提供（相对）精确的除法运算，当发生除不尽的情况时，精确到  
* 小数点以后10位，以后的数字四舍五入。  
* @param v1 被除数  
* @param v2 除数  
* @return 两个参数的商  
*/  
public static double div(double v1,double v2){   
return div(v1,v2,DEF_DIV_SCALE);   
}   
/**  
* 提供（相对）精确的除法运算。当发生除不尽的情况时，由scale参数指  
* 定精度，以后的数字四舍五入。  
* @param v1 被除数  
* @param v2 除数  
* @param scale 表示表示需要精确到小数点以后几位。  
* @return 两个参数的商  
*/  
public static double div(double v1,double v2,int scale){   
if(scale<0){   
throw new IllegalArgumentException(   
"精度必须大于等于0");   
}   
BigDecimal b1 = new BigDecimal(Double.toString(v1));   
BigDecimal b2 = new BigDecimal(Double.toString(v2));   
return b1.divide(b2,scale,BigDecimal.ROUND_HALF_UP).doubleValue();   
}   
/**  
* 提供精确的小数位四舍五入处理。  
* @param v 需要四舍五入的数字  
* @param scale 小数点后保留几位  
* @return 四舍五入后的结果  
*/  
public static double round(double v,int scale){   
if(scale<0){   
throw new IllegalArgumentException("精度必须大于等于0");   
}   
BigDecimal b = new BigDecimal(Double.toString(v));   
BigDecimal one = new BigDecimal("1");   
return b.divide(one,scale,BigDecimal.ROUND_HALF_UP).doubleValue();   
}
public static void main(String[] args) {
	  System.out.println(0.05+0.01);
	  System.err.println(Arith.add(0.05, 0.01));

      System.out.println(1.0-0.42);
      System.err.println(Arith.sub(1.0, 0.42));

      System.out.println(4.015*100);
      System.err.println(Arith.mul(4.015, new Integer(100)));

      System.out.println(123.3/100);
      System.err.println(Arith.div(123.3,100,2));
	double v=4.005;
	double v2=4;
	System.out.println(Arith.div(v, v2,3));
	
	System.out.println("----------------------");
	int count=0;
	int count2=0;
	AtomicInteger ai = new AtomicInteger();
	ai.getAndIncrement();
	/*for (;;) {
		int ni = ai.get();
		int next =ni+1 ;
		boolean b=	ai.compareAndSet(ni, next);
		if(b){
			System.out.println(++count+"成功,ni="+ni+"和next="+next);
		}
		System.err.println(++count2+"原始");
		//System.out.println(b);
		
	}*/
	System.err.println("----------------");

	
}
} 
