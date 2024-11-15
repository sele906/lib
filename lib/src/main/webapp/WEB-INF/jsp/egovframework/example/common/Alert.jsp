<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

<style>
	@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
</style>
	
<style>

.swal-text {
    font-family: "Nanum Gothic", sans-serif; 
    font-size: 16px;
    word-break: keep-all;
}

.swal-title {
    font-family: "Nanum Gothic", sans-serif; 
    font-size: 20px; 
    word-break: keep-all;
}

</style>
<script>

var sweet = {};

//alert
sweet.successAlert = function(title, text, okFn = function() {}) {
    Swal.fire({
        title: title,
        text: text,
        icon: 'success',
        confirmButtonText: '확인',
        confirmButtonColor: '#84b16a',
        allowOutsideClick: false
    }).then(function() {
        okFn();
    });
};

sweet.errorAlert = function(title, text, okFn = function() {}) {
    Swal.fire({
        title: title,
        text: text,
        icon: 'error',
        confirmButtonText: '확인',
        confirmButtonColor: '#d74040',
        allowOutsideClick: false
    }).then(function() {
        okFn();
    });
};

sweet.warningAlert = function(title, text, okFn = function() {}) {
    Swal.fire({
        title: title,
        text: text,
        icon: 'warning',
        confirmButtonText: '확인',
        confirmButtonColor: '#eba043',
        allowOutsideClick: false
    }).then(function() {
        okFn();
    });
};

sweet.infoAlert = function(title, text, okFn = function() {}) {
    Swal.fire({
        title: title,
        text: text,
        icon: 'info',
        confirmButtonText: '확인',
        confirmButtonColor: '#7db4c6',
        allowOutsideClick: false
    }).then(function() {
        okFn();
    });
};

//confirm
sweet.confirm = function(title, text, okFn = function() {}) {
    Swal.fire({
        title: title,
        text: text,
        icon: 'question',
        showCancelButton : true,
        confirmButtonColor: '#7db4c6',
		confirmButtonText : "예",
		cancelButtonText : "아니오",
		closeOnConfirm : false,
		closeOnCancel : true
	}).then((result) => {
        if (result.isConfirmed) {
            okFn(); 
        }
    });
};

//toast
sweet.toast = function(title, timer = 2000) {
    const toast = Swal.fire({
        title: title,
        icon: 'info',
        toast: true,
        position: 'center-center',
        showConfirmButton: false,
        timer: timer,
        timerProgressBar: true,
        didOpen: (toast) => {
            toast.addEventListener('mouseenter', Swal.stopTimer);
            toast.addEventListener('mouseleave', Swal.resumeTimer);
        },
        customClass: {
            icon: 'no-animate'
          }
    });
    return toast;
};

//modal
sweet.modal = function(title, text = '', okFn = function() {}) {
    Swal.fire({
        title: title,
        text: text,
        input: 'text',
        icon: 'info',
        showCancelButton: true,
        cancelButtonText: "취소",
        confirmButtonText: '확인',
        confirmButtonColor: '#3085d6',
        allowOutsideClick: false
    }).then(function(result) {
        if (result.isConfirmed && result.value) {
            okFn(result.value);
        }
    });
};

</script>
</html>