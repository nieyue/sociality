package com.nieyue.util;

import org.apache.poi.ss.formula.functions.T;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 数字类
 * @author yy
 *
 */
public class NumberUtil<T> {
	/**
	 * 是否数字
	 * @param str
	 * @return
	 */
	public static boolean isNumeric(String str){
		   Pattern pattern = Pattern.compile("[1-9][0-9]*$");
		   if(str==null){
			   return false;
		   }
		   Matcher isNum = pattern.matcher(str);
		   if(!isNum.matches() ){
		       return false;
		   }
		   return true;
		}
	/**
	 * 随机选择count个
	 * @param list 待选列表
	 * @param count 选择数量
	 * @return
	 */
	public  List<T> getRandomArrayElements(List<T> list, Integer count) {
		List<T> shuffled = list;
		int i = list.size();
		int min = i - count;
		if(min<0){
			//选择的数量比总数多
			count=i;
			min=0;
		}
		T temp;
		int  index;
		while (i-- > min) {
			index =new Random().nextInt(i + 1);
			temp = shuffled.get(index);
			shuffled.set(index,shuffled.get(i));
			shuffled.set(i,temp);
		}
		return shuffled.subList(min,list.size());
	}
	/**
	 * 数字转换工具
	 * @param str
	 * @return
	 */
	public static class Tool {  
	    //数字位  
	    public static String[] chnNumChar = {"零","一","二","三","四","五","六","七","八","九"};  
	    public static char[] chnNumChinese = {'零','一','二','三','四','五','六','七','八','九'};  
	    //节权位  
	    public static String[] chnUnitSection = {"","万","亿","万亿"};    
	    //权位  
	    public static String[] chnUnitChar = {"","十","百","千"};  
	    public static HashMap intList = new HashMap();  
	    static{  
	        for(int i=0;i<chnNumChar.length;i++){  
	            intList.put(chnNumChinese[i], i);  
	        }  
	          
	        intList.put('十',10);  
	        intList.put('百',100);  
	        intList.put('千', 1000);  
	    }
	}
	   /**
	    * 数字转中文
	    * @param num
	    * @return
	    */
	 public static String numberToChinese(int num){//转化一个阿拉伯数字为中文字符串  
	        if(num == 0){  
	            return "零";  
	        }  
	        int unitPos = 0;//节权位标识  
	        String All = new String();  
	        String chineseNum = new String();//中文数字字符串  
	        boolean needZero = false;//下一小结是否需要补零  
	        String strIns = new String();  
	        while(num>0){  
	            int section = num%10000;//取最后面的那一个小节  
	            if(needZero){//判断上一小节千位是否为零，为零就要加上零  
	                All = Tool.chnNumChar[0] + All;  
	            }  
	            chineseNum = sectionTOChinese(section,chineseNum);//处理当前小节的数字,然后用chineseNum记录当前小节数字  
	            if( section!=0 ){//此处用if else 选择语句来执行加节权位  
	                strIns = Tool.chnUnitSection[unitPos];//当小节不为0，就加上节权位  
	                chineseNum = chineseNum + strIns;  
	            }else{  
	                strIns = Tool.chnUnitSection[0];//否则不用加  
	                chineseNum = strIns + chineseNum;  
	            }  
	            All = chineseNum+All;  
	            chineseNum = "";  
	            needZero = (section<1000) && (section>0);  
	            num = num/10000;  
	            unitPos++;  
	        }  
	        return All;  
	    }  
	    public static String sectionTOChinese(int section,String chineseNum){  
	        String setionChinese = new String();//小节部分用独立函数操作  
	        int unitPos = 0;//小节内部的权值计数器  
	        boolean zero = true;//小节内部的制零判断，每个小节内只能出现一个零  
	        while(section>0){  
	            int v = section%10;//取当前最末位的值  
	            if(v == 0){  
	                if( !zero ){  
	                    zero = true;//需要补零的操作，确保对连续多个零只是输出一个  
	                    chineseNum = Tool.chnNumChar[0] + chineseNum;  
	                }  
	            }else{  
	                zero = false;//有非零的数字，就把制零开关打开  
	                setionChinese = Tool.chnNumChar[v];//对应中文数字位  
	                setionChinese = setionChinese + Tool.chnUnitChar[unitPos];//对应中文权位  
	                chineseNum = setionChinese + chineseNum;  
	            }  
	            unitPos++;  
	            section = section/10;  
	        }  
	          
	        return chineseNum;  
	    }  
	    /**
	     * 中文转数字
	     * @author 聂跃
	     * @date 2017年9月22日
	     */
	        public static int chineseToNumber(String str){  
	            String str1 = new String();  
	            String str2 = new String();  
	            String str3 = new String();  
	            int k = 0;  
	            boolean dealflag = true;  
	            for(int i=0;i<str.length();i++){//先把字符串中的“零”除去  
	                    if('零' == (str.charAt(i))){  
	                        str = str.substring(0, i) + str.substring(i+1);  
	                    }  
	            }  
	            String chineseNum = str;  
	            for(int i=0;i<chineseNum.length();i++){  
	                if(chineseNum.charAt(i) == '亿'){  
	                    str1 = chineseNum.substring(0,i);//截取亿前面的数字，逐个对照表格，然后转换  
	                    k = i+1;  
	                    dealflag = false;//已经处理  
	                }  
	                if(chineseNum.charAt(i) == '万'){  
	                    str2 = chineseNum.substring(k,i);  
	                    str3 = str.substring(i+1);  
	                    dealflag = false;//已经处理  
	                }  
	            }  
	            if(dealflag){//如果没有处理  
	                str3 =  chineseNum;  
	            }  
	            int result = sectionChinese(str1) * 100000000 +  
	                    sectionChinese(str2) * 10000 + sectionChinese(str3);  
	            return result;  
	        }  
	          
