package codling.controller.corporation;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import codling.dao.CorporationDao;
import codling.dao.IndividualDao;
import codling.dao.InformationDao;
import codling.identity.Applicant;
import codling.identity.Career;
import codling.identity.Education;
import codling.identity.Field;
import codling.identity.JobOpening;

@WebServlet("/applicant_status")
public class Applicant_statusServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("corpId");
		
		InformationDao infoDao = new InformationDao();
		Map<String, String> map = infoDao.getCorpName(id);
		String name = map.get(id);
		request.setAttribute("name", name);
		
		// parameter로 전달받은 no
		int no = 0;
		String no_ = request.getParameter("no");
		if(no_ != null && !no_.equals("")) no = Integer.parseInt(no_);
		
		CorporationDao corpDao = new CorporationDao();
		IndividualDao indiDao = new IndividualDao();
		// 공고 현황
		JobOpening jobOpening = corpDao.getJobOpening(no); // 공고no에 맞는 공고
		List<Field> fields = corpDao.getAllField(no);      // 공고no에 맞는 분야들
		
		request.setAttribute("fields", fields);
		request.setAttribute("jobOpening", jobOpening);
		
		// 지원자 현황
		List<Applicant> applicants = corpDao.getApplicant(no);
		for(int i = 0; i < applicants.size(); i++) {
			String individual_id = applicants.get(i).getId();
			
			// 지원자 최종학력
			List<Education> educations = indiDao.getEducation(individual_id);

			ArrayList<String> schools = new ArrayList<String>();
			for(int j = 0; j < educations.size(); j++) {
				schools.add(educations.get(j).getSchool());
			}
			String lastSchool = "";
			if(schools.contains("대학원(박사)")) lastSchool = "대학원(박사)";
			else if(schools.contains("대학원(석사)")) lastSchool = "대학원(석사)";
			else if(schools.contains("대학교(4년)")) lastSchool = "대학교(4년)";
			else if(schools.contains("대학교(2년)")) lastSchool = "대학교(2년)";
			else if(schools.contains("고등학교")) lastSchool = "고등학교";
			
			for(int j = 0; j < educations.size(); j++) {
				if(educations.get(j).getSchool().equals(lastSchool)) {
					Education education = educations.get(j);
					applicants.get(i).setEducation(education.getSchoolName() + " " + education.getDepartment() + "(" + education.getStatus() + ") | " + education.getSchool());
				}
			}
			
			// 지원자 경력
			List<Career> careers = indiDao.getCareer(individual_id);
			if(careers != null) {
				String totalTenureDate = "";
				int totalYear = 0, totalMonth = 0;
				for(int j = 0; j < careers.size(); j++) {
					Career career = careers.get(j);
					int year = Integer.parseInt(career.getTenureEndDate().substring(0, 4)) - Integer.parseInt(career.getTenureStartDate().substring(0, 4));
					int month = Integer.parseInt(career.getTenureEndDate().substring(5, 7)) - Integer.parseInt(career.getTenureStartDate().substring(5, 7));
					totalYear += year;
					totalMonth += month;
					if(month < 0) year--; month += 12;					
					if(totalMonth < 0) totalYear--; totalMonth += 12;
					
					if(j == 0) totalTenureDate += " ( ";
					if(j != careers.size() - 1) {
						if(year == 0)
							totalTenureDate += career.getPrev_company() + " " + month + "개월 | ";
						else if(month == 0)
							totalTenureDate += career.getPrev_company() + " " + year + "년 | ";
						else
							totalTenureDate += career.getPrev_company() + " " + year + "년 " + month + "개월 | ";
					} else if(j == careers.size() - 1) {
						if(year == 0)
							totalTenureDate += career.getPrev_company() + " " + month + "개월 )";
						else if(month == 0)
							totalTenureDate += career.getPrev_company() + " " + year + "년 )";
						else
							totalTenureDate += career.getPrev_company() + " " + year + "년 " + month + "개월 )";
					}
				}
				StringBuilder total = new StringBuilder(totalTenureDate);
				if(totalYear == 0)
					total.insert(0, "총 " + totalMonth + "개월");
				else if(totalMonth == 0)
					total.insert(0, "총 " + totalYear + "년");
				else
					total.insert(0, "총 " + totalYear + "년 " + totalMonth + "개월");
				
				applicants.get(i).setCareer(total.toString());
			} else {
				applicants.get(i).setCareer("신입");
			}
		}
		request.setAttribute("applicants", applicants);
		request.getRequestDispatcher("/WEB-INF/corporation/applicant_status.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	
}