const input = document.getElementById("birthday");
const error = document.getElementById("dateError");
let isNameValid = false;
let isDateValid = false;
let isPhoneValid = false;
let isEmailValid = false;
let isPasswordValid = false;
let isConfirmPasswordValid = false;
const mask = "dd/mm/yyyy";
const editable = [0,1,3,4,6,7,8,9];

// Click → cho caret nhảy đúng ô
input.addEventListener("click", function () {
    let pos = this.selectionStart;
    if (!editable.includes(pos)) {
        pos = editable.find(p => p > pos) || editable[editable.length - 1];
    }
    this.setSelectionRange(pos, pos);
});

// Gõ ký tự
input.addEventListener("keydown", function (e) {
// Nếu nhấn Backspace tại vị trí dấu "/" → chặn
    if (e.key === "Backspace") {
        let pos = this.selectionStart;

        if (pos === 3 || pos === 6) {  // trước dấu / (vị trí 2,5)
            e.preventDefault();
            return;
        }

        // Cho xóa số nhưng giữ mask
        let chars = this.value.split("");
        if (editable.includes(pos - 1)) {
            e.preventDefault();
            chars[pos - 1] = mask[pos - 1]; // trả về d/m/y
            this.value = chars.join("");
            this.setSelectionRange(pos - 1, pos - 1);
            showError();
        }

        return;
    }
    // Cho phép điều hướng
    if (["ArrowLeft","ArrowRight","Backspace"].includes(e.key)) return;

    // Chỉ số
    if (!/[0-9]/.test(e.key)) {
        e.preventDefault();
        return;
    }

    // Nếu rỗng → tạo mask và ghi số đầu tiên
    if (this.value === "") {
        e.preventDefault();
        let chars = mask.split("");
        chars[0] = e.key;
        this.value = chars.join("");
        this.setSelectionRange(1, 1);
        showError(); // báo lỗi ngay từ số đầu tiên
        return;
    }

    let pos = this.selectionStart;

    // Không cho nhập vào "/"
    if (!editable.includes(pos)) {
        e.preventDefault();
        pos = editable.find(p => p > pos);
        if (pos !== undefined) this.setSelectionRange(pos, pos);
        return;
    }

    // Không cho nhập quá 8 ký tự số hợp lệ
    let existingNums = this.value.replace(/\D/g, "").length;
    if (existingNums >= 8) {
        e.preventDefault();
        return;
    }

    // Ghi đè số
    e.preventDefault();
    let chars = this.value.split("");
    chars[pos] = e.key;
    this.value = chars.join("");

    // Auto jump
    let next = editable.indexOf(pos) + 1;
    if (next < editable.length) {
        this.setSelectionRange(editable[next], editable[next]);
    }

    autoFixDate(this);
    showError();
});

// Tự sửa ngày nếu quá 31, tháng quá 12
function autoFixDate(el) {
    let v = el.value;

    let day = v.substring(0, 2);
    let month = v.substring(3, 5);

    if (!day.includes("d")) {
        let d = parseInt(day);
        if (d > 31) {
            v = replace(v, 0, "3");
            v = replace(v, 1, "1");
        }
    }

    if (!month.includes("m")) {
        let m = parseInt(month);
        if (m > 12) {
            v = replace(v, 3, "1");
            v = replace(v, 4, "2");
        }
    }

    el.value = v;
}

function replace(str, index, char) {
    return str.substring(0, index) + char + str.substring(index + 1);
}

// Hiển thị lỗi
function showError() {
    const v = input.value;

    // Nếu còn d, m, y → báo lỗi
    if (v.includes("d") || v.includes("m") || v.includes("y")) {
        error.style.display = "flex";
        isDateValid=false;
        return;
    }

    // Không đủ 10 ký tự → lỗi
    if (v.length < 10) {
        error.style.display = "flex";
        isDateValid=false;
        return;
    }

    // Lấy giá trị
    const day = parseInt(v.substring(0,2));
    const month = parseInt(v.substring(3,5));

    if (day > 31 || month > 12) {
        error.style.display = "flex";
        isDateValid=false;
        return;
    }
    error.style.display = "none";
    isDateValid=true;
}
const fullName = document.getElementById("fullName");
const nameError = document.getElementById("nameError");

// Regex: chỉ cho chữ + khoảng trắng + chữ tiếng Việt
const nameRegex = /^[A-Za-zÀ-Ỹà-ỹ\s]+$/;