	        public static int sectionChinese(String str){  
	            int value = 0;  
	            int sectionNum = 0;  
	            for(int i=0;i<str.length();i++){  
	                int v = (int) Tool.intList.get(str.charAt(i));  
	                if( v == 10 || v == 100 || v == 1000 ){//如果数值是权位则相乘  
	                    sectionNum = v * sectionNum;  
	                    value = value + sectionNum;  
	                }else if(i == str.length()-1){  
	                    value = value + v;  
	                }else{  
	                    sectionNum = v;  
	                }  
	            }  
	            return value;  
	        }  
	public static void main(String[] args) {
		String aa="1435435";
		System.out.println(NumberUtil.isNumeric(aa));
		 String navigator="192.168.5.1245.0 (iPhone; CPU iPhone OS 10_2 like Mac OS X) AppleWebKit/602.3.12 (KHTML, like Gecko) Mobile/14C92 Html5Plus/1.0";
		   System.out.println(navigator.indexOf("iPhone"));
	        System.out.println("二十亿零五千五百零一万四千零一十:"+chineseToNumber("二十亿零五千五百零一万四千零一十"));  
	        System.out.println("二千万一千零七:"+chineseToNumber("二千万一千零七"));  
	        System.out.println("二万零一:"+chineseToNumber("二万零一"));  
	        System.out.println("二万零一十:"+chineseToNumber("二万零一十"));  
	        System.out.println("一万:"+chineseToNumber("一万"));  
	        System.out.println("一千零一十五:"+chineseToNumber("一千零一十五"));  
	        System.out.println("一千:"+chineseToNumber("一千"));  
	        System.out.println("一亿:"+chineseToNumber("一亿"));
		List<String> list =new ArrayList<>();
		for (int i = 0; i < 10; i++) {
			list.add("测试"+(i+1));
		}
		System.out.println(new NumberUtil().getRandomArrayElements(list,10));
		   
	}
}

