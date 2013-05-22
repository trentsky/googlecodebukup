package com.aisino.codegen;

import com.aisino.codegen.provider.db.sql.SqlFactory;
import com.aisino.codegen.provider.db.sql.model.Sql;

public class GenerateBySqlDemoTest{
	
	
	public static void main(String[] args) throws Exception {
		GeneratorFacade generatorFacade = new GeneratorFacade();
		GeneratorContext.clear();
		GeneratorContext.put("basepackage","com.company.project");
		GeneratorContext.put("namespace","pages");
		GeneratorContext.put("appModule","shared");
		GeneratorContext.put("className","User");
		GeneratorContext.put("tableClassName","UserInfo");
		Sql sql = new SqlFactory().parseSql("select * from user_info where username=#username# and password=#password#");
		sql.setMultiplicity("many");  //many or one
		sql.setOperation("findByUsernameAndPassword");
		sql.setRemarks("根据用户名及密码进行查询");
		generatorFacade.getGenerator().setTemplateRootDir("classpath:for_test_select_sql");
		generatorFacade.generateBySql(sql);
	}
	
}
