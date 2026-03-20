/* ============================================================
   CINEVERSE — main.js
   경로: /resources/js/main.js
   ============================================================ */

/* ── 히어로 슬라이더 ── */
(function () {
    let current  = 0;
    const slides = document.querySelectorAll('.hero-slide');
    const dots   = document.querySelectorAll('.dot');
    const total  = slides.length;
    let autoTimer;

    function updateSlider() {
        document.getElementById('heroSlides').style.transform = `translateX(-${current * 100}%)`;
        dots.forEach((d, i) => d.classList.toggle('active', i === current));
    }

    function moveSlide(dir) {
        current = (current + dir + total) % total;
        updateSlider();
        resetAuto();
    }

    function goSlide(idx) {
        current = idx;
        updateSlider();
        resetAuto();
    }

    function resetAuto() {
        clearInterval(autoTimer);
        autoTimer = setInterval(() => moveSlide(1), 5000);
    }

    /* 전역으로 노출 (JSP onclick 속성에서 호출) */
    window.moveSlide = moveSlide;
    window.goSlide   = goSlide;

    resetAuto();
})();

/* ── 검색 ── */
function doSearch() {
    const q = document.getElementById('searchInput').value.trim();
    if (q) location.href = '/movie/search?q=' + encodeURIComponent(q);
}

document.addEventListener('DOMContentLoaded', function () {
    const input = document.getElementById('searchInput');
    if (input) {
        input.addEventListener('keydown', function (e) {
            if (e.key === 'Enter') doSearch();
        });
    }
});