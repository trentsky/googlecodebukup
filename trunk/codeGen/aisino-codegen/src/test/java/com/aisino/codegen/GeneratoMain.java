package com.aisino.codegen;

public class GeneratoMain {
    public static void main(String[] args) throws Exception {
        GeneratorFacade g = new GeneratorFacade();
        
        g.deleteOutRootDir();   //删除生成器的输出目录
//              g.generateByTable("table_name","template");     //通过数据库表生成文件,template为模板的根目录
//        g.generateByAllTable("template/springmvc_rest");       //自动搜索数据库中的所有表并生成文件,template为模板的根目录
        g.getGenerator().setTemplateRootDir("classpath:template");
//        g.getGenerator().setTemplateRootDir("classpath:template/struts2");
//        g.generateByAllTable();
        g.generateByTable("user_info");
//        g.deleteByTable("user_info");
//        g.printAllTableNames();
//              g.generateByClass(Blog.class,"template_clazz");
        
//              g.deleteByTable("table_name", "template"); //删除生成的文件
    }
}
