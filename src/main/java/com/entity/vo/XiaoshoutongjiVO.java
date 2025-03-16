package com.entity.vo;

import com.entity.XiaoshoutongjiEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
 

/**
 * 销售统计
 * 手机端接口返回实体辅助类 
 * （主要作用去除一些不必要的字段）
 * @author 
 * @email 
 * @date 2020-11-05 22:50:30
 */
public class XiaoshoutongjiVO  implements Serializable {
	private static final long serialVersionUID = 1L;

	 			
	/**
	 * 周期
	 */
	
	private String zhouqi;
		
	/**
	 * 营业总额
	 */
	
	private Integer yingyezonge;
		
	/**
	 * 登记日期
	 */
		
	@JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat 
	private Date dengjiriqi;
		
	/**
	 * 工号
	 */
	
	private String gonghao;
				
	
	/**
	 * 设置：周期
	 */
	 
	public void setZhouqi(String zhouqi) {
		this.zhouqi = zhouqi;
	}
	
	/**
	 * 获取：周期
	 */
	public String getZhouqi() {
		return zhouqi;
	}
				
	
	/**
	 * 设置：营业总额
	 */
	 
	public void setYingyezonge(Integer yingyezonge) {
		this.yingyezonge = yingyezonge;
	}
	
	/**
	 * 获取：营业总额
	 */
	public Integer getYingyezonge() {
		return yingyezonge;
	}
				
	
	/**
	 * 设置：登记日期
	 */
	 
	public void setDengjiriqi(Date dengjiriqi) {
		this.dengjiriqi = dengjiriqi;
	}
	
	/**
	 * 获取：登记日期
	 */
	public Date getDengjiriqi() {
		return dengjiriqi;
	}
				
	
	/**
	 * 设置：工号
	 */
	 
	public void setGonghao(String gonghao) {
		this.gonghao = gonghao;
	}
	
	/**
	 * 获取：工号
	 */
	public String getGonghao() {
		return gonghao;
	}
			
}
