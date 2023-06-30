package com.sist.controller;

import static java.lang.annotation.ElementType.METHOD;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

import java.lang.annotation.Retention;
import java.lang.annotation.Target;

@Retention(RUNTIME)
@Target(METHOD)

/*
 * @Type
 * class class_name
 * {
 *    @Field
 *    private A a;
 *    
 *    @Constructor
 *    public class_name(){
 *    
 *    }
 *    
 *    @Method
 *    public void display(){
 *    
 *    }
 *    
 *    @RequestMapping
 *    public void display2(){
 *    
 *    }
 *    
 * }
 * 
 */
public @interface RequestMapping {
	public String value();

}
