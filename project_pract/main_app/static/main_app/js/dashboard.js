document.addEventListener('DOMContentLoaded', function() {
    const sidebar = document.getElementById('sidebar');
    const sidebarToggleDesktop = document.getElementById('sidebar-toggle-desktop');
    const mainContent = document.getElementById('main-content');
    const navLinks = document.querySelectorAll('.nav-link');
    const sidebarTexts = document.querySelectorAll('.sidebar-text');
    const sidebarContent = document.querySelector('.sidebar-content');
    const chartIcon = document.querySelector('.fas.fa-chart-line');
    const navSection = sidebar.querySelector('nav');
    const logoutSection = sidebar.querySelector('.px-4.py-4');
    
    let isCollapsed = true;

    navLinks[0].setAttribute('data-tooltip', 'Overview');
    navLinks[1].setAttribute('data-tooltip', 'Employee List');
    navLinks[2].setAttribute('data-tooltip', 'Reports');
    navLinks[3].setAttribute('data-tooltip', 'Settings');

    initializeCollapsedState();
    
    function initializeCollapsedState() {

        sidebar.style.width = '4rem';
        mainContent.style.marginLeft = '4rem';
        
        sidebarTexts.forEach(text => {
            text.style.display = 'none';
        });

        sidebarToggleDesktop.style.display = 'none';

        sidebarContent.style.justifyContent = 'center';

        chartIcon.style.marginRight = '0';

        navLinks.forEach(link => {
            link.style.justifyContent = 'center';
        });

        navSection.style.paddingLeft = '0.75rem';
        navSection.style.paddingRight = '0.75rem';
        logoutSection.style.paddingLeft = '0.75rem';
        logoutSection.style.paddingRight = '0.75rem';

        navLinks.forEach(link => {
            link.addEventListener('mouseenter', showTooltip);
            link.addEventListener('mouseleave', hideTooltip);
        });
    }

    function toggleSidebar() {
        isCollapsed = !isCollapsed;
        
        if (isCollapsed) {

            sidebar.style.width = '4rem';
            mainContent.style.marginLeft = '4rem';

            sidebarTexts.forEach(text => {
                text.style.display = 'none';
            });

            sidebarToggleDesktop.style.display = 'none';

            sidebarContent.style.justifyContent = 'center';

            chartIcon.style.marginRight = '0';

            navLinks.forEach(link => {
                link.style.justifyContent = 'center';
            });

            navSection.style.paddingLeft = '0.75rem';
            navSection.style.paddingRight = '0.75rem';
            logoutSection.style.paddingLeft = '0.75rem';
            logoutSection.style.paddingRight = '0.75rem';
            
            navLinks.forEach(link => {
                link.addEventListener('mouseenter', showTooltip);
                link.addEventListener('mouseleave', hideTooltip);
            });
            
        } else {

            sidebar.style.width = '16rem';
            mainContent.style.marginLeft = '0';

            sidebarTexts.forEach(text => {
                text.style.display = '';
            });

            sidebarToggleDesktop.style.display = '';

            sidebarContent.style.justifyContent = '';

            chartIcon.style.marginRight = '';
            
            navLinks.forEach(link => {
                link.style.justifyContent = '';
            });

            navSection.style.paddingLeft = '';
            navSection.style.paddingRight = '';
            logoutSection.style.paddingLeft = '';
            logoutSection.style.paddingRight = '';
            
            navLinks.forEach(link => {
                link.removeEventListener('mouseenter', showTooltip);
                link.removeEventListener('mouseleave', hideTooltip);
            });

            document.querySelectorAll('.tooltip').forEach(tooltip => tooltip.remove());
        }
        
        // Update toggle button icon - always show bars icon
        sidebarToggleDesktop.innerHTML = `<i class="fas fa-bars text-lg"></i>`;
    }
    

    function showTooltip(e) {
        if (!isCollapsed) return;
        
        const tooltip = document.createElement('div');
        tooltip.className = 'tooltip';
        tooltip.textContent = e.currentTarget.getAttribute('data-tooltip');
        tooltip.style.cssText = `
            position: absolute;
            left: 100%;
            top: 50%;
            transform: translateY(-50%);
            margin-left: 0.5rem;
            padding: 0.5rem 0.75rem;
            background-color: #374151;
            color: white;
            border-radius: 0.375rem;
            font-size: 0.875rem;
            white-space: nowrap;
            z-index: 1000;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
            pointer-events: none;
        `;
        
        const arrow = document.createElement('div');
        arrow.style.cssText = `
            position: absolute;
            left: -4px;
            top: 50%;
            transform: translateY(-50%);
            width: 0;
            height: 0;
            border: 4px solid transparent;
            border-right-color: #374151;
        `;
        tooltip.appendChild(arrow);
        
        e.currentTarget.style.position = 'relative';
        e.currentTarget.appendChild(tooltip);
    }
    
    function hideTooltip(e) {
        const tooltip = e.currentTarget.querySelector('.tooltip');
        if (tooltip) {
            tooltip.remove();
        }
    }
    
    sidebarToggleDesktop.addEventListener('click', toggleSidebar);
    

    sidebar.addEventListener('click', function(e) {
        if (isCollapsed) {

            if (e.target.closest('.nav-link')) {
                return; 
            }

            if (e.target.closest('#sidebar-toggle-desktop')) {
                return;
            }
 
            toggleSidebar();
        }
    })});

    // Navigation functionality
    document.addEventListener('DOMContentLoaded', function() {
 
    const navLinks = document.querySelectorAll('aside nav a[href^="#"]');
    const sections = document.querySelectorAll('main section[id]');

    document.getElementById('overview').classList.remove('hidden');
    
    navLinks.forEach(link => {
        link.addEventListener('click', function(e) {
            e.preventDefault();

            navLinks.forEach(nav => {
                nav.classList.remove('text-white', 'bg-blue-600', 'dark:text-white', 'dark:bg-blue-600');
                nav.classList.add('text-black', 'dark:text-white', 'hover:bg-blue-600', 'hover:text-white', 'dark:hover:bg-blue-700');
            });
            
            this.classList.remove('text-black', 'dark:text-white', 'hover:bg-blue-600', 'hover:text-white', 'dark:hover:bg-blue-700');
            this.classList.add('text-white', 'bg-blue-600', 'dark:text-white', 'dark:bg-blue-600');

            sections.forEach(section => {
                section.classList.add('hidden');
            });
            
            const targetId = this.getAttribute('href').substring(1);
            const targetSection = document.getElementById(targetId);
            if (targetSection) {
                targetSection.classList.remove('hidden');
            }
        });
    });


    // Settings
    const saveSettingsBtn = document.getElementById('save-settings-btn');
    if (saveSettingsBtn) {
        saveSettingsBtn.addEventListener('click', function() {
            this.textContent = 'Saved!';
            this.classList.remove('bg-blue-600', 'hover:bg-blue-700');
            this.classList.add('bg-green-600', 'hover:bg-green-700');
            
            setTimeout(() => {
                this.textContent = 'Save Changes';
                this.classList.remove('bg-green-600', 'hover:bg-green-700');
                this.classList.add('bg-blue-600', 'hover:bg-blue-700');
            }, 2000);
        });
    }
});