document.addEventListener("DOMContentLoaded", function () {
    const labels = JSON.parse(document.getElementById("labels-data").textContent);
    const counts = JSON.parse(document.getElementById("counts-data").textContent);

    const ctx = document.getElementById("genderChart").getContext("2d");

    new Chart(ctx, {
        type: 'pie',
        data: {
            labels: labels,
            datasets: [{
                label: 'Gender Count',
                data: counts,
                backgroundColor: ['#3498db', '#e74c3c', '#f1c40f']
            }]
        }
    });
});

// this is for the charts constructing in the dashboard.html

const genderLabels = JSON.parse(document.getElementById("gender-labels").textContent);
const genderCounts = JSON.parse(document.getElementById("gender-counts").textContent);
const employmentLabels = JSON.parse(document.getElementById("employment-labels").textContent);
const employmentCounts = JSON.parse(document.getElementById("employment-counts").textContent);
const typeLabels = JSON.parse(document.getElementById("type-labels").textContent);
const typeCounts = JSON.parse(document.getElementById("type-counts").textContent);
const campusLabels = JSON.parse(document.getElementById("campus-labels").textContent);
const campusCounts = JSON.parse(document.getElementById("campus-counts").textContent);



        new Chart(document.getElementById('pieChart'), {
            type: 'pie',
            data: {
                labels: genderLabels,
                datasets: [{
                    data: genderCounts,
                    backgroundColor: ['#3498db', '#e74c3c', '#f1c40f'],
                }]
            }
        });

        new Chart(document.getElementById('barChart'), {
            type: 'bar',
            data: {
                labels: employmentLabels,
                datasets: [{
                    label: 'Employment Count',
                    data: employmentCounts,
                    backgroundColor: '#2ecc71'
                }]
            },
            options: {
                responsive: true,
                plugins: { legend: { display: false } }
            }
        });

        new Chart(document.getElementById('lineChart'), {
            type: 'line',
            data: {
                labels: typeLabels,
                datasets: [{
                    label: 'Type Count',
                    data: typeCounts,
                    fill: false,
                    borderColor: '#9b59b6',
                    tension: 0.1
                }]
            },
            options: {
                responsive: true
            }
        });



new Chart(document.getElementById('campusBarChart'), {
    type: 'bar',
    data: {
        labels: campusLabels,
        datasets: [{
            label: 'Employees per Campus',
            data: campusCounts,
            backgroundColor: '#ff9f43'
        }]
    },
    options: {
        responsive: true,
        plugins: {
            legend: { display: false }
        }
    }
});

    