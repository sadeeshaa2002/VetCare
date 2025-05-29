// Video data
const videos = [
    {
        id: 'o47dCAM4Ygw',
        title: 'Learn the Basics of Pet Care from Expert Veterinarian',
        description: 'Essential pet care tips covering nutrition, grooming, and health checkups from professional veterinarians.',
        date: 'May 15, 2023',
        views: '1,245',
        duration: '10:25'
    },
    {
        id: 'Yxtbvo2rFEA',
        title: 'First Aid for Pets',
        description: 'Learn basic first aid techniques to help your pet in emergency situations.',
        date: 'April 28, 2023',
        views: '892',
        duration: '15:10'
    },
    {
        id: 'jFMA5ggFsXU',
        title: 'Dog Training Fundamentals',
        description: 'Professional dog trainer shares fundamental training techniques for puppies and adult dogs.',
        date: 'June 2, 2023',
        views: '1,567',
        duration: '12:30'
    },
    {
        id: 'aew425tNxAU',
        title: 'Cat Grooming Techniques',
        description: 'Proper grooming methods for different cat breeds.',
        date: 'March 30, 2023',
        views: '1,023',
        duration: '7:45'
    },
    {
        id: '11d88s_iEUk',
        title: 'Pet Nutrition Guide - Part 1',
        description: 'Understanding the nutritional needs of your pets.',
        date: 'April 28, 2023',
        views: '892',
        duration: '8:15'
    }
];

// Playlist data
const playlists = [
    {
        id: 'PLZBrTMqP6ffH3InM4yFXLoOX8lGYfhN70',
        title: 'First Aid for Pets',
        description: 'Preparing for the unexpected',
        videoCount: '8',
        thumbnail: 'https://img.youtube.com/vi/Yxtbvo2rFEA/hqdefault.jpg'
    },
    {
        id: 'PLuC3XYn_061jfMKm84Dt5SH7R2gye2VHp',
        title: 'Complete Dog Training',
        description: 'From basic to advanced',
        videoCount: '12',
        thumbnail: 'https://img.youtube.com/vi/jFMA5ggFsXU/hqdefault.jpg'
    }
];

// Articles data
const articles = [
    {
        id: 'dog-exercise',
        title: 'Exercise Requirements for Different Dog Breeds',
        category: 'dogs',
        image: 'https://www.ageas.co.uk/globalassets/solved/dogs-that-need-the-most-exercise.jpg?w=670&scale=both&quality=75',
        excerpt: 'Learn how much exercise your dog really needs based on their breed and age.',
        date: 'May 10, 2023',
        readTime: '5 min read',
        link: 'https://news.orvis.com/dogs/dog-exercise-needs-by-breed'
    },
    {
        id: 'cat-nutrition',
        title: 'Understanding Your Cat\'s Nutritional Needs',
        category: 'cats',
        image: 'https://thepetexperience.co.uk/wp-content/uploads/2025/02/2146.jpg',
        excerpt: 'A complete guide to feeding your feline friend for optimal health.',
        date: 'May 5, 2023',
        readTime: '4 min read',
        link: 'https://nap.nationalacademies.org/resource/10668/cat_nutrition_final.pdf'

    },
    {
        id: 'pet-vaccination',
        title: 'Vaccination Schedule for Pets: What You Need to Know',
        category: 'health',
        image: 'https://abc6onyourside.com/resources/media/dd5b7111-13a7-4874-b313-cfce57732fbf-PetVaccineDebateFSB_CLEAN.jpg',
        excerpt: 'Keep your pets protected with this essential vaccination timeline.',
        date: 'April 28, 2023',
        readTime: '6 min read',
        link: 'https://www.researchgate.net/publication/254739350_Current_vaccination_strategies_in_dogs_and_cats'
    },
    {
        id: 'senior-dog-care',
        title: 'Special Care for Senior Dogs',
        category: 'dogs',
        image: 'https://d2zp5xs5cp8zlg.cloudfront.net/image-91865-800.jpg',
        excerpt: 'How to adjust your care routine as your dog ages.',
        date: 'April 20, 2023',
        readTime: '7 min read',
        link: 'https://vcahospitals.com/know-your-pet/senior-dog-care-special-considerations-for-dogs'
    },
    {
        id: 'cat-behavior',
        title: 'Decoding Common Cat Behaviors',
        category: 'cats',
        image: 'https://hsmagazinekenya.s3.us-east-2.amazonaws.com/wp-content/uploads/2024/08/27011739/Decoding-Feline-Behaviour.png',
        excerpt: 'What your cat is really trying to tell you with their actions.',
        date: 'April 15, 2023',
        readTime: '5 min read',
        link: 'https://www.medvet.com/cat-behaviors/'
    },
    {
        id: 'homemade-dog-food',
        title: 'Healthy Homemade Dog Food Recipes',
        category: 'nutrition',
        image: 'https://worldofdogz.com/wp-content/uploads/2023/01/What-Is-The-Best-Diet-For-Large-Dogs.jpg',
        excerpt: 'Nutritious and delicious meals you can make for your pup at home.',
        date: 'April 5, 2023',
        readTime: '8 min read',
        link: 'https://damndelicious.net/2015/04/27/diy-homemade-dog-food/'
    }
];

