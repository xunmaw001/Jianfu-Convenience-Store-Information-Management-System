package com.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Map;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import com.utils.ValidatorUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.annotation.IgnoreAuth;

import com.entity.GongyingshangEntity;
import com.entity.view.GongyingshangView;

import com.service.GongyingshangService;
import com.service.TokenService;
import com.utils.PageUtils;
import com.utils.R;
import com.utils.MPUtil;
import com.utils.CommonUtil;


/**
 * 供应商
 * 后端接口
 * @author 
 * @email 
 * @date 2020-11-05 22:50:30
 */
@RestController
@RequestMapping("/gongyingshang")
public class GongyingshangController {
    @Autowired
    private GongyingshangService gongyingshangService;
    
	@Autowired
	private TokenService tokenService;
	
	/**
	 * 登录
	 */
	@IgnoreAuth
	@RequestMapping(value = "/login")
	public R login(String username, String password, String captcha, HttpServletRequest request) {
		GongyingshangEntity user = gongyingshangService.selectOne(new EntityWrapper<GongyingshangEntity>().eq("zhanghao", username));
		if(user==null || !user.getMima().equals(password)) {
			return R.error("账号或密码不正确");
		}
		String token = tokenService.generateToken(user.getId(), username,"gongyingshang",  "供应商" );
		return R.ok().put("token", token);
	}
	
	/**
     * 注册
     */
	@IgnoreAuth
    @RequestMapping("/register")
    public R register(@RequestBody GongyingshangEntity gongyingshang){
    	//ValidatorUtils.validateEntity(gongyingshang);
    	GongyingshangEntity user = gongyingshangService.selectOne(new EntityWrapper<GongyingshangEntity>().eq("zhanghao", gongyingshang.getZhanghao()));
		if(user!=null) {
			return R.error("注册用户已存在");
		}
		Long uId = new Date().getTime();
		gongyingshang.setId(uId);
        gongyingshangService.insert(gongyingshang);
        return R.ok();
    }
	
	/**
	 * 退出
	 */
	@RequestMapping("/logout")
	public R logout(HttpServletRequest request) {
		request.getSession().invalidate();
		return R.ok("退出成功");
	}
	
	/**
     * 获取用户的session用户信息
     */
    @RequestMapping("/session")
    public R getCurrUser(HttpServletRequest request){
    	Long id = (Long)request.getSession().getAttribute("userId");
        GongyingshangEntity user = gongyingshangService.selectById(id);
        return R.ok().put("data", user);
    }
    
    /**
     * 密码重置
     */
    @IgnoreAuth
	@RequestMapping(value = "/resetPass")
    public R resetPass(String username, HttpServletRequest request){
    	GongyingshangEntity user = gongyingshangService.selectOne(new EntityWrapper<GongyingshangEntity>().eq("zhanghao", username));
    	if(user==null) {
    		return R.error("账号不存在");
    	}
    	user.setMima("123456");
        gongyingshangService.updateById(user);
        return R.ok("密码已重置为：123456");
    }


