<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script src="/template/alert/sweetAlert.js"></script>

<style>
	@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
</style>
	
<style>

.swal-text {
    font-family: "Nanum Gothic", sans-serif; 
    font-size: 16px;
}

.swal-title {
    font-family: "Nanum Gothic", sans-serif; 
    font-size: 20px; 
    word-break: keep-all;
}

/* .swal-button--confirm {
    background-color: #234250;
} */

</style>
<script>

var sweet = {};

sweet.successAlert = function(title, okFn = function() {}) {
    swal({
        title: title,
        icon: 'success',
        button: '확인',
        closeOnClickOutside: false
    }).then(function() {
        okFn();
    });
};

sweet.errorAlert = function(title, okFn = function() {}) {
    swal({
        title: title,
        icon: 'error',
        button: '확인',
        closeOnClickOutside: false
    }).then(function() {
        okFn();
    });
};

sweet.warningAlert = function(title, okFn = function() {}) {
    swal({
        title: title,
        icon: 'warning',
        button: '확인',
        closeOnClickOutside: false
    }).then(function() {
        okFn();
    });
};

sweet.modal = function(title, okFn = function() {}) {
    swal({
        content: "input",
        title: title,
        icon: 'info',
        button: ["확인", "취소"],
        closeOnClickOutside: false
    }).then(function(value) {
        if (value) {
            okFn(value);
        }
    });
};

sweet.infoAlert = function(title, okFn = function() {}) {
    swal({
        title: title,
        icon: 'info',
        button: '확인',
        closeOnClickOutside: false
    }).then(function() {
        okFn();
    });
};

</script>
</html>