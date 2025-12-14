const container = document.getElementById("calendarContainer");
const btnDate = document.getElementById("btnDate");
const input = document.getElementById("startDate");
const inputEnd = document.getElementById("endDate");
const error = document.getElementById("dateError");
const mask = "dd/mm/yyyy";
const editable = [0,1,3,4,6,7,8,9];

let today = new Date();
let startDate = new Date(today);
let endDate = new Date(today);
startDate.setDate(endDate.getDate() - 30);

let currentYear = today.getFullYear();
let currentMonth = today.getMonth() + 1;
let view = "days";

// ----------------- Calendar hiển thị / đóng -----------------
btnDate.addEventListener("click", e => {
    container.style.display = "block";
    generateCalendar(currentYear, currentMonth);
    e.stopPropagation();
});
container.addEventListener("click", e => e.stopPropagation());
document.addEventListener("click", () => container.style.display = "none");

// ----------------- Calendar logic -----------------
function generateCalendar(year, month) {
    container.innerHTML = "";
    if(view==="days") renderDays(year, month);
    else if(view==="months") renderMonths(year);
    else if(view==="years") renderYears(year);
}

function renderDays(year, month){
    const header = document.createElement("div");
    header.style.display = "flex"; header.style.justifyContent="space-between"; header.style.marginBottom="8px";
    const prevBtn = document.createElement("button"); prevBtn.innerText="<"; 
    prevBtn.onclick = () => { if(month===1){month=12; year--;} else month--; currentYear=year; currentMonth=month; generateCalendar(year,month);}
    const nextBtn = document.createElement("button"); nextBtn.innerText=">"; 
    nextBtn.onclick = () => { if(month===12){month=1; year++;} else month++; currentYear=year; currentMonth=month; generateCalendar(year,month);}
    const title = document.createElement("span"); title.innerText=`${month} - ${year}`; title.style.cursor="pointer";
    title.onclick = () => { view="months"; generateCalendar(currentYear,currentMonth);}
    header.appendChild(prevBtn); header.appendChild(title); header.appendChild(nextBtn); container.appendChild(header);

    const daysOfWeek = ["CN","T2","T3","T4","T5","T6","T7"];
    const table = document.createElement("table"); table.style.borderCollapse="collapse"; table.style.width="100%";
    const thead = document.createElement("thead"); const trHead = document.createElement("tr");
    daysOfWeek.forEach(d=>{ const th=document.createElement("th"); th.innerText=d; th.style.border="1px solid #ccc"; th.style.padding="4px"; trHead.appendChild(th); });
    thead.appendChild(trHead); table.appendChild(thead);

    const firstDay = new Date(year,month-1,1).getDay();
    const daysInMonth = new Date(year,month,0).getDate();
    const daysInPrevMonth = new Date(year,month-1,0).getDate();
    const tbody = document.createElement("tbody");
    let tr = document.createElement("tr");

    for(let i=firstDay-1;i>=0;i--){ const td=document.createElement("td"); td.innerText=daysInPrevMonth-i; td.style.color="#aaa"; td.style.border="1px solid #ccc"; td.style.padding="4px"; td.style.textAlign="center"; tr.appendChild(td); }

    for(let day=1; day<=daysInMonth; day++){
        const td=document.createElement("td"); td.innerText=day; td.style.border="1px solid #ccc"; td.style.padding="4px"; td.style.textAlign="center"; td.style.cursor="pointer";

        const thisDate = new Date(year,month-1,day);
        if(thisDate>=startDate && thisDate<=endDate) td.style.backgroundColor="lightblue";

        td.onclick = () => {
            if(thisDate < startDate) startDate=thisDate;
            else if(thisDate > endDate) endDate=thisDate;
            else {
                const diffStart = thisDate - startDate;
                const diffEnd = endDate - thisDate;
                if(diffStart < diffEnd) startDate=thisDate;
                else endDate=thisDate;
            }
            input.value = formatDate(startDate);
            inputEnd.value = formatDate(endDate);
            generateCalendar(currentYear,currentMonth);
            fetchProducts(); // Lấy dữ liệu AJAX
        };

        tr.appendChild(td);
        const currentDay = (firstDay+day-1)%7;
        if(currentDay===6 && day!==daysInMonth){ tbody.appendChild(tr); tr=document.createElement("tr"); }
    }

    let nextDay=1;
    while(tr.children.length<7){ const td=document.createElement("td"); td.innerText=nextDay++; td.style.color="#aaa"; td.style.border="1px solid #ccc"; td.style.padding="4px"; td.style.textAlign="center"; tr.appendChild(td); }
    tbody.appendChild(tr); table.appendChild(tbody); container.appendChild(table);
}

function renderMonths(year){ /* giữ nguyên code cũ */ }
function renderYears(year){ /* giữ nguyên code cũ */ }

