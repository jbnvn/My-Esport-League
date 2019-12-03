const hideAllTabs = () => {
   document.querySelectorAll(".tab-content ").forEach((tabContent) => {
    tabContent.classList.add("d-none")
  })
}

const initFilterTabs = () => {
  document.querySelectorAll('.tabs-btn > a').forEach((btn) => {
    btn.addEventListener("click", (event) => {
      event.preventDefault();
      hideAllTabs();
      const targetTabContent = event.currentTarget.dataset.target;
      document.getElementById(targetTabContent).classList.remove("d-none");
    });
  })
}

export { initFilterTabs }
