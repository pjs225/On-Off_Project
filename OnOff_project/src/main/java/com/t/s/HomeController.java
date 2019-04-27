
package com.t.s;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Properties;
import java.util.UUID;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.WebUtils;

import com.t.s.domain.Criteria;
import com.t.s.domain.PageMaker;
import com.t.s.domain.PageMaker2;
import com.t.s.domain.SearchCriteria;
import com.t.s.model.biz.FreeBoardAnsBiz;
import com.t.s.model.biz.FreeBoardBiz;
import com.t.s.model.biz.GroupBiz;
import com.t.s.model.biz.GroupUserBiz;
import com.t.s.model.biz.ImgBoardAnsBiz;
import com.t.s.model.biz.ImgBoardBiz;
import com.t.s.model.biz.MoimBiz;
import com.t.s.model.biz.MoimBizImpl;
import com.t.s.model.biz.MoimUserBiz;
import com.t.s.model.biz.UserBiz;
import com.t.s.model.dto.FreeBoardAnsDto;
import com.t.s.model.dto.FreeBoardDto;
import com.t.s.model.dto.GroupDto;
import com.t.s.model.dto.GroupUserDto;
import com.t.s.model.dto.ImgBoardAnsDto;
import com.t.s.model.dto.ImgBoardDto;
import com.t.s.model.dto.MoimDto;
import com.t.s.model.dto.MoimUserDto;
import com.t.s.model.dto.UserDto;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@RequestMapping(value = "/index.do", method = RequestMethod.GET)
	public String home(HttpSession session, Model model, @ModelAttribute("sc") SearchCriteria sc) {

		if (session.getAttribute("dto") != null) {
			model.addAttribute("dto", session.getAttribute("dto"));
		}
		// SearchCriteria sc = new SearchCriteria();
		PageMaker2 pageMaker = new PageMaker2();
		pageMaker.setCri(sc);
		pageMaker.setTotalCount(groupbiz.groupSearch_searchCount(sc));
		model.addAttribute("pageMaker", pageMaker);

		return "index";
	}