// ----------------- Helper -----------------
function formatDate(d){ const dd=String(d.getDate()).padStart(2,'0'); const mm=String(d.getMonth()+1).padStart(2,'0'); const yyyy=d.getFullYear(); return `${dd}/${mm}/${yyyy}`; }
function parseDate(str){ const [d,m,y]=str.split("/"); return `${y}-${m.padStart(2,'0')}-${d.padStart(2,'0')}`; }

// ----------------- Mask & auto-fix input -----------------
[input, inputEnd].forEach(inp => {

    inp.maxLength = 10; // luôn cố định 10 ký tự

    inp.addEventListener("focus", function () {
        if (this.value === "") this.value = mask;
    });

    inp.addEventListener("click", function () {
        let pos = this.selectionStart;
        if (!editable.includes(pos))
            pos = editable.find(p => p > pos) || editable[editable.length - 1];
        this.setSelectionRange(pos, pos);
    });

    inp.addEventListener("keydown", function (e) {

        // Cho phép di chuyển
        if (["ArrowLeft", "ArrowRight", "Tab"].includes(e.key)) return;

        let pos = this.selectionStart;

        // Backspace
        if (e.key === "Backspace") {
            e.preventDefault();

            // Không cho xóa vào dấu "/"
            if (pos === 3 || pos === 6) return;

            // Nếu xoá ký tự hợp lệ
            if (editable.includes(pos - 1)) {
                let chars = this.value.split("");
                chars[pos - 1] = mask[pos - 1]; // trả lại d/m/y
                this.value = chars.join("");
                this.setSelectionRange(pos - 1, pos - 1);
            }
            return;
        }

        // Chỉ cho số
        if (!/[0-9]/.test(e.key)) {
            e.preventDefault();
            return;
        }

        // Ghi số
        if (editable.includes(pos)) {
            e.preventDefault();
            let chars = this.value.split("");
            chars[pos] = e.key;
            this.value = chars.join("");

            // nhảy qua "/" tự động
            let nextIndex = editable.indexOf(pos) + 1;
            if (nextIndex < editable.length)
                this.setSelectionRange(editable[nextIndex], editable[nextIndex]);
        } else {
            // Nếu bấm vào vị trí không editable → nhảy tới chỗ gần nhất
            e.preventDefault();
            let next = editable.find(p => p > pos);
            if (next !== undefined) this.setSelectionRange(next, next);
        }

        autoFixDate(this);
    });

});

function autoFixDate(el) {
    let v = el.value;
    let day = parseInt(v.substring(0, 2));
    let month = parseInt(v.substring(3, 5));

    if (day > 31) {
        v = replace(v, 0, "3");
        v = replace(v, 1, "1");
    }
    if (month > 12) {
        v = replace(v, 3, "1");
        v = replace(v, 4, "2");
    }

    el.value = v;
}

function replace(str,index,char){ return str.substring(0,index)+char+str.substring(index+1); }

// Hiển thị lỗi
function showError() {
    const v  = input.value;
    const v2 = inputEnd.value;

    // Nếu 1 trong 2 ô đang chứa mask → lỗi
    if (v.includes("d") || v.includes("m") || v.includes("y") ||
        v2.includes("d") || v2.includes("m") || v2.includes("y")) {
        error.style.display = "flex";
        return;
    }

    // Nếu độ dài < 10 → lỗi
    if (v.length !== 10 || v2.length !== 10) {
        error.style.display = "flex";
        return;
    }

    // Parse date
    const day1   = parseInt(v.substring(0, 2));
    const month1 = parseInt(v.substring(3, 5));
    const year1  = parseInt(v.substring(6, 10));

    const day2   = parseInt(v2.substring(0, 2));
    const month2 = parseInt(v2.substring(3, 5));
    const year2  = parseInt(v2.substring(6, 10));

    // Ngày hoặc tháng không hợp lệ
    if (day1 < 1 || day1 > 31 || month1 < 1 || month1 > 12 ||
        day2 < 1 || day2 > 31 || month2 < 1 || month2 > 12) {

        error.style.display = "flex";
        return;
    }

    // Nếu tạo Date thật → loại luôn lỗi kiểu 31/02/2024
    let dateA = new Date(year1, month1 - 1, day1);
    let dateB = new Date(year2, month2 - 1, day2);

    if (dateA.getDate() !== day1 || dateA.getMonth() !== month1 - 1 ||
        dateB.getDate() !== day2 || dateB.getMonth() !== month2 - 1) {

        error.style.display = "flex";
        return;
    }

    // Nếu hợp lệ
    error.style.display = "none";
}

function convertDate(d) {
    if (!d) return null;
    return d.replaceAll("-", "/"); // yyyy/MM/dd
}

function fetchProducts() {
    const start = document.getElementById("startDate").value;
    const end = document.getElementById("endDate").value;
const activeTab = document.querySelector(".trangthai-active");
const trangThai = activeTab ? activeTab.dataset.value : 4;

console.log("Trạng thái:", trangThai);
    fetch("/api/detailKh/order", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
            startDate: convertDate(start),
            endDate: convertDate(end),
            trangThai: trangThai
        })
    })
    .then(res => res.json())
