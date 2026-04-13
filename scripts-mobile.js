document.addEventListener('DOMContentLoaded', function () {
  var mobileQuery = window.matchMedia('(max-width: 480px)');
  if (!mobileQuery.matches) {
    return;
  }

  var hero = document.querySelector('.hero');
  var stickyBar = document.getElementById('stickyCta');

  if (hero && stickyBar) {
    var stickyObserver = new IntersectionObserver(
      function (entries) {
        var isHeroVisible = entries[0] && entries[0].isIntersecting;
        stickyBar.classList.toggle('visible', !isHeroVisible);
        document.body.classList.toggle('mobile-sticky-visible', !isHeroVisible);
      },
      { threshold: 0 }
    );
    stickyObserver.observe(hero);
  }

  function updateTimer() {
    var timer = document.getElementById('deadlineTimer');
    if (!timer) return;

    var deadline = new Date('2026-11-15T23:59:59');
    var now = new Date();
    var diff = deadline.getTime() - now.getTime();

    if (diff <= 0) {
      timer.style.display = 'none';
      return;
    }

    var days = Math.floor(diff / 86400000);
    var hours = Math.floor((diff % 86400000) / 3600000);
    var mins = Math.floor((diff % 3600000) / 60000);

    var tDays = document.getElementById('tDays');
    var tHours = document.getElementById('tHours');
    var tMins = document.getElementById('tMins');

    if (tDays) tDays.textContent = String(days).padStart(2, '0');
    if (tHours) tHours.textContent = String(hours).padStart(2, '0');
    if (tMins) tMins.textContent = String(mins).padStart(2, '0');
  }

  updateTimer();
  window.setInterval(updateTimer, 60000);

  var form = document.getElementById('applicationForm');
  var progressSteps = Array.prototype.slice.call(document.querySelectorAll('.form-progress .progress-step'));

  if (form && progressSteps.length) {
    var fieldStepMap = {
      full_name: 1,
      email: 1,
      phone: 2,
      organization: 2,
      privacy_consent: 3
    };

    function setActiveStep(stepNumber) {
      progressSteps.forEach(function (step) {
        var isActive = Number(step.dataset.step) === stepNumber;
        step.classList.toggle('active', isActive);
      });
    }

    function detectStep() {
      var elements = Array.prototype.slice.call(form.querySelectorAll('input, select, textarea'));
      var lastTouchedStep = 1;

      elements.forEach(function (el) {
        if (el.type === 'checkbox') {
          if (el.checked) {
            lastTouchedStep = Math.max(lastTouchedStep, fieldStepMap[el.name] || 1);
          }
          return;
        }

        if (String(el.value || '').trim() !== '') {
          lastTouchedStep = Math.max(lastTouchedStep, fieldStepMap[el.name] || 1);
        }
      });

      setActiveStep(lastTouchedStep);
    }

    form.addEventListener('focusin', function (event) {
      var target = event.target;
      if (!target || !target.name) return;
      setActiveStep(fieldStepMap[target.name] || 1);
    });

    form.addEventListener('input', detectStep);
    form.addEventListener('change', detectStep);
    detectStep();
  }
});
