package com.entity.view;

import com.entity.XiaoshoutongjiEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import org.apache.commons.beanutils.BeanUtils;
import java.lang.reflect.InvocationTargetException;

import java.io.Serializable;
 

/**
 * 销售统计
 * 后端返回视图实体辅助类   
 * （通常后端关联的表或者自定义的字段需要返回使用）
 * @author 
 * @email 
 * @date 2020-11-05 22:50:30
 */
@TableName("xiaoshoutongji")
public class XiaoshoutongjiView  extends XiaoshoutongjiEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	public XiaoshoutongjiView(){
	}
 
 	public XiaoshoutongjiView(XiaoshoutongjiEntity xiaoshoutongjiEntity){
 	try {
			BeanUtils.copyProperties(this, xiaoshoutongjiEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 		
	}
}
