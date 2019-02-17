This project contains APIs to retrieve data from the database.
The API contains the following methods:

1) public ResponseEntity<?> GetMedicines(HttpServletRequest request,HttpServletResponse response):
Retrieves a list of all medicines.
URL: /medicalproject/medicines
Http method type: GET

2) public ResponseEntity<?>  getEmployeeById(@RequestBody String jsonMedicineId):
Retrieves a list of alternatives to a given medicine.
URL: /medicalproject/medicinenams?id=1
HTTP method type: GET

3) public ResponseEntity<?> GetSymptoms(HttpServletRequest request,HttpServletResponse response):
Retrieves a list of all symptoms.
URL: /medicalproject/symptoms
Http method type: GET

4) public ResponseEntity<?> GetDiseases(HttpServletRequest request,HttpServletResponse response):
Retrieves a list of all diseases.
URL: /medicalproject/diseases
Http method type: GET

5) public ResponseEntity<?> getDiseaseNames(@RequestBody String jsonSymptomId):
Retrives a list of diseases according to inputted symptoms.
URL: /medicalproject/diseasenames
Http method type: POST


