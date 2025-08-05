# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class GenderEmployeeProfile(models.Model):
    campus_assignment = models.CharField(max_length=22, blank=True, null=True)
    office_affiliation = models.CharField(max_length=100, blank=True, null=True)
    employment_status = models.CharField(max_length=31, blank=True, null=True)
    type_of_employee = models.CharField(max_length=12, blank=True, null=True)
    sex = models.CharField(max_length=6, blank=True, null=True)
    age = models.IntegerField(blank=True, null=True)
    marital_status = models.CharField(max_length=9, blank=True, null=True)
    years_in_service = models.IntegerField(blank=True, null=True)
    designation = models.CharField(max_length=100, blank=True, null=True)
    position = models.CharField(max_length=100, blank=True, null=True)
    height_cm = models.DecimalField(max_digits=5, decimal_places=2, blank=True, null=True)
    weight_kg = models.DecimalField(max_digits=5, decimal_places=2, blank=True, null=True)
    is_head_of_family = models.IntegerField(blank=True, null=True)
    is_primary_caregiver = models.IntegerField(blank=True, null=True)
    is_solo_parent = models.IntegerField(blank=True, null=True)
    has_children_below_7 = models.IntegerField(blank=True, null=True)
    has_children_with_disabilities = models.IntegerField(blank=True, null=True)
    is_ip_member = models.IntegerField(blank=True, null=True)
    is_pwd = models.IntegerField(blank=True, null=True)
    pwd_types = models.CharField(max_length=255, blank=True, null=True)
    household_size = models.IntegerField(blank=True, null=True)
    household_income_range = models.CharField(max_length=11, blank=True, null=True)
    address = models.CharField(max_length=255, blank=True, null=True)
    name = models.CharField(max_length=100, blank=True, null=True)
    employee_id = models.CharField(max_length=50, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'gender_employee_profile'


class AdminDashboardCharts {
    constructor() {
        this.charts = new Map();
        this.defaultOptions = {
            responsive: true,
            maintainAspectRatio: false,
            cutout: "20%",
            plugins: {
                legend: {
                    display: true,
                    position: "bottom",
                    labels: {
                        padding: 20,
                        usePointStyle: true,
                        font: {
                            size: 12
                        }
                    }
                },
                tooltip: {
                    callbacks: {
                        label: function(context) {
                            const label = context.label || '';
                            const value = context.parsed;
                            const total = context.dataset.data.reduce((a, b) => a + b, 0);
                            const percentage = Math.round((value / total) * 100);
                            return `${label}: ${value} (${percentage}%)`;
                        }
                    }
                }
            },
            animation: {
                animateScale: true,
                animateRotate: true
            }
        };

        this.colorPalettes = {
            primary: ["#4F46E5", "#10B981", "#F59E0B", "#EF4444", "#8B5CF6"],
            gender: ["#4F46E5", "#10B981"],
            // Keep this as 'roles' because we cannot change the original definition
            // but remember it's being used for educational attainment in femaleEmpChart
            roles: ["#F59E0B", "#3B82F6"],
            departments: ["#EC4899", "#6366F1", "#06B6D4", "#8B5CF6"],
            status: ["#F43F5E", "#3B82F6"],
            office: ["#34D399", "#8B5CF6", "#F59E0B", "#EF4444", "#4F46E5", "#06B6D4"]
        };

        this.chartConfigs = [
            {
                elementId: "totalEmployeesChart",
                title: "Total Employees by Gender",
                data: {
                    labels: ["Female", "Male"],
                    datasets: [{
                        data: [117, 111],
                        backgroundColor: this.colorPalettes.gender,
                        borderWidth: 2,
                        borderColor: "#ffffff",
                        hoverOffset: 10
                    }]
                }
            },
            {
                elementId: "femaleEmpChart",
                title: "Female Employees by Educational Attainment",
                data: {
                    labels: [],
                    datasets: [{
                        data: [],
                        backgroundColor: this.colorPalettes.roles, // Still using 'roles' due to original definition
                        borderWidth: 2,
                        borderColor: "#ffffff",
                        hoverOffset: 10
                    }]
                }
            },
            {
                elementId: "maleEmpChart",
                title: "Male Employees by Role",
                data: {
                    labels: ["Manager", "Staff"],
                    datasets: [{
                        data: [20, 91],
                        backgroundColor: ["#6366F1", "#10B981"],
                        borderWidth: 2,
                        borderColor: "#ffffff",
                        hoverOffset: 10
                    }]
                }
            },
            {
                elementId: "soloParentChart",
                title: "Solo Parents by Gender",
                data: {
                    labels: ["Female Solo Parents", "Male Solo Parents"],
                    datasets: [{
                        data: [5, 4],
                        backgroundColor: this.colorPalettes.status,
                        borderWidth: 2,
                        borderColor: "#ffffff",
                        hoverOffset: 10
                    }]
                }
            },
            {
                elementId: "TLBempChart",
                title: "TLB Employees by Gender",
                data: {
                    labels: ["Female", "Male"],
                    datasets: [{
                        data: [55, 45],
                        backgroundColor: ["#EC4899", "#6366F1"],
                        borderWidth: 2,
                        borderColor: "#ffffff",
                        hoverOffset: 10
                    }]
                }
            },
            {
                elementId: "VSLempChart",
                title: "VSL Employees by Gender",
                data: {
                    labels: ["Female", "Male"],
                    datasets: [{
                        data: [62, 66],
                        backgroundColor: ["#06B6D4", "#8B5CF6"],
                        borderWidth: 2,
                        borderColor: "#ffffff",
                        hoverOffset: 10
                    }]
                }
            },
            {
                elementId: "MaleSoloParentChart",
                title: "Male Solo Parents by Role",
                data: {
                    labels: ["Manager", "Staff"],
                    datasets: [{
                        data: [1, 3],
                        backgroundColor: ["#F97316", "#10B981"],
                        borderWidth: 2,
                        borderColor: "#ffffff",
                        hoverOffset: 10
                    }]
                }
            },
            {
                elementId: "FemaleSoloParentChart",
                title: "Female Solo Parents by Role",
                data: {
                    labels: ["Manager", "Staff"],
                    datasets: [{
                        data: [2, 3],
                        backgroundColor: ["#F43F5E", "#F59E0B"],
                        borderWidth: 2,
                        borderColor: "#ffffff",
                        hoverOffset: 10
                    }]
                }
            }
        ];
    }

    /**
     * Initialize all charts
     */
    init() {
        if (typeof Chart === 'undefined') {
            console.error('Chart.js is not loaded. Please include Chart.js before this script.');
            return;
        }

        this.chartConfigs.forEach(config => this.createChart(config));
        this.setupResizeHandler();

        // Fetch and render female employees by educational attainment data for the 'femaleEmpChart'
        this.fetchAndRenderFemaleEmployeesByEducationalAttainmentForFemaleEmpChart();
        // Setup listener for the female employee modal
        this.setupFemaleEmpModalListener();
        
        
    }

    /**
     * Create a single chart
     * @param {Object} config - Chart configuration
     */
    createChart(config) {
        const canvas = document.getElementById(config.elementId);

        if (!canvas) {
            console.warn(`Canvas with ID "${config.elementId}" not found. Skipping chart creation.`);
            return null;
        }

        // Validate data
        if (!this.validateChartData(config.data)) {
            console.error(`Invalid data for chart "${config.elementId}"`);
            return null;
        }

        const ctx = canvas.getContext("2d");

        // Merge default options with custom options
        const options = this.mergeOptions(this.defaultOptions, config.options || {});

        // Add title if provided
        if (config.title) {
            options.plugins.title = {
                display: true,
                text: config.title,
                font: {
                    size: 16,
                    weight: 'bold'
                },
                padding: 20
            };
        }

        try {
            const chart = new Chart(ctx, {
                type: "doughnut",
                data: config.data,
                options: options
            });

            // Store chart instance for later reference
            this.charts.set(config.elementId, chart);

            return chart;
        } catch (error) {
            console.error(`Error creating chart "${config.elementId}":`, error);
            return null;
        }
    }

    /**
     * Validate chart data structure
     * @param {Object} data - Chart data
     * @returns {boolean} - Validation result
     */
    validateChartData(data) {
        if (!data || !data.labels || !data.datasets) {
            return false;
        }

        if (!Array.isArray(data.labels) || !Array.isArray(data.datasets)) {
            return false;
        }

        if (data.datasets.length === 0) {
            return false;
        }

        const dataset = data.datasets[0];
        if (!dataset.data || !Array.isArray(dataset.data)) {
            return false;
        }

        // Allow labels and data to have different lengths initially if data is empty (for async loading)
        // This warning is fine if data.data.length is 0, as it will be populated later.
        if (data.labels.length !== dataset.data.length && dataset.data.length !== 0) {
            console.warn('Labels and data arrays have different lengths');
            return false;
        }

        return true;
    }

    /**
     * Deep merge options objects
     * @param {Object} target - Target object
     * @param {Object} source - Source object
     * @returns {Object} - Merged object
     */
    mergeOptions(target, source) {
        const result = JSON.parse(JSON.stringify(target));

        for (const key in source) {
            if (source.hasOwnProperty(key)) {
                if (typeof source[key] === 'object' && source[key] !== null && !Array.isArray(source[key])) {
                    result[key] = this.mergeOptions(result[key] || {}, source[key]);
                } else {
                    result[key] = source[key];
                }
            }
        }

        return result;
    }

    /**
     * Update chart data
     * @param {string} chartId - Chart element ID
     * @param {Object} newData - New data object
     */
    updateChartData(chartId, newData) {
        const chart = this.charts.get(chartId);
        if (!chart) {
            console.warn(`Chart with ID "${chartId}" not found`);
            return;
        }

        // Validate newData before updating
        if (!this.validateChartData(newData)) {
            console.error(`Invalid new data for chart "${chartId}"`);
            return;
        }

        chart.data = newData;
        chart.update();
    }

    /**
     * Destroy a specific chart
     * @param {string} chartId - Chart element ID
     */
    destroyChart(chartId) {
        const chart = this.charts.get(chartId);
        if (chart) {
            chart.destroy();
            this.charts.delete(chartId);
        }
    }

    /**
     * Destroy all charts
     */
    destroyAllCharts() {
        this.charts.forEach(chart => chart.destroy());
        this.charts.clear();
    }

    /**
     * Setup resize handler for responsive charts
     */
    setupResizeHandler() {
        let resizeTimeout;
        window.addEventListener('resize', () => {
            clearTimeout(resizeTimeout);
            resizeTimeout = setTimeout(() => {
                this.charts.forEach(chart => {
                    if (chart && typeof chart.resize === 'function') {
                        chart.resize();
                    }
                });
            }, 100);
        });
    }

    /**
     * Get chart instance by ID
     * @param {string} chartId - Chart element ID
     * @returns {Chart|null} - Chart instance or null
     */
    getChart(chartId) {
        return this.charts.get(chartId) || null;
    }

    /**
     * Get all chart instances
     * @returns {Map} - Map of all chart instances
     */
    getAllCharts() {
        return new Map(this.charts);
    }

    /**
     * Fetches female employee data by educational attainment and updates the 'femaleEmpChart'.
     */
    async fetchAndRenderFemaleEmployeesByEducationalAttainmentForFemaleEmpChart() {
        const chartId = "femaleEmpChart";
        try {
            // *** CHANGE 1: Request 'F' instead of 'Female' to match employess.py requirement ***
            const response = await fetch('/api/educational-attainment/?sex=F');
            if (!response.ok) {
                const errorText = await response.text();
                throw new Error(`Network response was not ok: ${response.status} - ${errorText}`);
            }
            const result = await response.json();

            // *** CHANGE 2: Account for the 'succes' typo in Django views.py response ***
            // Use 'result.succes' (single 's') instead of 'result.success'
            // The !Array.isArray(result.employee_data) check handles if employee_data is null/undefined
            if (!result.succes || !Array.isArray(result.employee_data)) {
                // Adjust error message to reflect possible reasons
                throw new Error('API response indicates failure, missing data, or incorrect "success" key (check for "succes" typo).');
            }

            const rawData = result.employee_data; // This will be a list of tuples: [('degree', count), ...]

            // *** CHANGE 3: Transform raw tuple data into expected object format ***
            const formattedData = rawData.map(item => {
                if (Array.isArray(item) && item.length === 2) {
                    return {
                        attainment: item[0], // First element is educational attainment
                        count: item[1]      // Second element is count
                    };
                }
                // Log a warning if an item is not in the expected (string, number) tuple format
                console.warn(`[${chartId}] Unexpected data format for item, skipping:`, item);
                return null; // Return null for malformed items
            }).filter(item => item !== null); // Remove any null items (malformed data)

            const labels = formattedData.map(item => item.attainment || 'Unspecified Attainment');
            const counts = formattedData.map(item => item.count);

            this.updateChartData(chartId, {
                labels: labels,
                datasets: [{
                    data: counts,
                    backgroundColor: this.colorPalettes.roles, // Using 'roles' palette for educational attainment
                    borderWidth: 2,
                    borderColor: "#ffffff",
                    hoverOffset: 10
                }]
            });
        } catch (error) {
            console.error('Error fetching female employee data by educational attainment for femaleEmpChart:', error);
            // Render a fallback chart with an error message
            this.updateChartData(chartId, {
                labels: ['Error Loading Data'],
                datasets: [{
                    data: [1], // A single segment to show the error
                    backgroundColor: ['#EF4444'], // Red color for error
                    borderWidth: 2,
                    borderColor: "#ffffff",
                    hoverOffset: 10
                }]
            });
        }
    }

    /**
     * Sets up a click listener for the female employee modal to log chart data.
     */
    setupFemaleEmpModalListener() {
        const modalElement = document.getElementById('femaleEmpModal');
        if (modalElement) {
            modalElement.addEventListener('click', () => {
                const femaleEmpChart = this.getChart("femaleEmpChart");
                if (femaleEmpChart) {
                    console.log("Data for Female Employees by Educational Attainment Chart:", femaleEmpChart.data);
                } else {
                    console.warn("Female Employees by Educational Attainment Chart not found.");
                }
            });
        } else {
            console.warn("Element with ID 'femaleEmpModal' not found. Cannot attach click listener.");
        }
    }

    
}


path('api/educational-attainment/', views.getEducationalAttainment, name='getEducationalAttainment'),