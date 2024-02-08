let isSidebarOpen = false;
let isGuildsOpen = true; // Initialize it to true if you want the guilds to be open by default

function toggleSidebar() {
  const sidebar = document.querySelector('.sidebar_ded4b5');

  if (isSidebarOpen) {
    sidebar.style.width = '0';
  } else {
    sidebar.style.width = '240px';
  }

  isSidebarOpen = !isSidebarOpen;
}

function toggleGuilds() {
  const guilds = document.querySelector('.guilds__2b93a');

  if (isGuildsOpen) {
    guilds.style.marginLeft = '0';
  } else {
    guilds.style.marginLeft = '-72px';
  }

  isGuildsOpen = !isGuildsOpen;
}

document.addEventListener('keydown', function (event) {
  if (event.ctrlKey && event.shiftKey && event.key === 'X') {
    toggleSidebar();
  }
  if (event.ctrlKey && event.shiftKey && event.key === 'Z') {
    toggleGuilds();
  }
});
