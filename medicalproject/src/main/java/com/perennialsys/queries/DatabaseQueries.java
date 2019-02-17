package com.perennialsys.queries;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.perennialsys.MedicalModel.Disease;
import com.perennialsys.MedicalModel.Medicine;
import com.perennialsys.MedicalModel.Symptoms;
import com.perennialsys.connection.GetConnection;

public class DatabaseQueries  {
	private PreparedStatement ps;
	private Connection con;
	
	@Autowired
	private  Medicine  medicineModel;
	private Symptoms symptoms;
	private Disease disease;
	
	public DatabaseQueries() {
		con = (Connection)GetConnection.getDbCon();
	}
	
	public List<Medicine> getMedicineList() {
		try {
			ps = (PreparedStatement) con.prepareStatement("Select id,name,generic_category_id from medicine_details");
			List<Medicine> medicines = new ArrayList<Medicine>();
			ResultSet resultSet = ps.executeQuery();
			while(resultSet.next()) {
				Medicine medicine = new Medicine();
				medicine.setMedicine_id(resultSet.getInt(1));
				medicine.setName(resultSet.getString(2));
				medicine.setGenericsCategoryId(resultSet.getInt(3));
				medicines.add(medicine);
			}
			return medicines;
	
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public List<Medicine> getAlternativeNames(int medicineId) {
		try {
			ps=(PreparedStatement)con.prepareStatement("select name "
					+ "from medicine_details where generic_category_id = "
					+ "(select distinct generic_category_id from medicine_details where id=?)");
			ps.setInt(1, medicineId);
			List<Medicine> medicineNames = new ArrayList<Medicine>();
			ResultSet resultSet = ps.executeQuery();
			while(resultSet.next()) {
				Medicine medicine = new Medicine();
				medicine.setName(resultSet.getString(1));;
				medicineNames.add(medicine);
			}
			return medicineNames;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public List<Symptoms> getSymptomsList() {
		try {
			ps = (PreparedStatement) con.prepareStatement("Select Id,symptom_name from symptoms");
			List<Symptoms> symptomsList = new ArrayList<Symptoms>();
			ResultSet resultSet = ps.executeQuery();
			while(resultSet.next()) {
				Symptoms symptoms = new Symptoms();
				symptoms.setDisease_id(resultSet.getInt(1));
				symptoms.setDisease_name(resultSet.getString(2));
				symptomsList.add(symptoms);
			}
			return symptomsList;
	
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public List<Disease> getDiseaseList() {
		try {
			ps = (PreparedStatement) con.prepareStatement("Select id,disease_name from diseases");
			List<Disease> diseaseList = new ArrayList<Disease>();
			ResultSet resultSet = ps.executeQuery();
			while(resultSet.next()) {
				Disease disease = new Disease();
				disease.setId(resultSet.getInt(1));
				disease.setDis_name(resultSet.getString(2));
				diseaseList.add(disease);
			}
			return diseaseList;
	
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public List<Disease> getDiseaseNames(int symptomId) {
		try {
			ps = (PreparedStatement) con.prepareStatement("SELECT disease_name " + 
					"FROM disease_symptom " + 
					"INNER JOIN diseases ON disease_symptom.disease_id = diseases.id " + 
					"WHERE disease_symptom.symptom_id = ?");
			ps.setInt(1, symptomId);
			List<Disease> diseaseList = new ArrayList<Disease>();
			ResultSet resultSet = ps.executeQuery();
			while(resultSet.next()) {
				Disease disease = new Disease();
				disease.setDis_name(resultSet.getString(1));
				diseaseList.add(disease);
			}
			return diseaseList;
	
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}







