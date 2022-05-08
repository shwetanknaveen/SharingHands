package com.sharinghand.home;

import static org.hamcrest.CoreMatchers.instanceOf;
import static org.junit.Assert.assertThat;

import org.junit.Before;
import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.web.servlet.ModelAndView;

import com.sharinghand.group.GroupstableController;
import com.sharinghand.login.UsertableService;
import com.sharinghand.users.UsersSubtableService;

public class MockitoGroupstableControllerTest {
	@InjectMocks
	GroupstableController groupstableController = new GroupstableController();
	
	@Mock
	UsertableService userService;
	
	@Mock
	UsersSubtableService userSubService;
	
	@Before
    public void init() {
        MockitoAnnotations.initMocks(this);
    }
	
	@Test
	public void createGroupTester()	{
		assertThat(groupstableController.createGroup(), instanceOf(ModelAndView.class));
	}
	
	@Test
	public void insertMembersTester()	{
		assertThat(groupstableController.insertMembers(), instanceOf(ModelAndView.class));
	}
}
