// This script is responsible for initializing charts, handling modals, and managing the dark mode toggle.

document.addEventListener('DOMContentLoaded', function() {
    // --- Dark Mode Toggle Logic ---
    const themeToggleBtn = document.getElementById('dark-mode-toggle');
    const html = document.documentElement;
    let chartInstances = {}; // Store chart instances to update them later

    // Function to update the button text and icon based on the current theme
    function updateThemeButtonText() {
        if (html.classList.contains('dark')) {
            themeToggleBtn.innerHTML = '☀️ Light Mode';
        } else {
            themeToggleBtn.innerHTML = '🌙 Dark Mode';
        }
    }

    // --- Helper function to retrieve chart theme options based on current mode ---
    function getChartThemeOptions() {
        const isDark = html.classList.contains('dark');
        const textColor = isDark ? '#d1d5db' : '#374151'; // gray-300 or gray-700
        const gridColor = isDark ? '#4b5563' : '#e5e7eb'; // gray-600 or gray-200
        const tooltipBg = isDark ? '#1f2937' : '#ffffff';
        const tooltipBorder = isDark ? '#4b5563' : '#e5e7eb';
        
        return {
            textColor,
            gridColor,
            tooltipBg,
            tooltipBorder
        };
    }

    // Function to update the chart colors
    function updateChartsTheme() {
        const { textColor, gridColor, tooltipBg, tooltipBorder } = getChartThemeOptions();

        // Iterate through all chart instances and update their options
        for (const chartId in chartInstances) {
            const chart = chartInstances[chartId];
            if (chart) {
                // Update text color for legend and tooltips
                chart.options.plugins.legend.labels.color = textColor;
                chart.options.plugins.tooltip.titleColor = textColor;
                chart.options.plugins.tooltip.bodyColor = textColor;
                chart.options.plugins.tooltip.backgroundColor = tooltipBg;
                chart.options.plugins.tooltip.borderColor = tooltipBorder;
                
                // Update scale colors for bar and line charts
                if (chart.options.scales) {
                    if (chart.options.scales.x) {
                        chart.options.scales.x.ticks.color = textColor;
                        chart.options.scales.x.grid.color = gridColor;
                    }
                    if (chart.options.scales.y) {
                        chart.options.scales.y.ticks.color = textColor;
                        chart.options.scales.y.grid.color = gridColor;
                    }
                }
                
                chart.update(); // Redraw the chart with new colors
            }
        }
    }

    // Function to apply the initial theme on page load
    function applyInitialTheme() {
        const savedTheme = localStorage.getItem('theme');
        const prefersDark = window.matchMedia('(prefers-color-scheme: dark)').matches;
        
        if (savedTheme === 'dark' || (savedTheme === null && prefersDark)) {
            html.classList.add('dark');
        } else {
            html.classList.remove('dark');
        }
        updateThemeButtonText();
    }

    // Event listener for the theme toggle button click
    if (themeToggleBtn) {
        themeToggleBtn.addEventListener('click', () => {
            const isDark = html.classList.contains('dark');
            if (isDark) {
                html.classList.remove('dark');
                localStorage.setItem('theme', 'light');
            } else {
                html.classList.add('dark');
                localStorage.setItem('theme', 'dark');
            }
            updateThemeButtonText();
            updateChartsTheme(); // This is the key change!
        });
    }
    
    // --- Helper function to retrieve Django JSON data ---
    function getJsonData(scriptId) {
        const scriptTag = document.getElementById(scriptId);
        if (scriptTag) {
            return JSON.parse(scriptTag.textContent);
        }
        return null; // Return null if data isn't found
    }

    // --- Mock Data for demonstration ---
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

    function createChart(chartId, type, data, options) {
        const ctx = document.getElementById(chartId).getContext('2d');
        const newChart = new Chart(ctx, { type, data, options });
        chartInstances[chartId] = newChart; // Store the instance
    }
    
    // --- Chart Configuration Objects ---
    // This function will be called on initial load AND on theme changes
    const pieChartConfig = () => {
        const { textColor, tooltipBg, tooltipBorder } = getChartThemeOptions();
        return {
            responsive: true,
            plugins: {
                legend: { 
                    position: 'bottom', 
                    labels: { 
                        color: textColor 
                    } 
                },
                tooltip: { 
                    enabled: true, 
                    titleColor: textColor, 
                    bodyColor: textColor,
                    backgroundColor: tooltipBg,
                    borderColor: tooltipBorder,
                    borderWidth: 1
                }
            }
        };
    }

    const barChartConfig = () => {
        const { textColor, gridColor } = getChartThemeOptions();
        return {
            responsive: true,
            plugins: { legend: { display: false }, title: { display: false } },
            scales: {
                y: { 
                    beginAtZero: true, 
                    ticks: { color: textColor }, 
                    grid: { color: gridColor } 
                },
                x: { 
                    ticks: { color: textColor }, 
                    grid: { color: gridColor } 
                }
            }
        };
    }
    
    const lineChartConfig = () => {
        const { textColor, gridColor } = getChartThemeOptions();
        return {
            responsive: true,
            plugins: { legend: { display: false } },
            scales: {
                y: { 
                    beginAtZero: true, 
                    ticks: { color: textColor }, 
                    grid: { color: gridColor } 
                },
                x: { 
                    ticks: { color: textColor }, 
                    grid: { color: gridColor } 
                }
            }
        };
    }


    // Pie Chart for Gender Distribution
    createChart('pieChart', 'pie', {
        labels: getJsonData('gender-labels') || mockChartData.gender_labels,
        datasets: [{
            data: getJsonData('gender-counts') || mockChartData.gender_counts,
            backgroundColor: chartColors.primary,
            hoverOffset: 4
        }]
    }, pieChartConfig());

    // Bar Chart for Employment Status
    createChart('barChart', 'bar', {
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
    }, barChartConfig());

    // Line Chart for Employee Type
    createChart('lineChart', 'line', {
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
    }, lineChartConfig());
    
    // Bar Chart for Campus Assignment
    createChart('campusBarChart', 'bar', {
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
    }, barChartConfig());

    // --- Employee Table Rendering ---
    const employeeTableBody = document.getElementById('employee-table-body');
    function renderEmployeeTable() {
        employeeTableBody.innerHTML = '';
        const data = mockEmployeeData; // Using mock data for the example
        data.forEach(employee => {
            const row = document.createElement('tr');
            row.className = 'hover:bg-gray-50 dark:hover:bg-gray-700 transition-colors';
            row.innerHTML = `
                <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900 dark:text-gray-100">${employee.id}</td>
                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500 dark:text-gray-300">${employee.name}</td>
                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500 dark:text-gray-300">${employee.department}</td>
                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500 dark:text-gray-300">
                    <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-green-100 dark:bg-green-700 text-green-800 dark:text-green-200">
                        ${employee.status}
                    </span>
                </td>
                <td class="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
                    <button data-employee-id="${employee.id}" class="view-profile-btn text-blue-600 dark:text-blue-400 hover:text-blue-900 dark:hover:text-blue-500 mr-4">
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
        const form = e.target;
        const newEmployee = {
            id: form.id.value,
            name: form.name.value,
            department: form.department.value,
            status: form.status.value,
        };
        
        console.log('New employee to be added:', newEmployee);
        hideModal(addEmployeeModal);
    });
    
    // Call the initial theme function on window load to set up everything
    // This is the correct place to call the theme update after all charts are initialized
    applyInitialTheme();
    updateChartsTheme();
});