package com.meatball.linkz.common.util;

public class Node4ChangeRoot {
	
	private String id;
	
	private String parentId;
	
	private Children children = new Children();
	
	 public String toStringForComboTree(){
		 String result = "{"  
			 + "\"id\":\"" + id + "\""  ;
		 if(children != null && children.getSize() != 0) {  
	    	result += ",\"children\" : " + children.toString();  
		 }else {  
	    	result += ", \"leaf\" : \"true\"";
	  }  
	      
	    return result + "}";  
	 }
	   
	 // 先序遍历，拼接JSON字符串  
	 public String toString() {    
		 String result =  id + ",";
			 
	    
		 if(children != null && children.getSize() != 0) {  
	    	result +=  children.toString4ChangeRoot();  
		 }
	      
	    return result;  
	 }  
	   
	 // 兄弟节点横向排序  
	 public void sortChildren() {  
		 if(children != null && children.getSize() != 0) {  
			 children.sortChildren();  
		 }  
	 }  
	   
	 // 添加孩子节点  
	 public void addChild(Node4ChangeRoot node) {  
	  this.children.addChild4ChangeRoot(node);  
	 }  
	

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public Children getChildren() {
		return children;
	}

	public void setChildren(Children children) {
		this.children = children;
	}


}