.then(data => {
    renderProducts(data.data, data.sanPhamMax);
})
    .catch(err => console.error(err));
}
function renderProducts(list, sanPhamMax) {
    if (!Array.isArray(list)) return;

    const container = document.getElementById("orderList");
    if (!container) return;

    container.innerHTML = "";

    list.forEach(hd => {

        const maxCt = sanPhamMax[hd.maHoaDon]; // SP đắt nhất

        const ngayTao = convertDate(hd.ngayTao);
        const ngayThanhToan = hd.ngayThanhToan 
            ? formatDate(hd.ngayThanhToan)
            : "Chưa thanh toán";

        const trangThaiHTML = getTrangThai(hd.trangThai);

        const img = maxCt?.chiTietSanPham?.hinhAnhURL || "no-image.png";
        const tenSP = maxCt?.chiTietSanPham?.sanPham?.tenSanPham || "Sản phẩm";
        const dungLuong = maxCt?.chiTietSanPham?.dungLuong?.tenDungLuong || "";
        const mauSac = maxCt?.chiTietSanPham?.mauSac?.tenMauSac || "";
        const nsx = maxCt?.chiTietSanPham?.nsx?.tenNSX || "";
        const soLuongMua = maxCt?.soLuongMua || 1;

        const div = document.createElement("div");
        div.classList.add("YL_VlX");

        div.innerHTML = `
             <div class="J632se">
                <div class="kG_yF0">
                    <div class="ylYzwa">
                        <div class="LY5oll">
                            <div class="RBPP9y">
                                <div class="UDaMW3">Thời gian đặt hàng: ${ngayThanhToan}</div>
                            </div>
                            <div><span>${trangThaiHTML}</span></div>
                        </div>
                    </div>

                    <a href="detailKh/hoadon/${hd.maHoaDon}">
                        <div class="bdAfgU">
                            <div class="FNHV0p">
                                <div class="mZ1OWk">
                                    <div class="dJaa92">
                                        <div class="divimg">
                                            <img src="http://localhost:8080/img/${img}" class="gQuHsZ" style="object-fit:cover;">
                                        </div>

                                        <div class="nmdHRf">
                                            <div>
                                                <div class="zWrp4w">
                                                    <span class="DWVWOJ">${tenSP} ${dungLuong} ${mauSac}</span>
                                                </div>
                                            </div>
                                            <div>
                                                <div class="rsautk">Phân loại: ${nsx}</div>
                                                <div class="j3I_Nh">x${soLuongMua}</div>
                                            </div>
                                        </div>
                                    </div>

                                    <div>
                                        <div class="NWUSQP">
                                            <label class="juCcT0">Thành tiền:</label>
                                            <div class="t7TQaf">
                                                <bdi>${hd.tongTien.toLocaleString()}₫</bdi>
                                            </div>
                                        </div>

                                        <div class="aAXjeK" style="margin:0 30px;">
                                            <button class="stardust-button stardust-button--primary QY7kZh">Mua lại</button>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </a>

                </div>
            </div>
        `;

        container.appendChild(div);
    });
}


function formatDate(dateStr) {
    const d = new Date(dateStr);
    return d.getFullYear() + "/" + String(d.getMonth()+1).padStart(2,"0") + "/" + String(d.getDate()).padStart(2,"0");
}
function getTrangThai(t) {
    if (t === 0) return `<div style="color:#141414;width:85px;text-align:center;background:yellow;border-radius:8%;">Chờ xử lý</div>`;
    if (t === 1) return `<div style="color:#0e0ebd;width:85px;text-align:center;background:#d2d2ff;border-radius:8%;">Đang giao</div>`;
    if (t === 2) return `<div style="color:green;width:85px;text-align:center;">Đã giao</div>`;
    return `<div style="color:red;width:85px;text-align:center;">Đã Hủy</div>`;
}

[input,inputEnd].forEach(inp=>inp.addEventListener("blur", fetchProducts));

// Khởi tạo calendar
generateCalendar(currentYear,currentMonth);

const btnMuaLai = document.getElementById("btnMuaLai");
btnMuaLai.addEventListener("click", async (e) => {
    e.preventDefault();

    const productDetail = await getSelectedProductDetail();
    if (!productDetail) return;

    const dataCart = await addToCart(productDetail.maChiTietSanPham, 1);
    if (!dataCart.success) {
        alert(dataCart.message);
        return;
    }

    const form = document.getElementById("checkoutForm");
    const input = document.getElementById("checkoutMaGHCTs");

    input.value = dataCart.maGHCT; 
     form.submit();
});
async function addToCart(maChiTietSanPham, quantity = 1) {
    const resCart = await fetch("/cart/add-san-pham", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
            maChiTietSanPham,
            quantity
        })
    });

    return await resCart.json();
}
