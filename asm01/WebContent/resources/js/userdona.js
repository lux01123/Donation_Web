console.log("This is action donation from home pages")

/** var for a transaction */
var id = 0;
var donationId = 0;
var money = 0;
var text = "";
var name = "";

// open form for donation transact
function openForm(){
	document.getElementById("myForm").style.display = "block";
}

// close form for donation transact
function closeForm(){
	document.getElementById("myForm").style.display = "none";
}

// display form with name of donation
function showDona(id, name){
	openForm();
	$('#code').val(name);
	$('#idDona').val(id);
}

// make json data
function saveInfoDona(){
	var data = {}
	data["donationId"] = $('#idDona').val();
	data["money"] = $('#money').val();
	data["name"] = $('#name').val();
	data["text"] = $('#text').val();
	$.ajax({
		type : "POST",
		url : "/asm01/ajax/saveuserdonation",
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

// save infomation of donation transaction
function saveUserDona(){
	saveInfoDona();
	closeForm();
}

