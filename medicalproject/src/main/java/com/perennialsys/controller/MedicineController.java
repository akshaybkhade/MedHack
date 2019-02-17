package com.perennialsys.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.perennialsys.MedicalModel.Disease;
import com.perennialsys.MedicalModel.Medicine;
import com.perennialsys.MedicalModel.Symptoms;
import com.perennialsys.queries.DatabaseQueries;

@RestController
public class MedicineController {

	private DatabaseQueries databaseQueries = new DatabaseQueries();

	@RequestMapping(value= "/medicines")
	public ResponseEntity<?> GetMedicines(HttpServletRequest request,HttpServletResponse response) {
		try {
			List<Medicine> medicines = databaseQueries.getMedicineList();
			if(medicines != null)
				return new ResponseEntity<List<Medicine>>(medicines, HttpStatus.OK);
			return new ResponseEntity<String>("Not Found", HttpStatus.NOT_FOUND);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			String errorMessage;
			errorMessage = e + "";
			e.printStackTrace();
			return new ResponseEntity<String>("Not Found", HttpStatus.NOT_FOUND);
		}
	}
	
	@RequestMapping(value ="medicinenames", method = RequestMethod.GET)
    public ResponseEntity<?>  getEmployeeById(@RequestParam("id") int medicineId)
    {
		try {
			System.out.println("jsoneMedicineId" + medicineId);
//			JSONObject jsonObj=new JSONObject(jsonMedicineId);
//			int medicineId=jsonObj.getInt("id");b
			System.out.println("incontroller"+ medicineId);
			if (medicineId != 0) {
				List<Medicine> medicineAlternativeNames = databaseQueries.getAlternativeNames(medicineId);
				if(medicineAlternativeNames != null)
					return new ResponseEntity<List<Medicine>>(medicineAlternativeNames, HttpStatus.OK);
				return new ResponseEntity<String>("Not Found", HttpStatus.NOT_FOUND);
			}
			return new ResponseEntity<String>("Not Found", HttpStatus.NOT_FOUND);
		} catch (JSONException e) {
			String errorMessage;
			errorMessage = e + "";
			e.printStackTrace();
			return new ResponseEntity<String>("Not Found", HttpStatus.NOT_FOUND);
		}
    }
	
	@RequestMapping(value= "/symptoms")
	public ResponseEntity<?> GetSymptoms(HttpServletRequest request,HttpServletResponse response) {
		try {
			List<Symptoms> symptoms = databaseQueries.getSymptomsList();
			if(symptoms != null)
				return new ResponseEntity<List<Symptoms>>(symptoms, HttpStatus.OK);
			return new ResponseEntity<String>("Not Found", HttpStatus.NOT_FOUND);
		} catch (Exception e) {
		// TODO Auto-generated catch block
			String errorMessage;
			errorMessage = e + "";
			e.printStackTrace();
			return new ResponseEntity<String>("Not Found", HttpStatus.NOT_FOUND);
		}
	}
	
	@RequestMapping(value= "/diseases")
	public ResponseEntity<?> GetDiseases(HttpServletRequest request,HttpServletResponse response) {
		try{
			List<Disease> diseases = databaseQueries.getDiseaseList();
			if(diseases != null)
				return new ResponseEntity<List<Disease>>(diseases, HttpStatus.OK);
			return new ResponseEntity<String>("Not Found", HttpStatus.NOT_FOUND);
		} catch (Exception e) {
	// TODO Auto-generated catch block
			String errorMessage;
			errorMessage = e + "";
			e.printStackTrace();
			return new ResponseEntity<String>("Not Found", HttpStatus.NOT_FOUND);
		}
	}
	
	@RequestMapping(value ={"diseasenames"}, method = RequestMethod.POST)
    public ResponseEntity<?> getDiseaseNames(@RequestBody String jsonSymptomId)
    {
		try {
			JSONObject jsonObj=new JSONObject(jsonSymptomId);
			int symptomsId=jsonObj.getInt("id");
			System.out.println("incontroller"+ symptomsId);
	        if (symptomsId != 0) {
	        	List<Disease> diseaseNames = databaseQueries.getDiseaseNames(symptomsId);
	        	if(diseaseNames != null)
	        		return new ResponseEntity<List<Disease>>(diseaseNames, HttpStatus.OK);
	        	return new ResponseEntity<String>("Not Found", HttpStatus.NOT_FOUND);
	        }
	        return new ResponseEntity<String>("Not Found", HttpStatus.NOT_FOUND);
		} catch (Exception e) {
    	// TODO Auto-generated catch block
			String errorMessage;
			errorMessage = e + "";
			e.printStackTrace();
			return new ResponseEntity<String>("Not Found", HttpStatus.NOT_FOUND);
    	}
    }
}
