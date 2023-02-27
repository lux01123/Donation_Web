console.log("Hello world")

/** var for update donation */
var id = 0;
var code = "";
var nameDona = "";
var startDate = "";
var endDate = "";
var organizationName = "";
var phoneNumber = "";
var description = "";

/** close form update donation */
function closeForm() {
	document.getElementById("myForm").style.display = "none";
}

/** get id of donation */
function getDonation(id) {
	$.ajax({
	type : "GET",
	contentType : "application/json",
	url : "/asm01/ajax/donation/" + id,
	dataType : 'json',
	timeout : 100000,
	success : function(data) {
		console.log("SUCCESS: ", data);
		$('#idDona').val(data.id)
		$('#code').val(data.code);
		$('#name').val(data.name);
		$('#startDate').val(data.startDate);
		$('#endDate').val(data.endDate);
		$('#organizationName').val(data.organizationName);
		$('#phoneNumber').val(data.phoneNumber);
		$('#description').val(data.description);
	},
	error : function(e) {
		console.log("ERROR: ", e);
		display(e);
	},
	done : function(e) {
		console.log("DONE");
	}
	});
}

/** save information of donation */
function saveDonation(){
	var data = {}
	data["id"] = $('#idDona').val();
	data["code"] = $('#code').val();
	data["name"] = $('#name').val();
	data["startDate"] = $('#startDate').val();
	data["endDate"] = $('#endDate').val();
	data["organizationName"] = $('#organizationName').val();
	data["phoneNumber"] = $('#phoneNumber').val();
	data["description"] = $('#description').val();
	$.ajax({
		type : "POST",
		url : "/asm01/ajax/savedonation",
		timeout : 100000,
		data: JSON.stringify(data),
		dataType : 'json',
		contentType : "application/json",
		beforeSend: function () {
		},
	    complete: function () {
		},
		success : function(data) {
			console.log("SUCCESS: ", data);
		},
		error : function(e) {
			console.log("ERROR: ", e);
			display(e);
		},
		done : function(e) {
			console.log("DONE");
		}
	});
}

/** show information for edit of donation */
function showEdit(id){
	getDonation(id);
	document.getElementById("myForm").style.display = "block";
}


/** save information after update of donation*/
function saveEdit(){
	saveDonation();
	closeForm();
}
















