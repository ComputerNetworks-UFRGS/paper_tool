function validateUserAdd() {
    txt_name = document.getElementById('name');
    sel_owner = document.getElementById('owner');
    if (txt_name.value == '') {
        alertify('Name is empty');
        return false;
    }
    if (sel_owner.value < 1) {
        alertify('Owner not selected');
        return false;
    }
    return true;
}