    /**
     * 后端列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,GongyingshangEntity gongyingshang, HttpServletRequest request){

        EntityWrapper<GongyingshangEntity> ew = new EntityWrapper<GongyingshangEntity>();
    	PageUtils page = gongyingshangService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, gongyingshang), params), params));
		request.setAttribute("data", page);
        return R.ok().put("data", page);
    }
    
    /**
     * 前端列表
     */
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params,GongyingshangEntity gongyingshang, HttpServletRequest request){
        EntityWrapper<GongyingshangEntity> ew = new EntityWrapper<GongyingshangEntity>();
    	PageUtils page = gongyingshangService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, gongyingshang), params), params));
		request.setAttribute("data", page);
        return R.ok().put("data", page);
    }

	/**
     * 列表
     */
    @RequestMapping("/lists")
    public R list( GongyingshangEntity gongyingshang){
       	EntityWrapper<GongyingshangEntity> ew = new EntityWrapper<GongyingshangEntity>();
      	ew.allEq(MPUtil.allEQMapPre( gongyingshang, "gongyingshang")); 
        return R.ok().put("data", gongyingshangService.selectListView(ew));
    }

	 /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(GongyingshangEntity gongyingshang){
        EntityWrapper< GongyingshangEntity> ew = new EntityWrapper< GongyingshangEntity>();
 		ew.allEq(MPUtil.allEQMapPre( gongyingshang, "gongyingshang")); 
		GongyingshangView gongyingshangView =  gongyingshangService.selectView(ew);
		return R.ok("查询供应商成功").put("data", gongyingshangView);
    }
	
    /**
     * 后端详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") String id){
        GongyingshangEntity gongyingshang = gongyingshangService.selectById(id);
        return R.ok().put("data", gongyingshang);
    }

    /**
     * 前端详情
     */
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") String id){
        GongyingshangEntity gongyingshang = gongyingshangService.selectById(id);
        return R.ok().put("data", gongyingshang);
    }
    



    /**
     * 后端保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody GongyingshangEntity gongyingshang, HttpServletRequest request){
    	gongyingshang.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
    	//ValidatorUtils.validateEntity(gongyingshang);
    	GongyingshangEntity user = gongyingshangService.selectOne(new EntityWrapper<GongyingshangEntity>().eq("zhanghao", gongyingshang.getZhanghao()));
		if(user!=null) {
			return R.error("用户已存在");
		}

		gongyingshang.setId(new Date().getTime());
        gongyingshangService.insert(gongyingshang);
        return R.ok();
    }
    
    /**
     * 前端保存
     */
    @RequestMapping("/add")
    public R add(@RequestBody GongyingshangEntity gongyingshang, HttpServletRequest request){
    	gongyingshang.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
    	//ValidatorUtils.validateEntity(gongyingshang);
    	GongyingshangEntity user = gongyingshangService.selectOne(new EntityWrapper<GongyingshangEntity>().eq("zhanghao", gongyingshang.getZhanghao()));
		if(user!=null) {
			return R.error("用户已存在");
		}

		gongyingshang.setId(new Date().getTime());
        gongyingshangService.insert(gongyingshang);
        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody GongyingshangEntity gongyingshang, HttpServletRequest request){
        //ValidatorUtils.validateEntity(gongyingshang);
        gongyingshangService.updateById(gongyingshang);//全部更新
        return R.ok();
    }
    

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
        gongyingshangService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }
    
    /**
     * 提醒接口
     */
	@RequestMapping("/remind/{columnName}/{type}")
	public R remindCount(@PathVariable("columnName") String columnName, HttpServletRequest request, 
						 @PathVariable("type") String type,@RequestParam Map<String, Object> map) {
		map.put("column", columnName);
		map.put("type", type);
		
		if(type.equals("2")) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Calendar c = Calendar.getInstance();
			Date remindStartDate = null;
			Date remindEndDate = null;
			if(map.get("remindstart")!=null && !map.get("remindstart").toString().equals("")) {
				Integer remindStart = Integer.parseInt(map.get("remindstart").toString());
				c.setTime(new Date()); 
				c.add(Calendar.DAY_OF_MONTH,remindStart);
				remindStartDate = c.getTime();
				map.put("remindstart", sdf.format(remindStartDate));
			}
			if(map.get("remindend")!=null && !map.get("remindend").toString().equals("")) {
				Integer remindEnd = Integer.parseInt(map.get("remindend").toString());
				c.setTime(new Date());
				c.add(Calendar.DAY_OF_MONTH,remindEnd);
				remindEndDate = c.getTime();
				map.put("remindend", sdf.format(remindEndDate));
			}
		}
		
		Wrapper<GongyingshangEntity> wrapper = new EntityWrapper<GongyingshangEntity>();
		if(map.get("remindstart")!=null && !map.get("remindstart").toString().equals("")) {
			wrapper.ge(columnName, map.get("remindstart"));
		}
		if(map.get("remindend")!=null && !map.get("remindend").toString().equals("")) {
			wrapper.le(columnName, map.get("remindend"));
		}


		int count = gongyingshangService.selectCount(wrapper);
		return R.ok().put("count", count);
	}
	
	


}
