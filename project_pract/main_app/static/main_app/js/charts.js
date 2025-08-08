document.addEventListener('DOMContentLoaded', function() {
    // --- Helper function to retrieve Django JSON data ---
    function getJsonData(scriptId) {
        const scriptTag = document.getElementById(scriptId);
        if (scriptTag) {
            return JSON.parse(scriptTag.textContent);
        }
        return []; // Return an empty array if data isn't found
    }

    // --- Mock Data for demonstration ---
    // In a real application, this data would come from your Django views
    const mockChartData = {
        gender_labels: ['Male', 'Female', 'Non-Binary'],
        gender_counts: [350, 420, 30],
        employment_labels: ['Full-Time', 'Part-Time', 'Contract'],
        employment_counts: [600, 150, 50],
        type_labels: ['Faculty', 'Staff', 'Student Worker'],
        type_counts: [250, 450, 100],
        campus_labels: ['Main Campus', 'Satellite Campus A', 'Online'],
        campus_counts: [550, 150, 100]
    };

    const mockEmployeeData = [
        { id: 'EMP001', name: 'John Doe', department: 'Engineering', status: 'Full-Time', campus: 'Main Campus', startDate: '2020-05-15' },
        { id: 'EMP002', name: 'Jane Smith', department: 'Marketing', status: 'Full-Time', campus: 'Satellite Campus A', startDate: '2018-08-20' },
        { id: 'EMP003', name: 'Peter Jones', department: 'Human Resources', status: 'Part-Time', campus: 'Main Campus', startDate: '2021-03-10' },
        { id: 'EMP004', name: 'Emily White', department: 'Data Science', status: 'Full-Time', campus: 'Online', startDate: '2022-01-25' },
        { id: 'EMP005', name: 'Michael Brown', department: 'Engineering', status: 'Full-Time', campus: 'Main Campus', startDate: '2019-11-01' },
        { id: 'EMP006', name: 'Sarah Lee', department: 'Marketing', status: 'Contract', campus: 'Online', startDate: '2023-07-01' }
    ];

    // --- Chart Rendering Logic ---
    const chartColors = {
        primary: ['#3b82f6', '#f87171', '#a855f7', '#10b981'],
        secondary: ['#4ade80', '#2dd4bf', '#a3e635', '#facc15'],
        tertiary: ['#fb923c', '#e879f9', '#6366f1', '#f472b6']
    };

    // Pie Chart for Gender Distribution
    const pieCtx = document.getElementById('pieChart').getContext('2d');
    new Chart(pieCtx, {
        type: 'doughnut',
        data: {
            labels: getJsonData('gender-labels') || mockChartData.gender_labels,
            datasets: [{
                data: getJsonData('gender-counts') || mockChartData.gender_counts,
                backgroundColor: chartColors.primary,
                hoverOffset: 4
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: {
                    position: 'bottom',
                },
                tooltip: {
                    enabled: true
                }
            }
        }
    });

    // Bar Chart for Employment Status
    const barCtx = document.getElementById('barChart').getContext('2d');
    new Chart(barCtx, {
        type: 'bar',
        data: {
            labels: getJsonData('employment-labels') || mockChartData.employment_labels,
            datasets: [{
                label: 'Number of Employees',
                data: getJsonData('employment-counts') || mockChartData.employment_counts,
                backgroundColor: chartColors.secondary[0],
                borderColor: chartColors.secondary[0],
                borderWidth: 1,
                borderRadius: 6,
                hoverBackgroundColor: chartColors.secondary[1]
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: {
                    display: false,
                },
                title: {
                    display: false,
                }
            },
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });

    // Line Chart for Employee Type
    const lineCtx = document.getElementById('lineChart').getContext('2d');
    new Chart(lineCtx, {
        type: 'line',
        data: {
            labels: getJsonData('type-labels') || mockChartData.type_labels,
            datasets: [{
                label: 'Employees by Type',
                data: getJsonData('type-counts') || mockChartData.type_counts,
                borderColor: chartColors.tertiary[0],
                backgroundColor: 'rgba(251, 146, 60, 0.2)',
                tension: 0.4,
                fill: true,
                pointBackgroundColor: chartColors.tertiary[0],
                pointRadius: 5,
                pointHoverRadius: 7
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: {
                    display: false
                }
            },
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
    
    // Bar Chart for Campus Assignment
    const campusBarCtx = document.getElementById('campusBarChart').getContext('2d');
    new Chart(campusBarCtx, {
        type: 'bar',
        data: {
            labels: getJsonData('campus-labels') || mockChartData.campus_labels,
            datasets: [{
                label: 'Employees by Campus',
                data: getJsonData('campus-counts') || mockChartData.campus_counts,
                backgroundColor: chartColors.tertiary[2],
                borderColor: chartColors.tertiary[2],
                borderWidth: 1,
                borderRadius: 6,
                hoverBackgroundColor: chartColors.tertiary[3]
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: {
                    display: false,
                },
                title: {
                    display: false,
                }
            },
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });

    // --- Employee Table Rendering ---
    const employeeTableBody = document.getElementById('employee-table-body');
    function renderEmployeeTable() {
        employeeTableBody.innerHTML = '';
        mockEmployeeData.forEach(employee => {
            const row = document.createElement('tr');
            row.className = 'hover:bg-gray-50';
            row.innerHTML = `
                <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">${employee.id}</td>
                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">${employee.name}</td>
                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">${employee.department}</td>
                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                    <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-green-100 text-green-800">
                        ${employee.status}
                    </span>
                </td>
                <td class="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
                    <button data-employee-id="${employee.id}" class="view-profile-btn text-blue-600 hover:text-blue-900 mr-4">
                        View Profile
                    </button>
                </td>
            `;
            employeeTableBody.appendChild(row);
        });
    }

    renderEmployeeTable();

    // --- Modal Logic ---
    const profileModal = document.getElementById('profile-modal');
    const addEmployeeModal = document.getElementById('add-employee-modal');

    function showModal(modal) {
        modal.classList.remove('hidden');
        setTimeout(() => {
            modal.querySelector('.modal-backdrop').style.opacity = '1';
            modal.querySelector('div:nth-child(2)').style.transform = 'scale(1)';
        }, 10);
    }

    function hideModal(modal) {
        modal.querySelector('.modal-backdrop').style.opacity = '0';
        modal.querySelector('div:nth-child(2)').style.transform = 'scale(0.95)';
        setTimeout(() => {
            modal.classList.add('hidden');
        }, 300);
    }

    // Event listeners for opening modals
    document.getElementById('add-employee-btn').addEventListener('click', () => {
        showModal(addEmployeeModal);
    });

    document.addEventListener('click', (e) => {
        if (e.target.closest('.view-profile-btn')) {
            const employeeId = e.target.closest('.view-profile-btn').dataset.employeeId;
            const employee = mockEmployeeData.find(emp => emp.id === employeeId);
            if (employee) {
                document.getElementById('profile-name').textContent = employee.name;
                document.getElementById('profile-id').textContent = employee.id;
                document.getElementById('profile-department').textContent = employee.department;
                document.getElementById('profile-status').textContent = employee.status;
                document.getElementById('profile-campus').textContent = employee.campus;
                document.getElementById('profile-start-date').textContent = employee.startDate;
                showModal(profileModal);
            }
        }
    });

    // Event listeners for closing modals
    document.querySelectorAll('.close-modal-btn').forEach(button => {
        button.addEventListener('click', (e) => {
            const modal = e.target.closest('.modal');
            if (modal) {
                hideModal(modal);
            }
        });
    });

    // Close modals by clicking outside
    document.querySelectorAll('.modal-backdrop').forEach(backdrop => {
        backdrop.addEventListener('click', (e) => {
            const modal = e.target.closest('.modal');
            if (modal) {
                hideModal(modal);
            }
        });
    });

    // Form submission for Add Employee Modal (mock)
    document.getElementById('add-employee-form').addEventListener('submit', (e) => {
        e.preventDefault();
        // This is where you would send data to your Django backend
        const form = e.target;
        const newEmployee = {
            id: form.id.value,
            name: form.name.value,
            department: form.department.value,
            status: form.status.value,
            // Add other fields as needed
        };
        
        console.log('New employee to be added:', newEmployee);
        // For this example, we just hide the modal
        hideModal(addEmployeeModal);
        
        // You would typically make a fetch or form submission here
        // e.g., fetch('/api/add-employee/', { method: 'POST', body: JSON.stringify(newEmployee) })
    });
});
