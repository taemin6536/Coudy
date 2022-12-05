package kr.spring.config;

import kr.spring.interceptor.StudyInterceptor;
import kr.spring.study.plan.artgumentResolver.LoginArgumentResolver;
import kr.spring.study.plan.testUtil.LoginTestInterceptor;
import kr.spring.study.studygroup.service.StudyGroupService;
import kr.spring.study.studygroup.service.StudyUserService;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;
import org.springframework.web.servlet.view.tiles3.TilesViewResolver;

import kr.spring.interceptor.LoginCheckInterceptor;
import kr.spring.interceptor.WriterCheckInterceptor;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

//자바코드 기반 설정 클래스

@Configuration
@RequiredArgsConstructor
public class AppConfig implements WebMvcConfigurer {

    WriterCheckInterceptor interceptor;
    private final StudyUserService studyUserService;
    private final StudyGroupService studyGroupService;

    //WriterCheckInterceptor에서 BoardService 객체를
    //주입받아야 하기때문에 Bean 객체로 등록함
    @Bean
    public WriterCheckInterceptor interceptor() {
        interceptor = new WriterCheckInterceptor();
        return interceptor;
    }

	//인터셉터 지정
	@Override
	public void addInterceptors(
			       InterceptorRegistry registry) {
		registry.addInterceptor(
				    new LoginCheckInterceptor())
				.order(1)
		        .addPathPatterns("/member/myPage.do")
		        .addPathPatterns("/member/update.do")
		        .addPathPatterns("/member/delete.do")
				.addPathPatterns("/study/studydetail.do")
				.addPathPatterns("/study/studygroupcreate.do")
				.addPathPatterns("/techblog/techblogWrite.do")
				.addPathPatterns("/member/changePassword.do")
				.addPathPatterns("/techblog/techblogUpdate.do")

                .addPathPatterns("/techblog/techblogDelete.do")
                .addPathPatterns("/notice/Write.do")
                .addPathPatterns("/notice/Update.do")
                .addPathPatterns("/notice/Delete.do")
                //TODO 표현식으로 정리

                .addPathPatterns("/techblog/techblogDelete.do")
                .addPathPatterns("/notice/Write.do")
                .addPathPatterns("/notice/Update.do")
                .addPathPatterns("/notice/Delete.do")
                .addPathPatterns("/member/admin_update.do")
                .addPathPatterns("/member/admin_list.do")
                .addPathPatterns("/chat/**")
                .addPathPatterns("/study/todo/**")
                .addPathPatterns("/study/plan/**")
                .addPathPatterns("/study/studymain.do");


        registry.addInterceptor(interceptor)
                .order(2)
                .addPathPatterns("/techblog/techblogUpdate.do")
                .addPathPatterns("/techblog/techblogDelete.do");

        registry.addInterceptor(new StudyInterceptor(studyUserService, studyGroupService))
                .order(3)
                .addPathPatterns("/study/todo/**")
                .addPathPatterns("/study/studymain.do")
                .addPathPatterns("/study/plan/**");
		//테스트 용 기능
//		registry.addInterceptor(new LoginTestInterceptor())
//				.order(4)
//				.addPathPatterns(Arrays.asList("/**"));

	}

	@Override
	public void addArgumentResolvers(List<HandlerMethodArgumentResolver> resolvers) {
		resolvers.add(new LoginArgumentResolver());
	}
	@Bean
	public TilesConfigurer tilesConfigurer() {
		final TilesConfigurer configurer =
				new TilesConfigurer();

		//해당 경로에 xml 설정 파일을 넣음
		configurer.setDefinitions(new String[] {
				"/WEB-INF/tiles-def/main.xml",
				"/WEB-INF/tiles-def/first.xml",
				"/WEB-INF/tiles-def/second.xml",
				"/WEB-INF/tiles-def/secondMain.xml",
				"/WEB-INF/tiles-def/third.xml",
				"/WEB-INF/tiles-def/forth.xml",
				"/WEB-INF/tiles-def/fifth.xml",
				"/WEB-INF/tiles-def/sixth.xml",
				"/WEB-INF/tiles-def/techblogwu.xml",
				"/WEB-INF/tiles-def/mainV2.xml",
				"/WEB-INF/tiles-def/techblog.xml"
		});
		configurer.setCheckRefresh(true);
		return configurer;
	}

	@Bean
	public TilesViewResolver tilesViewResolver() {
		final TilesViewResolver tilesViewResolver =
				new TilesViewResolver();
		tilesViewResolver.setViewClass(TilesView.class);
		return tilesViewResolver;
	}

}


