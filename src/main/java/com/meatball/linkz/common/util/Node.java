package com.meatball.linkz.common.util;

/**
 * 节点类
 * 2015-3-8
 * @author Link
 */
public class Node {
	 /** 
	  * 节点编号 
	  */  
	 public String id;
	 
	 public String contact;
	 
	 public String description;
	 
	 public String name;
	 
	 public String publishDate;
	 
	 public String type;
	 
	 public String address;
	 
	 /** 
	  * 父节点编号 
	  */  
	 public String parentId;  
	 /** 
	  * 孩子节点列表 
	  */
	 private Children children = new Children();
	 
	 public String toStringForComboTree(){
		 String result = "{"  
			 + "\"id\":\"" + id + "\""  
			 + ",\"text\":\"" + name + "\"";
		 if(children != null && children.getSize() != 0) {  
	    	result += ",\"children\" : " + children.toString();  
		 }else {  
	    	result += ", \"leaf\" : \"true\"";
	  }  
	      
	    return result + "}";  
	 }
	   
	 // 先序遍历，拼接JSON字符串  
	 public String toString() {    
		 String result = "{"  
			 + "\"id\":\"" + id + "\""  
			 + ",\"contact\":\"" + contact + "\""  
			 + ",\"description\":\"" + description + "\""  
			 + ",\"name\":\"" + name + "\""  
			 + ",\"publishDate\":\"" + publishDate + "\""  
			 + ",\"parentId\":\"" + parentId + "\""  
			 + ",\"address\":\"" + address + "\""  
			 + ",\"type\":\"" + type + "\""  ;
			 
	    
		 if(children != null && children.getSize() != 0) {  
	    	result += ",\"children\" : " + children.toString();  
		 }else {  
	    	result += ", \"leaf\" : \"true\"";
	  }  
	      
	    return result + "}";  
	 }  
	   
	 // 兄弟节点横向排序  
	 public void sortChildren() {  
		 if(children != null && children.getSize() != 0) {  
			 children.sortChildren();  
		 }  
	 }  
	   
	 // 添加孩子节点  
	 public void addChild(Node node) {  
	  this.children.addChild(node);  
	 }  
}
