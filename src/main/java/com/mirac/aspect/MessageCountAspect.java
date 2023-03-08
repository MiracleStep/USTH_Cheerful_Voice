package com.mirac.aspect;

import com.mirac.mapper.CountMapper;
import com.mirac.entity.Reply;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class MessageCountAspect {

	@Autowired
	private CountMapper countMapper;

	@Pointcut(value="execution(* com.mirac.service.impl.MessageServiceImpl.getMsg(..))")
	private void pointcut1(){}

	@Pointcut(value="execution(* com.mirac.service.impl.MessageServiceImpl.replyMsg(..))")
	private void pointcut2(){}
	

	@Before("pointcut1()")
	public void countLog(JoinPoint jp) {
		String name = jp.getSignature().getName();
		System.out.println("AOP增强："+name);
		Object[] args = jp.getArgs();
		int msgId = -1;
		if(args.length > 0){
			msgId = (int)args[0];
		}
		countMapper.updateAccessCount(msgId);
	}

	@AfterReturning("pointcut2()")
	public void countLog2(JoinPoint jp) {
		String name = jp.getSignature().getName();
		System.out.println("AOP增强："+name);
		Object[] args = jp.getArgs();
		Reply reply = null;
		if(args.length > 0){
			reply = (Reply)args[0];
		}
		if(reply!=null){
//			countdao.updateReplyCount(reply.getMsgid());
			return;
		}
	}
}