fullName.addEventListener("input", function () {
    const v = this.value;

    // Nếu rỗng → không báo lỗi
    if (v.trim() === "") {
        nameError.style.display = "flex";
        isNameValid=false
        return;
    }

    if (!nameRegex.test(v)) {
        nameError.style.display = "flex";
        isNameValid=false
    } else {
        nameError.style.display = "none";
        isNameValid=true
    }
});
const phoneInput = document.getElementById("phone");
const phoneError = document.getElementById("phoneError");
phoneInput.addEventListener("input", function () {
    // Chỉ cho nhập số
    this.value = this.value.replace(/[^0-9]/g, "");

    // Giới hạn 10 ký tự
    if (this.value.length > 10) {
        this.value = this.value.slice(0, 10);
        isPhoneValid = false;
    }

    // Nếu rỗng → không báo lỗi
    if (this.value === "") {
        phoneError.style.display = "flex";
        isPhoneValid = false;
        return;
    }

    // Chỉ hợp lệ nếu bắt đầu = 07, 08 hoặc 09 và tổng cộng 10 số
    const phoneRegex = /^(07|08|09|03)\d{8}$/;

    if (!phoneRegex.test(this.value)) {
        phoneError.style.display = "flex";
        isPhoneValid = false
    } else {
        phoneError.style.display = "none";
        isPhoneValid = true
    }
});
const emailInput = document.getElementById("email");
const emailError = document.getElementById("emailError");
const emailSucces = document.getElementById("emailSucces");

// Ẩn cả hai khi mới load
emailError.style.display = "none";

// Regex email chuẩn
const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

emailInput.addEventListener("input", function () {
    const v = this.value.trim();

    // Nếu rỗng → không báo lỗi, không báo đúng
    if (v === "") {
        emailError.style.display = "flex";
        emailSucces.style.display = "none";
        isEmailValid=false
        return;
    }

    // Nếu sai định dạng
    if (!emailRegex.test(v)) {
        emailError.style.display = "flex";
        emailSucces.style.display = "none";
         isEmailValid=false
    } 
    // Nếu đúng định dạng
    else {
        emailError.style.display = "none";
        emailSucces.style.display = "flex";
         isEmailValid=true
    }
});
const passwordInput = document.getElementById("matKhau");
const passwordError = document.getElementById("passwordError");
const confirmPasswordInput = document.getElementById("confirmPassword");
const confirmPasswordError = document.getElementById("confirmPasswordError");

passwordInput.addEventListener("input", function () {
    const value = this.value;

    // Regex: có chữ + có số + ≥ 6 ký tự
    const passwordRegex = /^(?=.*[A-Za-z])(?=.*\d).{6,}$/;

    if (value === "") {
        passwordError.style.color = "black";
        isPasswordValid=false
        return;
    }

    if (!passwordRegex.test(value)) {
        passwordError.style.color = "red";
        isPasswordValid=false
    } else {
        passwordError.style.color = "black";
        isPasswordValid=true
    }

    // Tự kiểm tra lại confirm password khi đang nhập
    checkConfirmPassword();
});
confirmPasswordInput.addEventListener("input", checkConfirmPassword);

function checkConfirmPassword() {
    if (confirmPasswordInput.value === "") {
        confirmPasswordError.style.display = "none";
        isConfirmPasswordValid = false
        return;
    }

    if (confirmPasswordInput.value !== passwordInput.value) {
        confirmPasswordError.style.display = "flex";
        isConfirmPasswordValid = false
    } else {
        confirmPasswordError.style.display = "none";
        isConfirmPasswordValid = true
    }
}
document.getElementById("registerForm").addEventListener("submit", function (e) {

    // 1️⃣ Họ tên
    if (!isNameValid || fullName.value.trim() === "") {
        e.preventDefault();
        nameError.style.display = "flex";
        fullName.focus();
        return;
    }

    // 2️⃣ Ngày sinh
    if (!isDateValid || input.value.trim() === "") {
        e.preventDefault();
        error.style.display = "flex";
        input.focus();
        return;
    }

    // 3️⃣ Số điện thoại
    if (!isPhoneValid || phoneInput.value.trim() === "") {
        e.preventDefault();
        phoneError.style.display = "flex";
        phoneInput.focus();
        return;
    }

    // 4️⃣ Email (không bắt buộc nhưng nếu có thì phải đúng)
    if (emailInput.value.trim() !== "" && !isEmailValid) {
        e.preventDefault();
        emailError.style.display = "flex";
        emailInput.focus();
        return;
    }

    // 5️⃣ Mật khẩu
    if (!isPasswordValid || passwordInput.value === "") {
        e.preventDefault();
        passwordError.style.color = "red";
        passwordInput.focus();
        return;
    }

    // 6️⃣ Nhập lại mật khẩu
    if (!isConfirmPasswordValid || confirmPasswordInput.value === "") {
        e.preventDefault();
        confirmPasswordError.style.display = "flex";
        confirmPasswordInput.focus();
        return;
    }

});


