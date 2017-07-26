package gr.iteam.istqbexams.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.EnumSet;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.authentication.AuthenticationTrustResolver;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.rememberme.PersistentTokenBasedRememberMeServices;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import gr.iteam.istqbexams.model.CorrectAnswer;
import gr.iteam.istqbexams.model.Courses;
import gr.iteam.istqbexams.model.Exam;
import gr.iteam.istqbexams.model.Question;
import gr.iteam.istqbexams.model.Result;
import gr.iteam.istqbexams.model.User;
import gr.iteam.istqbexams.model.UserProfile;
import gr.iteam.istqbexams.service.QuestionService;
import gr.iteam.istqbexams.service.ResultService;
import gr.iteam.istqbexams.service.UserProfileService;
import gr.iteam.istqbexams.service.UserService;
import gr.iteam.istqbexams.util.Parser;

@Controller
@RequestMapping("/")
public class Home {

	@Autowired
	QuestionService questionService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	ResultService resultService;
	
	@Autowired
	AuthenticationTrustResolver authenticationTrustResolver;
	
	@Autowired
	UserProfileService userProfileService;
	
	@Autowired
	MessageSource messageSource;

	@Autowired
	PersistentTokenBasedRememberMeServices persistentTokenBasedRememberMeServices;

	@RequestMapping(value = { "/","/home"}, method = RequestMethod.GET)
	public String home(ModelMap model) {
		if (isCurrentAuthenticationAnonymous()) {
			return "login";
		}
		model.addAttribute("loggedinuser", getPrincipal());
		return "home";
	}
	
	@RequestMapping(value = { "/list" }, method = RequestMethod.GET)
	public String list(ModelMap model) {
		List<Courses> courseList = new ArrayList<Courses>(EnumSet.allOf(Courses.class));
		if (isCurrentAuthenticationAnonymous()) {
			return "login";
		}
		model.addAttribute("courseList",courseList);
		model.addAttribute("loggedinuser", getPrincipal());
		return "selectcourse";
	}
	
	@RequestMapping(value = { "/list" }, method = RequestMethod.POST)
	public String list(ModelMap model, @RequestParam Courses course) {
		if (isCurrentAuthenticationAnonymous()) {
			return "login";
		}
		List<Question> questions = questionService.listFromCourse(course.toString());
		model.addAttribute("questions", questions);
		model.addAttribute("counter", questions.size());
		model.addAttribute("loggedinuser", getPrincipal());
		return "questionlist";
	}
	
	@RequestMapping(value = { "/random" }, method = RequestMethod.GET)
	public String randomList(ModelMap model) {
		if (isCurrentAuthenticationAnonymous()) {
			return "login";
		}
		List<Courses> courseList = new ArrayList<Courses>(EnumSet.allOf(Courses.class));
		model.addAttribute("courseList",courseList);
		model.addAttribute("loggedinuser", getPrincipal());
		return "start";
	}
	
	@RequestMapping(value = { "/random" }, method = RequestMethod.POST)
	public String randomList(@RequestParam Courses course, @RequestParam int ch1,@RequestParam int ch2,@RequestParam int ch3,@RequestParam int ch4,@RequestParam int ch5,@RequestParam int ch6, ModelMap model) {
		if (isCurrentAuthenticationAnonymous()) {
			return "login";
		}
		List<Question> ch1List = questionService.randomListFromChapter(course.toString(), ch1, 1);
		List<Question> ch2List = questionService.randomListFromChapter(course.toString(), ch2, 2);
		List<Question> ch3List = questionService.randomListFromChapter(course.toString(), ch3, 3);
		List<Question> ch4List = questionService.randomListFromChapter(course.toString(), ch4, 4);
		List<Question> ch5List = questionService.randomListFromChapter(course.toString(), ch5, 5);
		List<Question> ch6List = questionService.randomListFromChapter(course.toString(), ch6, 6);
		List<Question> questions = new ArrayList<>();
		for (Question question1 : ch1List) {
			questions.add(question1);
		}
		for (Question question2 : ch2List) {
			questions.add(question2);
		}
		for (Question question3 : ch3List) {
			questions.add(question3);
		}
		for (Question question4 : ch4List) {
			questions.add(question4);
		}
		for (Question question5 : ch5List) {
			questions.add(question5);
		}
		for (Question question6 : ch6List) {
			questions.add(question6);
		}
		Exam exam = new Exam();
		exam.setQuestionList(questions);
		model.addAttribute("random", exam);
		model.addAttribute("loggedinuser", getPrincipal());
		return "random";
	}

