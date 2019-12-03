const hideAllTabs = () => {
   document.querySelectorAll(".tab-content ").forEach((tabContent) => {
    tabContent.classList.add("d-none")
    console.log("Yes1")
  })
}

const initFilterTabs = () => {
  console.log("Yes2")
  document.querySelectorAll('.tabs-btn > a').forEach((btn) => {
    btn.addEventListener("click", (event) => {
      event.preventDefault();
      hideAllTabs();
      console.log("Yes3")
      const targetTabContent = event.currentTarget.dataset.target;
      document.getElementById(targetTabContent).classList.remove("d-none");
    });
  })
}

export { initFilterTabs }