//

	@RequestMapping(value = "/moim.do", method = RequestMethod.GET)
	public String moim(HttpSession session, Model model, Criteria cri, int groupno) {

		if (session.getAttribute("dto") != null) {
			model.addAttribute("dto", session.getAttribute("dto"));
		}

		model.addAttribute("groupno", groupno);
		// 리스트, 페이징
		cri.setGroupno(groupno);
		List<MoimDto> list = moimbiz.listPage(cri);
		model.addAttribute("list", list);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(moimbiz.listCount(cri.getGroupno()));
		model.addAttribute("pageMaker", pageMaker);

		return "moim";
	}

	@RequestMapping(value = "/calAjax.do", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	@ResponseBody
	public String calAjax(Criteria cri, HttpServletResponse resp, int groupno) {

		resp.setContentType("text/html; charset=UTF-8");

		System.out.println(">" + groupno);

		// 달력 만들 리스트 가져오기(Json형태로 파싱)
		List<MoimDto> calList = moimbiz.selectMoimList(groupno);
		/*
		 * System.out.println(calList.get(1).toString());
		 * System.out.println(calList.get(1).getMoimtitle());
		 * System.out.println(calList.size());
		 */

		// Json 객체
		JSONObject obj = new JSONObject();

		// Json Array정보 담을 객체
		JSONArray jsonCalList = new JSONArray();

		// Json Array에 담기
		for (int i = 0; i < calList.size(); i++) {

			// JSONObject 만들어서 객체 정보 넣기
			JSONObject calListInfo = new JSONObject();

			calListInfo.put("title", calList.get(i).getMoimtitle());
			calListInfo.put("addr", calList.get(i).getMoimaddr());
			calListInfo.put("start", calList.get(i).getMoimdate());
			calListInfo.put("url", "moimDetail.do?moimno=" + calList.get(i).getMoimno() + "&groupno=" + groupno);

			// Json Array에 넣기
			jsonCalList.add(calListInfo);
		}
		;
		// Json 객체에 넣기
		obj.put("events", jsonCalList);

		System.out.println(jsonCalList);
		System.out.println(obj.toString());

		return obj.toString();
	}

	@RequestMapping(value = "/mycalAjax.do", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	@ResponseBody
	public String mycalAjax(Criteria cri, HttpServletResponse resp, String userid) {

		resp.setContentType("text/html; charset=UTF-8");

		System.out.println("mycalAjax로 온 아이디 : " + userid);

		// 달력 만들 리스트 가져오기(Json형태로 파싱)
		/* List<MoimDto> calList = moimbiz.selectMoimList(); */
		List<MoimDto> mycalList = moimbiz.selectmyMoimList(userid);

		System.out.println(mycalList.size());

		/*
		 * System.out.println(mycalList.get(1).toString());
		 * System.out.println(mycalList.get(1).getMoimtitle());
		 * System.out.println(mycalList.size());
		 */

		// Json 객체
		JSONObject obj = new JSONObject();

		// Json Array정보 담을 객체
		JSONArray jsonCalList = new JSONArray();

		// Json Array에 담기
		for (int i = 0; i < mycalList.size(); i++) {

			// JSONObject 만들어서 객체 정보 넣기
			JSONObject calListInfo = new JSONObject();

			calListInfo.put("title", mycalList.get(i).getMoimtitle());
			calListInfo.put("addr", mycalList.get(i).getMoimaddr());
			calListInfo.put("start", mycalList.get(i).getMoimdate());
			calListInfo.put("url", "moimDetail.do?moimno=" + mycalList.get(i).getMoimno() + "&groupno="
					+ mycalList.get(i).getGroupno());

			// Json Array에 넣기
			jsonCalList.add(calListInfo);
		}
		;
		// Json 객체에 넣기
		obj.put("events", jsonCalList);

		System.out.println(jsonCalList);
		System.out.println(obj.toString());

		return obj.toString();
	}

	@RequestMapping(value = "/moimDetail.do", method = RequestMethod.GET)
	public String moimDetail(HttpSession session, Model model, int moimno, int groupno) {

		if (session.getAttribute("dto") != null) {
			model.addAttribute("dto", session.getAttribute("dto"));
		}
		model.addAttribute("groupno", groupno);
		model.addAttribute("res", moimbiz.selectMoim(moimno));

		/*
		 * MoimDto res = moimbiz.selectMoim(moimno);
		 * 
		 * model.addAttribute("res", res);
		 */

		return "moimDetail";
	}

	@Autowired
	private GroupBiz groupbiz;

	@RequestMapping(value = "/search.do", method = RequestMethod.GET)
	public String search(Model model, HttpSession session, @ModelAttribute("sc") SearchCriteria sc) {

		if (session.getAttribute("dto") != null) {
			model.addAttribute("dto", session.getAttribute("dto"));
		}

		List<GroupDto> list = groupbiz.groupSearch_search(sc);
		model.addAttribute("list", list);

		PageMaker2 pageMaker = new PageMaker2();
		pageMaker.setCri(sc);
		pageMaker.setTotalCount(groupbiz.groupSearch_searchCount(sc));
		model.addAttribute("pageMaker", pageMaker);

		return "search";
	}

	@Autowired
	private MoimBiz moimbiz;

	@RequestMapping(value = "/mapRes.do", method = RequestMethod.POST)
	public String mapRes(HttpSession session, Locale locale, Model model, MoimDto moimdto) {

		Date date = new Date();

		moimdto.setMoimregdate(date);

		int res = moimbiz.insertMoim(moimdto);

		if (session.getAttribute("dto") != null) {

			if (res > 0) {
				model.addAttribute("dto", session.getAttribute("dto"));
			}
		}
		
		//인서트 모임 후에 디비 접근해서
		//최신 moim을 찾아서 유저 인서트를 한다 ㅇㅇ
		MoimUserDto moimuserdto = new MoimUserDto();
		moimuserdto.setGroupno(moimdto.getGroupno());
		moimuserdto.setUserid(moimdto.getUserid());
		
		int moimno = moimUserBiz.findMoimNo(moimuserdto);
		moimuserdto.setMoimno(moimno);
		
		int join = moimUserBiz.moimjoin(moimuserdto);

		return "redirect:moim.do?groupno=" + moimdto.getGroupno();
	}

	@RequestMapping(value = "/moimwrite.do", method = RequestMethod.GET)
	public String moimwrite(HttpSession session, Model model, int groupno) {

		if (session.getAttribute("dto") != null) {
			model.addAttribute("dto", session.getAttribute("dto"));
		}

		model.addAttribute("groupno", groupno);

		return "moimwrite";
	}

	/* 업로드================================= */
	@RequestMapping(value = "/coding.do")
	public String coding() {
		return "coding";
	}

	@RequestMapping(value = "/insertBoard.do", method = RequestMethod.POST)
	public String insertBoard(String editor) {
		System.err.println("저장할 내용 : " + editor);
		return "redirect:/coding.do";
	}

	// 다중파일업로드
	@RequestMapping(value = "/file_uploader_html5.do", method = RequestMethod.POST)
	@ResponseBody
	public String multiplePhotoUpload(HttpServletRequest request) {
		// 파일정보
		StringBuffer sb = new StringBuffer();
		try {
			// 파일명을 받는다 - 일반 원본파일명
			String oldName = request.getHeader("file-name");
			// 파일 기본경로 _ 상세경로
			String filePath = WebUtils.getRealPath(request.getSession().getServletContext(), "/photoUpload/");

			File folder = new File(WebUtils.getRealPath(request.getSession().getServletContext(), "/photoUpload"));

			if (!folder.exists()) {
				folder.mkdirs();
			}

			String saveName = sb.append(new SimpleDateFormat("yyyyMMddHHmmss").format(System.currentTimeMillis()))
					.append(UUID.randomUUID().toString()).append(oldName.substring(oldName.lastIndexOf(".")))
					.toString();
			System.out.println(filePath + saveName);
			InputStream is = request.getInputStream();
			OutputStream os = new FileOutputStream(filePath + saveName);
			int numRead;
			byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
			while ((numRead = is.read(b, 0, b.length)) != -1) {
				os.write(b, 0, numRead);
			}
			os.flush();
			os.close();
			// 정보 출력
			sb = new StringBuffer();
			sb.append("&bNewLine=true").append("&sFileName=").append(oldName).append("&sFileURL=")
					.append(request.getContextPath() + "/photoUpload/").append(saveName);
			System.out.println(sb.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sb.toString();
	}
	/* 업로드 끝=============================================== */

	/////////////////////////////////////////////////////////////////
	// 로그인
	@Autowired
	private UserBiz biz;

	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String login() {

		return "login";
	}

	@RequestMapping(value = "/loginajax.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Boolean> login(String id, @RequestParam("pw") String password, HttpSession session) {

		UserDto dto = biz.login(id, password);
		boolean loginchk = false;

		if (dto != null) {
			session.setAttribute("dto", dto);
			session.setAttribute("id", id);
			loginchk = true;
		}

		Map<String, Boolean> res = new HashMap<String, Boolean>();
		res.put("loginchk", loginchk);

		return res;
	}

	// 로그아웃
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String login(HttpSession session) {

		if (session.getAttribute("dto") != null) {
			session.invalidate();
		}

		return "redirect:index.jsp";
	}

	// 회원가입폼
	@RequestMapping(value = "/registUser.do", method = RequestMethod.GET)
	public String registUser() {

		return "registUser";
	}

	// 회원가입
	@RequestMapping(value = "/regist.do", method = RequestMethod.POST)
	public String regist(@ModelAttribute UserDto dto) {

		int res = biz.regist(dto);

		if (res > 0) {
			return "registOk";
		} else {
			return "redirect:registUser.do";
		}
	}

	// 아이디 중복확인
	@RequestMapping(value = "/idchk.do", method = RequestMethod.GET)
	public String idChk(Model model, @RequestParam("id") String id) {
		UserDto dto = biz.idchk(id);
		boolean idNotUse = true;

		if (dto != null) { // 중복된 아이디가 존재
			idNotUse = false;
		}

		model.addAttribute("idNotUse", idNotUse);

		return "idchk";
	}

	String clientId = "e0dUMyM7NUTzBbVCNs6W"; // 애플리케이션 클라이언트 아이디값";
	String clientSecret = "k_d25QLXXg"; // 애플리케이션 클라이언트 시크릿값";

	// 자동 등록 방지
	@RequestMapping(value = "/captcha.do", method = RequestMethod.GET)
	public void captcha(HttpServletRequest request, HttpServletResponse response) {

		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}

		String dirPath = request.getRealPath("captchaImage") + "\\";
		System.out.println(dirPath);

		String captchaImageName = null;
		String result = null;
		// System.out.println(captchaImageName);
		String key = request.getParameter("key");
		String value = request.getParameter("value");

		if (value != null) {

			result = this.captchaNkeyResult(key, value);
			System.out.println("resultA>>>" + result);

			JSONObject obj = new JSONObject();
			obj.put("result", result);
			out.println(obj.toJSONString());
		} else {
			key = this.captchaNkey();
			captchaImageName = this.captchaImage(key, dirPath);
			result = "{\"key\":\"" + key + "\", \"captchaImageName\":\"" + captchaImageName + "\"}";
			System.out.println("resultB>>>" + result);

			JSONObject obj = new JSONObject();
			obj.put("key", key);
			obj.put("captchaImageName", captchaImageName);

			out.println(obj.toJSONString());
		}

	}

	public String captchaNkey() {
		String result = null;
		try {
			String code = "0"; // 키 발급시 0, 캡차 이미지 비교시 1로 세팅
			String apiURL = "https://openapi.naver.com/v1/captcha/nkey?code=" + code;
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("X-Naver-Client-Id", clientId);
			con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer sb = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				sb.append(inputLine);
			}
			br.close();
			result = sb.toString().substring(8, 8 + 16);
		} catch (Exception e) {
			System.out.println(e);
		}
		return result;
	}

	public String captchaImage(String key, String dirPath) {
		String result = null;
		try {
			// String key = "CAPTCHA_KEY"; // https://openapi.naver.com/v1/captcha/nkey 호출로
			// 받은 키값
			String apiURL = "https://openapi.naver.com/v1/captcha/ncaptcha.bin?key=" + key;
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("X-Naver-Client-Id", clientId);
			con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) { // 정상 호출
				InputStream is = con.getInputStream();
				int read = 0;
				byte[] bytes = new byte[1024];
				// 랜덤한 이름으로 파일 생성
				// dirPath="C:\\Users\\Clark\\workspace\\ajax\\WebContent\\captchaImage\\";
				String tempname = Long.valueOf(new Date().getTime()).toString();
				File f = new File(dirPath + tempname + ".jpg");
				f.createNewFile();
				OutputStream outputStream = new FileOutputStream(f);
				while ((read = is.read(bytes)) != -1) {
					outputStream.write(bytes, 0, read);
				}
				result = tempname + ".jpg";
				outputStream.close();
				is.close();
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
				String inputLine;
				StringBuffer sb = new StringBuffer();
				while ((inputLine = br.readLine()) != null) {
					sb.append(inputLine);
				}
				br.close();
				System.out.println(sb.toString());
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return result;
	}

	public String captchaNkeyResult(String key, String value) {
		String result = null;
		try {
			String code = "1"; // 키 발급시 0, 캡차 이미지 비교시 1로 세팅
			// String key = "CAPTCHA_KEY"; // 캡차 키 발급시 받은 키값
			// String value = "USER_VALUE"; // 사용자가 입력한 캡차 이미지 글자값
			System.out.println("key >>> " + key + " value >>> " + value);
			String apiURL = "https://openapi.naver.com/v1/captcha/nkey?code=" + code + "&key=" + key + "&value="
					+ value;

			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("X-Naver-Client-Id", clientId);
			con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer sb = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				sb.append(inputLine);
			}
			br.close();
			System.out.println("여기요여기" + sb.toString());
			result = sb.toString().substring(10, 14);
		} catch (Exception e) {
			System.out.println(e);
		}
		return result;
	}

	// 비밀번호 찾기 폼
	@RequestMapping(value = "/forgetPassword.do", method = RequestMethod.GET)
	public String forgetPassword() {

		return "forgetPassword";
	}

	// 이메일로 비밀번호 발송
	@RequestMapping(value = "/searchPassword.do", method = RequestMethod.POST)
	public String searchPassword(Model model, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		String userid = request.getParameter("userid");
		String useremail = request.getParameter("useremail");
		String userpw = biz.searchpassword(userid);

		// 잘못된 아이디를 입력했을 경우
		if (userpw == null) {
			model.addAttribute("msg", "<script type='text/javascript'>alert('아이디를 정확히 입력해 주세요.');</script>");
			return "forgetPassword";

		} else {
			// 인증 메일 보내기
			// 메일 입력값 받음
			String from = "dr2308@naver.com";
			String to = useremail;
			String subject = "On&Off에서 회원님의 비밀번호를 알려드립니다.";
			String content = "<html>" + "<div>회원님의 비밀번호는 <b>" + userpw + "</b> 입니다.</div>" + "</html>";

			Properties p = new Properties(); // 정보를 담을 객체

			p.put("mail.smtp.host", "smtp.naver.com"); // 네이버 SMTP
			// SMTP 서버에 접속하기 위한 정보들
			p.put("mail.smtp.port", "465");
			p.put("mail.smtp.starttls.enable", "true");
			p.put("mail.smtp.auth", "true");
			p.put("mail.smtp.debug", "true");
			p.put("mail.smtp.socketFactory.port", "465");
			p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			p.put("mail.smtp.socketFactory.fallback", "false");

			try {
				Authenticator auth = new SMTPAuthenticatior();
				Session ses = Session.getInstance(p, auth);

				ses.setDebug(true);

				MimeMessage msg = new MimeMessage(ses); // 메일의 내용을 담을 객체
				msg.setSubject(subject); // 제목

				Address fromAddr = new InternetAddress(from);
				msg.setFrom(fromAddr); // 보내는 사람

				Address toAddr = new InternetAddress(to);
				msg.addRecipient(Message.RecipientType.TO, toAddr); // 받는 사람

				msg.setContent(content, "text/html;charset=UTF-8"); // 내용과 인코딩

				Transport.send(msg); // 전송
			} catch (Exception e) {
				e.printStackTrace();
				// 오류 발생시 뒤로 돌아가도록
			}
			// 성공 시
			return "redirect:login.do";
		}
	}

	// 마이페이지
	@RequestMapping(value = "/mypage.do", method = RequestMethod.GET)
	public String mypage(Model model, HttpSession session) {
		if (session.getAttribute("dto") != null) {
			model.addAttribute("dto", session.getAttribute("dto"));
			return "mypage";
		} else {
			model.addAttribute("msg", "로그인 해주세요.");
			return "login";
		}
	}

	// 내 정보
	@RequestMapping(value = "/myInfo.do", method = RequestMethod.GET)
	public String myInfo(Model model, HttpSession session) {

		if (session.getAttribute("dto") != null) {
			model.addAttribute("dto", session.getAttribute("dto"));
		}

		return "myInfo";
	}

	// 내 모임
	@RequestMapping(value = "/myGroup.do", method = RequestMethod.GET)
	public String myGroup(Model model, HttpSession session) {

		if (session.getAttribute("dto") != null) {
			model.addAttribute("dto", session.getAttribute("dto"));
		}
		String userId = session.getAttribute("id").toString();
		List<GroupDto> list = groupbiz.selGroupinfoUser(userId);
		model.addAttribute("list", list);

		return "myGroup";
	}

	// 내 달력
	@RequestMapping(value = "/myCal.do", method = RequestMethod.GET)
	public String myCal(Model model, HttpSession session) {

		if (session.getAttribute("dto") != null) {
			model.addAttribute("dto", session.getAttribute("dto"));
		}

		return "myCal";
	}

	@RequestMapping(value = "/myGroupManager.do", method = RequestMethod.GET)
	public String myGroupManager(Model model, HttpSession session) {

		if (session.getAttribute("dto") != null) {
			model.addAttribute("dto", session.getAttribute("dto"));
		}
		String userId = session.getAttribute("id").toString();
		List<GroupDto> list = groupbiz.selGroupinfoManager(userId);
		model.addAttribute("list", list);

		return "myGroupManager";
	}

	@RequestMapping(value = "/myGroupManagerPage.do", method = RequestMethod.GET)
	public String myGroupManagerPage(Model model, HttpSession session, int groupno) {
		if (session.getAttribute("dto") != null) {
			model.addAttribute("dto", session.getAttribute("dto"));
		}

		String userId = session.getAttribute("id").toString();
		List<GroupDto> list = groupbiz.selGroupinfoManager(userId);
		model.addAttribute("list", list);
		model.addAttribute("groupno", groupno);

		return "myGroupManagerPage";
	}

	@RequestMapping(value = "/userInGroup.do", method = RequestMethod.GET)
	public String userInGroup(Model model, HttpSession session, int groupno) {

		if (session.getAttribute("dto") != null) {
			model.addAttribute("dto", session.getAttribute("dto"));
		}

		System.out.println("얍" + groupno);

		List<GroupUserDto> groupuserdto = groupuserbiz.selectAllGroupUser(groupno);
		model.addAttribute("groupuserdto", groupuserdto);

		return "userInGroup";
	}

	@RequestMapping(value = "/groupUpdate.do", method = RequestMethod.GET)
	public String groupUpdate(HttpSession session, Model model, int groupno) {

		if (session.getAttribute("dto") != null) {
			model.addAttribute("dto", session.getAttribute("dto"));
		}

		GroupDto GroupDto = groupbiz.selectGroupDetail(groupno);
		model.addAttribute("dto", GroupDto);
		return "groupUpdate";
	}

	@RequestMapping(value = "/groupUpdateRes.do", method = RequestMethod.POST)
	public String groupUpdateRes(HttpServletRequest request, HttpSession session, Model model, GroupDto dto) {

		if (session.getAttribute("dto") != null) {
			model.addAttribute("dto", session.getAttribute("dto"));
		}

		int res = groupbiz.updateGroupinfo(dto);
		
		if (res > 0) {
			System.out.println("그룹update성공!");
			model.addAttribute("msg", "수정되었습니다");
			return "redirect:groupDetail.do?groupno=" + dto.getGroupno();
		} else {
//	           model.addAttribute("msg", "<script type='text/javascript'>alert('실패');</script>");
			System.out.println("그룹update실패!");
			model.addAttribute("msg", "수정이 실패 되었습니다. 다시 시도해주세요.");
			return "redirect:myGroupManagerPage?groupno=" + dto.getGroupno();
		}
	}

	@RequestMapping(value = "/delGroupinfo.do", method = RequestMethod.GET)
	public String delGroupinfo(HttpSession session, Model model, int groupno) {

		if (session.getAttribute("dto") != null) {
			model.addAttribute("dto", session.getAttribute("dto"));
		}
		int res = groupbiz.delGroupinfo(groupno);
		if (res > 0) {
			System.out.println("그룹delete성공!");
			return "mypage";
		} else {
			System.out.println("delete실패!");
			return "mypage";
		}
	}

	// 탈퇴하기
	@RequestMapping(value = "/dropUser.do", method = RequestMethod.GET)
	public String dropUser(Model model, HttpSession session) {

		int res = biz.dropuser(session.getAttribute("id").toString());

		if (res > 0) {
			session.invalidate();
			return "dropOk";

		} else {
			return "redirect:mypage.do";
		}

	}

	// 내 정보 수정 폼
	@RequestMapping(value = "/updateMyInfo.do", method = RequestMethod.GET)
	public String updateMyInfo(Model model, HttpSession session) {

		model.addAttribute("dto", biz.myinfo(session.getAttribute("id").toString()));

		return "updateMyInfo";
	}

	// 내 정보 수정하기
	@RequestMapping(value = "/updateUser.do", method = RequestMethod.POST)
	public String updateUser(Model model, HttpSession session, @ModelAttribute UserDto dto) {

		int res = biz.updateuser(dto);

		if (res > 0) {
			System.out.println("내정보 수정 성공");
			session.setAttribute("dto", dto);
			return "redirect:mypage.do";

		} else {
			System.out.println("내정보 수정 실패");
			return "redirect:updateMyInfo.do";
		}

	}

	@Autowired
	private GroupUserBiz gubiz;

	// 채팅
	@RequestMapping(value = "/chat.do", method = RequestMethod.GET)
	public String chat(Model model, HttpSession session, HttpServletRequest request) {

		// 밖에서 번호 받아오기
		int groupnumber = Integer.parseInt((String) request.getParameter("groupnum"));

		model.addAttribute("id", session.getAttribute("id").toString());

		GroupUserDto guDto = new GroupUserDto();

		guDto.setUserid(session.getAttribute("id").toString());
		guDto.setGroupno(groupnumber);
		System.out.println("guDto 잘들어갔나 확인용 groupno():" + guDto.getGroupno() + ", userid : " + guDto.getUserid());

		GroupUserDto sendguDto;
		sendguDto = gubiz.selGroupnoGroupuser(guDto);

		// groupnum 외에 과정을 성공적으로 마치면 보내줄건 보내고 chat으로 return 한다
		if (sendguDto != null) {
			System.out.println(sendguDto.getUserid() + ": sendguDto");
			// model.addAttribute("id","dd");
			session.setAttribute("groupnum", groupnumber);
			model.addAttribute("groupnum", Integer.toString(guDto.getGroupno()));
			return "chat";
		} else {
			return "error";
		}
	}

	// 설문조사
	@Autowired
	private MoimUserBiz moimUserBiz;

	@RequestMapping(value = "/survey.do", method = RequestMethod.GET)
	public String survey(@RequestParam("groupno") int groupno, Model model, HttpServletRequest request,
			HttpSession session) {
		if (session.getAttribute("dto") == null) {// 로그인되어있지 않다면
			model.addAttribute("msg", "<script type='text/javascript'>alert('로그인해주세요.');</script>");
			return "login";
		}
		return "survey";
	}

	@ResponseBody
	@RequestMapping(value = "/surveyResult.do", method = RequestMethod.GET)
	public String surveyResult(HttpServletRequest request, Model model, HttpSession session,
			@ModelAttribute MoimUserDto dto) {
		String userid = session.getAttribute("id").toString();
		int groupno = Integer.parseInt(request.getParameter("groupno"));
		int Q1 = Integer.parseInt(request.getParameter("Q1"));
		int Q2 = Integer.parseInt(request.getParameter("Q2"));
		int Q3 = Integer.parseInt(request.getParameter("Q3"));
		int Q4 = Integer.parseInt(request.getParameter("Q4"));
		int Q5 = Integer.parseInt(request.getParameter("Q5"));
		String Q6 = request.getParameter("Q6");
		dto.setMoimno(0);
		dto.setUserid(userid);
		dto.setGroupno(groupno);
		dto.setMoimq1(Q1);
		dto.setMoimq2(Q2);
		dto.setMoimq3(Q3);
		dto.setMoimq4(Q4);
		dto.setMoimq5(Q5);
		dto.setMoimq6(Q6);
		int res = moimUserBiz.survey(dto);
		if (res > 0) {
			System.out.println("설문지 작성 성공!");
			return "o";
		} else {
			System.out.println("설문지 작성 실패ㅠ");
			return "x";
		}
	}

	@RequestMapping(value = "/D3.do", method = RequestMethod.GET)
	public String D3(Model model, @ModelAttribute MoimUserDto dto, int groupno) {
		dto.setMoimno(groupno);// 평균내고싶은 모임번호 넣음. 이전 페이지에서 에서 값 받아욤
		int avgQ1 = (int) moimUserBiz.avgQ1(dto);
		int avgQ2 = (int) moimUserBiz.avgQ2(dto);
		int avgQ3 = (int) moimUserBiz.avgQ3(dto);
		int avgQ4 = (int) moimUserBiz.avgQ4(dto);
		int avgQ5 = (int) moimUserBiz.avgQ5(dto);
		int avgAll = (int) moimUserBiz.avgAll(avgQ1, avgQ2, avgQ3, avgQ4, avgQ5);
		System.out.println("1번모임1번질문" + avgQ1);
		System.out.println("1번모임2번질문" + avgQ2);
		System.out.println("1번모임3번질문" + avgQ3);
		System.out.println("1번모임4번질문" + avgQ4);
		System.out.println("1번모임5번질문" + avgQ5);
		System.out.println("1번모임의 평균" + avgAll);
		ArrayList<Integer> array = new ArrayList<Integer>();
		array.add(avgQ1);
		array.add(avgQ2);
		array.add(avgQ3);
		array.add(avgQ4);
		array.add(avgQ5);
		array.add(avgAll);
		model.addAttribute("array", array);

		return "D3";
	}

	/*
	 * //페이징 테스트 메소드
	 * 
	 * @RequestMapping(value = "/paging.do", method = RequestMethod.GET) public
	 * String search(Model model,@ModelAttribute("cri") Criteria cri) {
	 * 
	 * List<MoimDto> list = moimbiz.listPage(cri); model.addAttribute("list",list);
	 * 
	 * PageMaker pageMaker = new PageMaker(); pageMaker.setCri(cri);
	 * pageMaker.setTotalCount(moimbiz.listCount()); model.addAttribute("pageMaker",
	 * pageMaker);
	 * 
	 * return "moim"; }
	 */

	// 테스트 메소드
	@RequestMapping(value = "/test.do", method = RequestMethod.GET)
	public String test(Model model, HttpSession session) {

		return "myCal";
	}

	// 그룹 관련 컨트롤러
	// ----------------------------그룹 관련된 내용

	/*
	 * @Autowired private GroupBiz groupbiz;
	 */

	@RequestMapping(value = "/groupDetail.do", method = RequestMethod.GET)
	public String groupDetail(HttpSession session, Model model, int groupno) {

		if (session.getAttribute("dto") != null) {
			model.addAttribute("dto", session.getAttribute("dto"));

			GroupDto groupdto = new GroupDto();
			UserDto userdto = (UserDto) session.getAttribute("dto");
			GroupUserDto groupuserdto = new GroupUserDto();
			groupuserdto.setUserid(userdto.getUserid());
			groupuserdto.setGroupno(groupno);

			GroupUserDto resUser = groupuserbiz.selGroupnoGroupuser(groupuserdto);

			SimpleDateFormat sys = new SimpleDateFormat("yyyy-MM-dd");

			groupdto = groupbiz.selectGroupDetail(groupno);

			model.addAttribute("groupdto", groupdto);
			model.addAttribute("groupregdate", sys.format(groupdto.getGroupregdate()));
			model.addAttribute("resUser", resUser);

			return "groupDetail";
		} else {
			model.addAttribute("msg", "로그인 해주세요.");
			return "login";
		}

	}

	@RequestMapping(value = "/groupInsert.do", method = RequestMethod.GET)
	public String groupInsert() {

		return "groupInsert";
	}

	@RequestMapping(value = "/groupInsertRes.do", method = RequestMethod.GET)
	public String groupInsertRes(HttpSession session, Model model, GroupDto groupdto) {

		if (session.getAttribute("dto") != null) {
			model.addAttribute("dto", session.getAttribute("dto"));
		}
		UserDto user = (UserDto) session.getAttribute("dto");

		int res = groupbiz.insertGroup(groupdto);

		if (res > 0) {

			String findImg = groupdto.getGroupimg();

			int resNo = groupbiz.findGroupNo(findImg);

			GroupUserDto groupuserdto = new GroupUserDto();
			groupuserdto.setUserid(user.getUserid());
			groupuserdto.setGroupno(resNo);
			groupuserdto.setGroupusergrade("MASTER");

			int userres = groupuserbiz.groupInUser(groupuserdto);

			model.addAttribute("groupno", resNo);

			return "redirect:/groupDetail.do";
		} else {
			return "groupInsert";
		}

	}

	@RequestMapping(value = "/preView.do", method = RequestMethod.GET)
	public String qqqq() {

		// model.addAttribute("dto", dto);

		return "preView";
	}

	@RequestMapping(value = "/preViewUpload.do", method = RequestMethod.POST)
	public String uploadfff(HttpServletRequest request, Model model, MultipartFile uploadfile) {

		MultipartFile file = uploadfile;
		String filename = file.getOriginalFilename();

		StringBuffer sb = new StringBuffer();
		String test = null;

		InputStream inputStream = null;
		OutputStream outputStream = null;

		try {
			inputStream = file.getInputStream();
			String path = WebUtils.getRealPath(request.getSession().getServletContext(), "/photoUpload");
			System.out.println("업로드될 실제 경로 : " + path);

			File folder = new File(WebUtils.getRealPath(request.getSession().getServletContext(), "/photoUpload"));

			if (!folder.exists()) {
				folder.mkdirs();
			}

			String saveName = sb.append(new SimpleDateFormat("yyyyMMddHHmmss").format(System.currentTimeMillis()))
					.append(UUID.randomUUID().toString()).append(filename.substring(filename.lastIndexOf(".")))
					.toString();

			File newfile = new File(path + "/" + saveName);
			if (!newfile.exists()) {
				newfile.createNewFile();
			}

			outputStream = new FileOutputStream(newfile);

			int read = 0;
			byte[] b = new byte[(int) file.getSize()];

			while ((read = inputStream.read(b)) != -1) {
				outputStream.write(b, 0, read);
			}

			// 정보 출력
			sb = new StringBuffer();
			sb.append("&bNewLine=true").append("&sFileName=").append(filename).append("&sFileURL=")
					.append(request.getContextPath() + "/photoUpload/").append(saveName);

			test = request.getContextPath() + "/photoUpload/" + saveName;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				inputStream.close();
				outputStream.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		model.addAttribute("test", test);

		return "preViewUpload";
	}

	// -----------------------------------------------------그룹 유저 가입

	@Autowired
	private GroupUserBiz groupuserbiz;

	@RequestMapping(value = "/groupUserIn.do", method = RequestMethod.GET)
	public String groupUserIn(Model model, GroupUserDto groupuserdto) {

		int res = 0;

		groupuserdto.setGroupusergrade("USER");
		res = groupuserbiz.groupInUser(groupuserdto);

		if (res > 0) {
			model.addAttribute("groupno", groupuserdto.getGroupno());
			return "redirect:/groupDetail.do";
		} else {
			return "error";
		}
	}

	@RequestMapping(value = "/groupUserOut.do", method = RequestMethod.GET)
	public String groupUserOut(Model model, GroupUserDto groupuserdto) {

		int res = 0;

		res = groupuserbiz.groupOutUser(groupuserdto);

		// 이미지게시판 댓글지우기
		imgboardansbiz.ImgBoardUserAnsDelete(groupuserdto.getUserid());
		// 모임게시판 댓글 지우기
		// 이건 내가 건들게 아니다
		// 자유게시판 댓글 지우기
		freeboardansbiz.deleteUserAns(groupuserdto.getUserid());
		// 자유게시판 글 지우기
		freeboardbiz.deleteUserFreeBoard(groupuserdto.getUserid());
		// 이미지게시판이랑 모임게시판은 내비둘게여

		if (res > 0) {
			model.addAttribute("groupno", groupuserdto.getGroupno());
			return "redirect:/groupDetail.do";
		} else {
			return "error";
		}
	}

	// -----------------------------------------------------------자유게시판 관련
	@Autowired
	private FreeBoardBiz freeboardbiz;

	@RequestMapping(value = "/boardList.do", method = RequestMethod.GET)
	public String boardList(Model model, int groupno, int pagenum) {

		// 여기 리스트를 원하는 갯수만 가져온다
		model.addAttribute("freeboardlist", freeboardbiz.selectFreeBoardList(groupno, pagenum));

		// 총 갯수를 가져온다.
		model.addAttribute("listsize", freeboardbiz.selectFreeBoardListCnt(groupno));

		model.addAttribute("groupno", groupno);
		model.addAttribute("pagenum", pagenum);

		return "boardList";
	}

	@RequestMapping(value = "/boardDetail.do", method = RequestMethod.GET)
	public String boardDetail(HttpSession session, Model model, int boardno) {

		if (session.getAttribute("dto") != null) {
			model.addAttribute("dto", session.getAttribute("dto"));
		}

		UserDto tmpdto = (UserDto) session.getAttribute("dto");

		FreeBoardDto freeboarddto = new FreeBoardDto();

		freeboarddto = freeboardbiz.selectFreeBoardDetail(boardno);
		SimpleDateFormat sys = new SimpleDateFormat("yyyy-MM-dd");

		model.addAttribute("freeboarddetail", freeboarddto);
		model.addAttribute("boardregdate", sys.format(freeboarddto.getBoardregdate()));
		model.addAttribute("loginid", tmpdto.getUserid());

		// 여기에 댓글을 추가해여함
		List<FreeBoardAnsDto> freeboardanslist = new ArrayList<>();
		freeboardanslist = freeboardansbiz.FreeBoardAnsList(boardno);

		model.addAttribute("freeboardanslist", freeboardanslist);

		return "boardDetail";
	}

	@RequestMapping(value = "/boardWrite.do", method = RequestMethod.GET)
	public String boardWrite(HttpSession session, Model model, int groupno) {

		if (session.getAttribute("dto") != null) {
			model.addAttribute("dto", session.getAttribute("dto"));
		}

		model.addAttribute("groupno", groupno);

		return "boardWrite";
	}

	@RequestMapping(value = "/boardWriteRes.do", method = RequestMethod.GET)
	public String boardWriteRes(HttpSession session, Model model, FreeBoardDto freeboarddto) {

		if (session.getAttribute("dto") != null) {
			model.addAttribute("dto", session.getAttribute("dto"));
		}

		int res = freeboardbiz.insertFreeBoard(freeboarddto);

		if (res > 0) {
			model.addAttribute("groupno", freeboarddto.getGroupno());
			model.addAttribute("pagenum", 1);
			return "redirect:/boardList.do";
		} else {

			model.addAttribute("groupno", freeboarddto.getGroupno());
			return "redirect:/boardWrite.do";
		}
	}

	@RequestMapping(value = "/boardUpdate.do", method = RequestMethod.GET)
	public String boardUpdate(HttpSession session, Model model, int groupno, int boardno) {

		if (session.getAttribute("dto") != null) {
			model.addAttribute("dto", session.getAttribute("dto"));
		}

		FreeBoardDto freeboarddto = new FreeBoardDto();

		freeboarddto = freeboardbiz.selectFreeBoardDetail(boardno);

		SimpleDateFormat sys = new SimpleDateFormat("yyyy-MM-dd");
		String regdate = sys.format(freeboarddto.getBoardregdate());

		model.addAttribute("freeboarddto", freeboarddto);
		model.addAttribute("groupno", groupno);
		model.addAttribute("regdate", regdate);

		return "boardUpdate";
	}

	@RequestMapping(value = "/boardUpdateRes.do", method = RequestMethod.GET)
	public String boardUpdateRes(HttpSession session, Model model, FreeBoardDto freeboarddto) {

		if (session.getAttribute("dto") != null) {
			model.addAttribute("dto", session.getAttribute("dto"));
		}

		int res = freeboardbiz.updateFreeBoard(freeboarddto);

		if (res > 0) {
			model.addAttribute("boardno", freeboarddto.getBoardno());
			return "redirect:/boardDetail.do";
		} else {
			model.addAttribute("groupno", freeboarddto.getGroupno());
			model.addAttribute("boardno", freeboarddto.getBoardno());
			return "redirect:/boardUpdate.do";
		}
	}

	@RequestMapping(value = "/boardDelete.do", method = RequestMethod.GET)
	public String boardDelete(HttpSession session, Model model, int boardno, int groupno) {

		if (session.getAttribute("dto") != null) {
			model.addAttribute("dto", session.getAttribute("dto"));
		}

		int res = freeboardbiz.deleteFreeBoard(boardno);

		if (res > 0) {
			model.addAttribute("groupno", groupno);
			model.addAttribute("pagenum", 1);
			return "redirect:/boardList.do";
		} else {
			model.addAttribute("boardno", boardno);
			return "redirect:/boardDetail.do";
		}
	}

	// 자유게시판 댓글

	@Autowired
	private FreeBoardAnsBiz freeboardansbiz;

	@RequestMapping(value = "/freeBoardAnsInsert.do", method = RequestMethod.GET)
	public String freeBoardAnsInsert(HttpSession session, Model model, FreeBoardAnsDto freeboardansdto) {

		if (session.getAttribute("dto") != null) {
			model.addAttribute("dto", session.getAttribute("dto"));
		}

		int res = freeboardansbiz.FreeBoardAnsInsert(freeboardansdto);

		if (res > 0) {
			model.addAttribute("boardno", freeboardansdto.getBoardno());
			return "redirect:/boardDetail.do";
		} else {
			model.addAttribute("boardno", freeboardansdto.getBoardno());
			return "redirect:/boardDetail.do";
		}
	}

	@RequestMapping(value = "/freeBoardAnsDelete.do", method = RequestMethod.GET)
	public String freeBoardAnsDelete(HttpSession session, Model model, int boardansno, int boardno) {

		if (session.getAttribute("dto") != null) {
			model.addAttribute("dto", session.getAttribute("dto"));
		}

		int res = freeboardansbiz.FreeBoardAnsDelete(boardansno);

		if (res > 0) {
			model.addAttribute("boardno", boardno);
			System.out.println("댓글 삭제 성공");
			return "redirect:/boardDetail.do";
		} else {
			model.addAttribute("boardno", boardno);
			System.out.println("댓글 삭제 실패");
			return "redirect:/boardDetail.do";
		}
	}

	// ---------------------------------------------------------------------------
	// -----------------------------------------------------------이미지 게시판 관련

	@Autowired
	private ImgBoardBiz imgboardbiz;

	@RequestMapping(value = "/imgBoardList.do", method = RequestMethod.GET)
	public String imgBoardList(HttpSession session, Model model, int groupno, int pagenum) {

		if (session.getAttribute("dto") != null) {
			model.addAttribute("dto", session.getAttribute("dto"));
		}

		model.addAttribute("imgboardlist", imgboardbiz.selectImgBoardList(groupno, pagenum));
		model.addAttribute("listsize", imgboardbiz.selectImgBoardListCnt(groupno));

		model.addAttribute("groupno", groupno);
		model.addAttribute("pagenum", pagenum);

		return "imgBoardList";
	}

	@RequestMapping(value = "/imgBoardWrite.do", method = RequestMethod.GET)
	public String imgBoardWrite(HttpSession session, Model model, int groupno) {
		// Model model, int moimno, int groupno 파라미터 바꿔야함 글쓰기 버튼이 여기에 있으면 안되거든

		if (session.getAttribute("dto") != null) {
			model.addAttribute("dto", session.getAttribute("dto"));
		}

		model.addAttribute("groupno", groupno);

		return "imgBoardWrite";
	}

	@RequestMapping(value = "/imgBoardWriteRes.do", method = RequestMethod.GET)
	public String imgBoardWriteRes(HttpSession session, Model model, ImgBoardDto imgboarddto) {

		if (session.getAttribute("dto") != null) {
			model.addAttribute("dto", session.getAttribute("dto"));
		}

		int res = imgboardbiz.insertImgBoard(imgboarddto);

		if (res > 0) {
			model.addAttribute("groupno", imgboarddto.getGroupno());
			model.addAttribute("pagenum", 1);
			return "redirect:/imgBoardList.do";
		} else {
			model.addAttribute("groupno", imgboarddto.getGroupno());
			return "redirect:/imgBoardWrite.do";
		}
	}

	@RequestMapping(value = "/imgBoardDetail.do", method = RequestMethod.GET)
	public String boardDetailPhoto(HttpSession session, Model model, int imgboardno) {

		if (session.getAttribute("dto") != null) {
			model.addAttribute("dto", session.getAttribute("dto"));
		}

		ImgBoardDto imgboarddto = new ImgBoardDto();

		imgboarddto = imgboardbiz.selectImgBoardDetail(imgboardno);
		SimpleDateFormat sys = new SimpleDateFormat("yyyy-MM-dd");

		model.addAttribute("imgboarddto", imgboarddto);
		model.addAttribute("imgboardregdate", sys.format(imgboarddto.getImgboardregdate()));

		// 여기에 댓글을 추가해여함
		List<ImgBoardAnsDto> imgboardanslist = new ArrayList<>();
		imgboardanslist = imgboardansbiz.ImgBoardAnsList(imgboardno);

		model.addAttribute("imgboardanslist", imgboardanslist);

		return "imgBoardDetail";
	}

	@RequestMapping(value = "/imgBoardUpdate.do", method = RequestMethod.GET)
	public String imgBoardUpdate(HttpSession session, Model model, int groupno, int imgboardno) {

		if (session.getAttribute("dto") != null) {
			model.addAttribute("dto", session.getAttribute("dto"));
		}

		ImgBoardDto imgboarddto = new ImgBoardDto();

		imgboarddto = imgboardbiz.selectImgBoardDetail(imgboardno);

		SimpleDateFormat sys = new SimpleDateFormat("yyyy-MM-dd");
		String regdate = sys.format(imgboarddto.getImgboardregdate());

		model.addAttribute("imgboarddto", imgboarddto);
		model.addAttribute("groupno", groupno);
		model.addAttribute("regdate", regdate);

		return "imgBoardUpdate";
	}

	@RequestMapping(value = "/imgBoardUpdateRes.do", method = RequestMethod.GET)
	public String imgBoardUpdateRes(HttpSession session, Model model, ImgBoardDto imgboarddto) {

		if (session.getAttribute("dto") != null) {
			model.addAttribute("dto", session.getAttribute("dto"));
		}

		int res = imgboardbiz.updateImgBoard(imgboarddto);

		if (res > 0) {
			model.addAttribute("imgboardno", imgboarddto.getImgboardno());
			return "redirect:/imgBoardDetail.do";
		} else {
			model.addAttribute("groupno", imgboarddto.getGroupno());
			model.addAttribute("imgboardno", imgboarddto.getImgboardno());
			return "redirect:/imgBoardUpdate.do";
		}
	}

	@RequestMapping(value = "/imgBoardDelete.do", method = RequestMethod.GET)
	public String imgBoardDelete(HttpSession session, Model model, int imgboardno, int groupno) {

		if (session.getAttribute("dto") != null) {
			model.addAttribute("dto", session.getAttribute("dto"));
		}

		int res = imgboardbiz.deleteImgBoard(imgboardno);

		if (res > 0) {
			model.addAttribute("groupno", groupno);
			model.addAttribute("pagenum", 1);
			return "redirect:/imgBoardList.do";
		} else {
			model.addAttribute("imgboardno", imgboardno);
			return "redirect:/imgBoardDetail.do";
		}
	}

	// 이미지게시판 댓글

	@Autowired
	private ImgBoardAnsBiz imgboardansbiz;

	@RequestMapping(value = "/imgBoardAnsInsert.do", method = RequestMethod.GET)
	public String imgBoardAnsInsert(HttpSession session, Model model, ImgBoardAnsDto imgboardansdto) {

		if (session.getAttribute("dto") != null) {
			model.addAttribute("dto", session.getAttribute("dto"));
		}

		int res = imgboardansbiz.ImgBoardAnsInsert(imgboardansdto);

		if (res > 0) {
			model.addAttribute("imgboardno", imgboardansdto.getImgboardno());
			return "redirect:/imgBoardDetail.do";
		} else {
			model.addAttribute("imgboardno", imgboardansdto.getImgboardno());
			return "redirect:/imgBoardDetail.do";
		}
	}

	@RequestMapping(value = "/imgBoardAnsDelete.do", method = RequestMethod.GET)
	public String imgBoardAnsDelete(HttpSession session, Model model, int imgansno, int imgboardno) {

		if (session.getAttribute("dto") != null) {
			model.addAttribute("dto", session.getAttribute("dto"));
		}

		int res = imgboardansbiz.ImgBoardAnsDelete(imgansno);

		if (res > 0) {
			model.addAttribute("imgboardno", imgboardno);
			System.out.println("이미지댓글 삭제 성공");
			return "redirect:/imgBoardDetail.do";
		} else {
			model.addAttribute("imgboardno", imgboardno);
			System.out.println("이미지댓글 삭제 실패");
			return "redirect:/imgBoardDetail.do";
		}
	}

	@RequestMapping(value = "/moimdelete.do", method = RequestMethod.GET)
	public String moimdelete(HttpSession session, Model model, int moimno, int groupno) {

		if (session.getAttribute("dto") != null) {
			model.addAttribute("dto", session.getAttribute("dto"));
		}
		model.addAttribute("groupno", groupno);
		int res = moimbiz.moimdelete(moimno);

		return "redirect:moim.do?groupno=" + groupno;
	}

	@RequestMapping(value = "/moimedit.do", method = RequestMethod.GET)
	public String moimedit(HttpSession session, Model model, int moimno, int groupno) {

		if (session.getAttribute("dto") != null) {
			model.addAttribute("dto", session.getAttribute("dto"));
		}

		model.addAttribute("res", moimbiz.selectMoim(moimno));
		model.addAttribute("groupno", groupno);

		return "moimedit";
	}

	@RequestMapping(value = "/moimupdate.do", method = RequestMethod.POST)
	public String moimupdate(HttpSession session, Model model, MoimDto dto) {

		if (session.getAttribute("dto") != null) {
			model.addAttribute("dto", session.getAttribute("dto"));
		}
		int res = moimbiz.updateMoim(dto);

		return "redirect:moim.do?groupno=" + dto.getGroupno();
	}

	@RequestMapping(value = "/moimjoin.do", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	@ResponseBody
	public String moimjoin(HttpSession session, Model model, MoimUserDto userdto, HttpServletResponse resp) {

		resp.setContentType("text/html; charset=UTF-8");

		if (session.getAttribute("dto") != null) {
			model.addAttribute("dto", session.getAttribute("dto"));
		}

		System.out.println("모임넘버" + userdto.getMoimno() + "그룹넘버" + userdto.getGroupno() + "아이디:" + userdto.getUserid());

		/*
		 * String id = session.getId().toString(); System.out.println(id);
		 * userdto.setUserid(id);
		 */

		// 확인 후 인서트
		MoimUserDto result = moimUserBiz.moimres(userdto);
		if (result != null) {
			return "이미 참가중입니다.";
		} else {
			int res = moimUserBiz.moimjoin(userdto);
			return "참가신청되었습니다.";
		}

		/*
		 * return
		 * "redirect:moimDetail.do?groupno="+userdto.getGroupno()+"&moimno="+userdto.
		 * getMoimno();
		 */
	}

	@RequestMapping(value = "/moimout.do", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	@ResponseBody
	public String moimout(HttpSession session, Model model, MoimUserDto userdto, HttpServletResponse resp) {

		resp.setContentType("text/html; charset=UTF-8");

		if (session.getAttribute("dto") != null) {
			model.addAttribute("dto", session.getAttribute("dto"));
		}

		System.out.println("모임넘버" + userdto.getMoimno() + "그룹넘버" + userdto.getGroupno() + "아이디:" + userdto.getUserid());

		/*
		 * String id = session.getId().toString(); System.out.println(id);
		 * userdto.setUserid(id);
		 */

		// 확인 후 인서트
		MoimUserDto result = moimUserBiz.moimres(userdto);
		if (result != null) {
			int res = moimUserBiz.moimout(userdto);
			return "참가가 취소되었습니다.";
		} else {
			return "참여하고 있지 않습니다.";
		}

		/*
		 * return
		 * "redirect:moimDetail.do?groupno="+userdto.getGroupno()+"&moimno="+userdto.
		 * getMoimno();
		 */
	}

	@RequestMapping(value = "/stream.do", method = RequestMethod.GET)
	public String stream(Model model, HttpSession session, HttpServletRequest request) {

		int groupnumber = Integer.parseInt((String) request.getParameter("groupnum"));
		if (session.getAttribute("id").toString() == null) {
			return "index";
		}
		model.addAttribute("id", session.getAttribute("id").toString());
		GroupUserDto guDto = new GroupUserDto();
		guDto.setUserid(session.getAttribute("id").toString());
		guDto.setGroupno(groupnumber);
		System.out.println("guDto 잘들어갔나 확인용 groupno():" + guDto.getGroupno() + ", userid : " + guDto.getUserid());
		GroupUserDto sendguDto = new GroupUserDto();
		sendguDto = gubiz.selGroupnoGroupuser(guDto);
		System.out.println(sendguDto.getUserid() + ": sendguDto");
		if (guDto != null) {
			session.setAttribute("groupnum", "1");
			model.addAttribute("groupnum", Integer.toString(guDto.getGroupno()));
			return "stream";
		} else {
			return "error";
		}
	}

	@RequestMapping(value = "/pullstream.do", method = RequestMethod.GET)
	public String pullstream(Model model, HttpSession session, HttpServletRequest request) {
		int groupnumber = Integer.parseInt((String) request.getParameter("groupnum"));
		if (session.getAttribute("id").toString() == null) {
			return "index";
		}
		model.addAttribute("id", session.getAttribute("id").toString());
		GroupUserDto guDto = new GroupUserDto();
		guDto.setUserid(session.getAttribute("id").toString());
		guDto.setGroupno(groupnumber);
		System.out.println("guDto 잘들어갔나 확인용 groupno():" + guDto.getGroupno() + ", userid : " + guDto.getUserid());
		GroupUserDto sendguDto = new GroupUserDto();
		sendguDto = gubiz.selGroupnoGroupuser(guDto);
		System.out.println(sendguDto.getUserid() + ": sendguDto");
		if (guDto != null) {
			session.setAttribute("groupnum", "1");
			model.addAttribute("groupnum", Integer.toString(guDto.getGroupno()));
			return "pullstream";
		} else {
			return "error";
		}
	}

}