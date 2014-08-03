function validateForm() {
  var x = document.forms["myForm"]["fname"].value;
  if (x == null || x == "") {
      alert("Please enter a User to share with");
      return false;
  }
}