	@RequestMapping(value = { "/newquestion" }, method = RequestMethod.GET)
	public String newQuestion(ModelMap model) {
		if (isCurrentAuthenticationAnonymous()) {
			return "login";
		}
		Question question = new Question();
		List<CorrectAnswer> correctList = new ArrayList<CorrectAnswer>(EnumSet.allOf(CorrectAnswer.class));
		List<Courses> courseList = new ArrayList<Courses>(EnumSet.allOf(Courses.class));
		model.addAttribute("correct", correctList);
		model.addAttribute("course", courseList);
		model.addAttribute("question", question);
		model.addAttribute("edit", false);
		model.addAttribute("loggedinuser", getPrincipal());
		return "question";
	}

	@RequestMapping(value = { "/newquestion" }, method = RequestMethod.POST)
	public String saveUser(@Valid Question question, BindingResult result, ModelMap model) {
		if (isCurrentAuthenticationAnonymous()) {
			return "login";
		}
		System.out.println(question);
		questionService.saveOrUpdate(question);
		model.addAttribute("loggedinuser", getPrincipal());
		model.addAttribute("success", "Question " + question.getId() + " added successfully");
		return "success";
	}
	
	@RequestMapping(value = { "/edit-question-{id}" }, method = RequestMethod.GET)
	public String editQuestion(@PathVariable int id, ModelMap model) {
		if (isCurrentAuthenticationAnonymous()) {
			return "login";
		}
		Question question = questionService.findById(id);
		List<CorrectAnswer> correctList = new ArrayList<CorrectAnswer>(EnumSet.allOf(CorrectAnswer.class));
		model.addAttribute("question", question);
		model.addAttribute("correct", correctList);
		model.addAttribute("edit", true);
		model.addAttribute("loggedinuser", getPrincipal());
		return "question";
	}
	
	@RequestMapping(value = { "/edit-question-{id}" }, method = RequestMethod.POST)
	public String updateUser(@Valid Question question, BindingResult result,
			ModelMap model, @PathVariable int id) {
		if (isCurrentAuthenticationAnonymous()) {
			return "login";
		}
		question.setContext(Parser.parseString(question.getContext()));
		questionService.saveOrUpdate(question);
		model.addAttribute("loggedinuser", getPrincipal());
		model.addAttribute("success", "Question " + question.getId() + " updated successfully");
		return "success";
	}
	
	@RequestMapping(value = { "/testresults" }, method = RequestMethod.POST)
	public String checkResults(Exam random, BindingResult result,
			ModelMap model) {
		if (isCurrentAuthenticationAnonymous()) {
			return "login";
		}
		List<Question> qList = random.getQuestionList();
		List<Question> wrongList = new ArrayList<>();
		int resultCount = 0;
		int index = 1;
		for (Question question : qList) {
			if (question.getSelected()!=null && question.getSelected().equals(question.getCorrect())) {
				resultCount = resultCount +1;
			} else {
				Question wrongQuestion = questionService.findById(question.getId());
				wrongQuestion.setId(index);
				wrongList.add(wrongQuestion);
			}
			index++;
		}
		if (resultCount>=26) {			
			model.addAttribute("Passed", "Congrats you passed the test!!! You scored " + resultCount + " out of " + qList.size() + "!!!");
		} else {
			model.addAttribute("Failed", "You Failed the test, you scored " + resultCount + " out of " + qList.size());
		}
		model.addAttribute("wrong", wrongList);
		model.addAttribute("loggedinuser", getPrincipal());
		Result results = new Result();
		User user = userService.findBySSO(getPrincipal());
		double score = ((double)resultCount*100)/(double)qList.size();
		results.setDate(new Date());
		results.setScore(score);
		results.setUserId(user.getId());
		resultService.save(results);
		return "testresults";
	}
	
	@RequestMapping(value = { "/resultlist" }, method = RequestMethod.GET)
	public String resultList(ModelMap model) {
		List<User> userList = userService.findAllUsers();
		if (isCurrentAuthenticationAnonymous()) {
			return "login";
		}
		List<Result> results = resultService.list();
		for (Result result : results) {
			result.setUser(userService.findById(result.getUserId()).getFirstName() + " " + userService.findById(result.getUserId()).getLastName());
		}
		model.addAttribute("userList", userList);
		model.addAttribute("results", results);
		model.addAttribute("loggedinuser", getPrincipal());
		return "resultlist";
	}
	
	@RequestMapping(value = { "/usertestresults" }, method = RequestMethod.GET)
	public String resultList(ModelMap model, @RequestParam int id) {
		List<User> userList = userService.findAllUsers();
		if (isCurrentAuthenticationAnonymous()) {
			return "login";
		}
		List<Result> results = resultService.listByUser(id);
		for (Result result : results) {
			result.setUser(userService.findById(result.getUserId()).getFirstName() + " " + userService.findById(result.getUserId()).getLastName());
		}
		model.addAttribute("results", results);
		model.addAttribute("userList", userList);
		model.addAttribute("loggedinuser", getPrincipal());
		return "resultlist";
	}
	