// DOM Elements
const featuredVideo = document.getElementById('featured-video');
const videoTitle = document.getElementById('video-title');
const videoDescription = document.getElementById('video-description');
const videoDate = document.getElementById('video-date');
const videoViews = document.getElementById('video-views');
const videoList = document.getElementById('video-list');
const playlistGrid = document.getElementById('playlist-grid');
const articlesGrid = document.getElementById('articles-grid');
const filterButtons = document.querySelectorAll('.filter-btn');

// Initialize the page
document.addEventListener('DOMContentLoaded', function() {
    // Load the first video as featured
    loadFeaturedVideo(videos[0]);
    
    // Load video list
    loadVideoList();
    
    // Load playlists
    loadPlaylists();
    
    // Load all articles
    loadArticles();
    
    // Initialize filter functionality
    initFilters();
    
    // Create floating pets animation
    createFloatingPets();
});

// Load featured video
function loadFeaturedVideo(video) {
    featuredVideo.src = `https://www.youtube.com/embed/${video.id}?autoplay=0&rel=0&modestbranding=1`;
    videoTitle.textContent = video.title;
    videoDescription.textContent = video.description;
    videoDate.textContent = `Published: ${video.date}`;
    videoViews.textContent = `${video.views} views`;
}

// Load video list
function loadVideoList() {
    videoList.innerHTML = '';
    
    videos.forEach((video, index) => {
        const videoItem = document.createElement('div');
        videoItem.className = 'video-item';
        if (index === 0) videoItem.classList.add('active');
        
        videoItem.innerHTML = `
            <div class="video-item-thumb">
                <img src="https://img.youtube.com/vi/${video.id}/hqdefault.jpg" alt="${video.title}" loading="lazy">
            </div>
            <div class="video-item-info">
                <h4>${video.title}</h4>
                <p>${video.duration}</p>
            </div>
        `;
        
        videoItem.addEventListener('click', () => {
            // Remove active class from all items
            document.querySelectorAll('.video-item').forEach(item => {
                item.classList.remove('active');
            });
            
            // Add active class to clicked item
            videoItem.classList.add('active');
            
            // Load the selected video
            loadFeaturedVideo(video);
            
            // Smooth scroll to top of video section
            document.querySelector('.video-section').scrollIntoView({
                behavior: 'smooth'
            });
        });
        
        videoList.appendChild(videoItem);
    });
}

// Load playlists
function loadPlaylists() {
    playlistGrid.innerHTML = '';
    
    playlists.forEach(playlist => {
        const playlistItem = document.createElement('div');
        playlistItem.className = 'playlist-item';
        
        playlistItem.innerHTML = `
            <a href="https://www.youtube.com/playlist?list=${playlist.id}" target="_blank" rel="noopener noreferrer">
                <div class="playlist-thumbnail">
                    <img src="${playlist.thumbnail}" alt="${playlist.title}" loading="lazy">
                    <div class="playlist-overlay">
                        <i class="fas fa-list"></i>
                        <span>${playlist.videoCount} videos</span>
                    </div>
                </div>
                <h4>${playlist.title}</h4>
                <p>${playlist.description}</p>
            </a>
        `;
        
        playlistGrid.appendChild(playlistItem);
    });
}

// Load articles with clickable cards
function loadArticles(filter = 'all') {
    articlesGrid.innerHTML = '';
    
    const filteredArticles = filter === 'all' 
        ? articles 
        : articles.filter(article => article.category === filter);
    
  filteredArticles.forEach((article, index) => {
        const articleCard = document.createElement('a');
        articleCard.className = 'article-card';
        articleCard.href = article.link;
        articleCard.target = '_blank';
        articleCard.rel = 'noopener noreferrer';
        articleCard.dataset.category = article.category;
        articleCard.style.animationDelay = `${index * 0.1}s`;
        
            articleCard.innerHTML = `
            <div class="article-image">
                <img src="${article.image}" alt="${article.title}" loading="lazy">
            </div>
            <div class="article-content">
                <span class="article-tag">${article.category.charAt(0).toUpperCase() + article.category.slice(1)}</span>
                <h3>${article.title}</h3>
                <p>${article.excerpt}</p>
                <div class="article-meta">
                    <span>${article.date}</span>
                    <span class="read-more">Read More <i class="fas fa-arrow-right"></i></span>
                </div>
            </div>
        `;
        
        articlesGrid.appendChild(articleCard);
    });
}

// Initialize filter functionality
function initFilters() {
    filterButtons.forEach(button => {
        button.addEventListener('click', () => {
            // Remove active class from all buttons
            filterButtons.forEach(btn => {
                btn.classList.remove('active');
            });
            
            // Add active class to clicked button
            button.classList.add('active');
            
            // Filter articles
            const filter = button.dataset.filter;
            loadArticles(filter);
        });
    });
}

// Create floating pets animation
function createFloatingPets() {
    const container = document.getElementById('floating-pets');
    const petTypes = ['🐕', '🐈', '🐩', '🐕‍🦺', '🐈‍⬛', '🐇', '🐾'];
    
    for (let i = 0; i < 15; i++) {
        const pet = document.createElement('div');
        pet.className = 'pet';
        pet.textContent = petTypes[Math.floor(Math.random() * petTypes.length)];
        pet.style.left = `${Math.random() * 100}%`;
        pet.style.animationDuration = `${10 + Math.random() * 20}s`;
        pet.style.animationDelay = `${Math.random() * 5}s`;
        pet.style.fontSize = `${20 + Math.random() * 20}px`;
        container.appendChild(pet);
    }
}