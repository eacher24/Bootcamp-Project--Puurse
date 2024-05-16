import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="categories"
export default class extends Controller {
  static targets = ["categoryBtn", "bank", "period", "list"];
  connect() {
    console.log("connected");
    console.log(this.categoryBtnTarget);
    console.log(this.bankTarget);
    console.log(this.periodTarget);
  }
  getCategory(event) {
    // event.preventDefault();
    const button = event.target;
    const selection = button.getAttribute("data-category");
    console.log(selection);
    const action = "http://localhost:3000/transactions";
    const url = `${action}?period=${this.periodTarget.value}&bank=${this.bankTarget.value}&commit=submit`;
    console.log(url);

    const fetchData = async () => {
      try {
        const response = await fetch(url, { Accept: "text/plain" });
        if (!response.ok) {
          throw new Error("Failed to fetch data");
        }

        const data = await response.text();
        return data;
      } catch (error) {
        console.error("Error fetching data", error.message);
        throw error;
      }
    };

    (async () => {
      try {
        const data = await fetchData();
        console.log("Fetched data:", data);
        // this.listTarget.outerHTML = data;
      } catch (error) {
        console.error("Error occurred:", error.message);
      }
    })();
  }
}
