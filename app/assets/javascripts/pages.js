function checkURL (abc) {
  var string = abc.value;
  if (!~string.indexOf("http")) {
    string = "http://" + string;
  }
  abc.value = string;
  return abc
}

function submitURL(){
	var bla = $('#url_url').val();
  if (!~bla.indexOf("http")) {
    bla = "http://" + bla;
  }
  $('#url_url').val(bla)
  $('#new_url').submit();
}