	@RequestMapping(value = { "/userlist" }, method = RequestMethod.GET)
	public String listUsers(ModelMap model) {
		if (isCurrentAuthenticationAnonymous()) {
			return "login";
		}
		List<User> users = userService.findAllUsers();
		model.addAttribute("users", users);
		model.addAttribute("loggedinuser", getPrincipal());
		return "userslist";
	}
	
	@RequestMapping(value = { "/newuser" }, method = RequestMethod.GET)
	public String newUser(ModelMap model) {
		if (isCurrentAuthenticationAnonymous()) {
			return "login";
		}
		User user = new User();
		model.addAttribute("user", user);
		model.addAttribute("edit", false);
		model.addAttribute("loggedinuser", getPrincipal());
		return "registration";
	}
	
	@RequestMapping(value = { "/newuser" }, method = RequestMethod.POST)
	public String saveUser(@Valid User user, BindingResult result,
			ModelMap model) {
		if (isCurrentAuthenticationAnonymous()) {
			return "login";
		}
		if (result.hasErrors()) {
			return "registration";
		}

		if(!userService.isUserSSOUnique(user.getId(), user.getSsoId())){
			FieldError ssoError =new FieldError("user","ssoId",messageSource.getMessage("non.unique.ssoId", new String[]{user.getSsoId()}, Locale.getDefault()));
		    result.addError(ssoError);
			return "registration";
		}
		
		userService.saveUser(user);

		model.addAttribute("success", "User " + user.getFirstName() + " "+ user.getLastName() + " registered successfully");
		model.addAttribute("loggedinuser", getPrincipal());
		//return "success";
		return "registrationsuccess";
	}
	
	@RequestMapping(value = { "/edit-user-{ssoId}" }, method = RequestMethod.GET)
	public String editUser(@PathVariable String ssoId, ModelMap model) {
		if (isCurrentAuthenticationAnonymous()) {
			return "login";
		}
		User user = userService.findBySSO(ssoId);
		model.addAttribute("user", user);
		model.addAttribute("edit", true);
		model.addAttribute("loggedinuser", getPrincipal());
		return "registration";
	}
	
	/**
	 * This method will be called on form submission, handling POST request for
	 * updating user in database. It also validates the user input
	 */
	@RequestMapping(value = { "/edit-user-{ssoId}" }, method = RequestMethod.POST)
	public String updateUser(@Valid User user, BindingResult result,
			ModelMap model, @PathVariable String ssoId) {
		if (isCurrentAuthenticationAnonymous()) {
			return "login";
		}
		if (result.hasErrors()) {
			return "registration";
		}

		userService.updateUser(user);

		model.addAttribute("success", "User " + user.getFirstName() + " "+ user.getLastName() + " updated successfully");
		model.addAttribute("loggedinuser", getPrincipal());
		return "registrationsuccess";
	}
	
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logoutPage (HttpServletRequest request, HttpServletResponse response){
		if (isCurrentAuthenticationAnonymous()) {
			return "login";
		}
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null){    
			//new SecurityContextLogoutHandler().logout(request, response, auth);
			persistentTokenBasedRememberMeServices.logout(request, response, auth);
			SecurityContextHolder.getContext().setAuthentication(null);
		}
		return "redirect:/login?logout";
	}
	
	@RequestMapping(value = { "/delete-user-{ssoId}" }, method = RequestMethod.GET)
	public String deleteUser(@PathVariable String ssoId) {
		if (isCurrentAuthenticationAnonymous()) {
			return "login";
		}
		userService.deleteUserBySSO(ssoId);
		return "redirect:/list";
	}
	
	@RequestMapping(value = "/Access_Denied", method = RequestMethod.GET)
	public String accessDeniedPage(ModelMap model) {
		if (isCurrentAuthenticationAnonymous()) {
			return "login";
		}
		model.addAttribute("loggedinuser", getPrincipal());
		return "accessDenied";
	}
	
	@ModelAttribute("roles")
	public List<UserProfile> initializeProfiles() {
		return userProfileService.findAll();
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginPage() {
		if (isCurrentAuthenticationAnonymous()) {
			return "login";
	    } else {
	    	return "redirect:/list";  
	    }
	}
	
	private boolean isCurrentAuthenticationAnonymous() {
	    final Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	    return authenticationTrustResolver.isAnonymous(authentication);
	}
	
	private String getPrincipal(){
		String userName = null;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		if (principal instanceof UserDetails) {
			userName = ((UserDetails)principal).getUsername();
		} else {
			userName = principal.toString();
		}
		return userName;
	}

}
