package com.basic.reserve.util;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MybatisConfig {

	private static SqlSessionFactory sqlSessionFactory;
	
	static {
		   try { 
			   String resource = "com/basic/reserve/mybatis/config.xml";
			   InputStream inputStream = Resources.getResourceAsStream(resource);//읽기
			   sqlSessionFactory =new SqlSessionFactoryBuilder().build(inputStream); 
		   }catch(Exception e) {
			   e.printStackTrace();
		   }
	}
	
	public static SqlSessionFactory getInstance() {
		return sqlSessionFactory;
	}
	
}
