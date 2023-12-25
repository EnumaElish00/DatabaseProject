document.addEventListener('DOMContentLoaded', function () {
    // Fetch and display dishes on page load
    fetchDishes();

     // Fetch and display categories on page load
     fetchCategories();

     // Fetch and display origins on page load
     fetchOrigins();

    function fetchDishes() {
        fetch('http://localhost:3100/api/dishes')
            .then(response => response.json())
            .then(dishes => {
                displayDishes(dishes);
            })
            .catch(error => console.error('Error fetching dishes:', error));
    }

    function displayDishes(dishes) {
        const dishesList = document.getElementById('dishesList');
        dishesList.innerHTML = ''; // Clear previous content

        dishes.forEach(dish => {
            const listItem = document.createElement('li');
            listItem.className = 'list-group-item';
            listItem.textContent = dish.Name;

            // Attach a click event to show dish details modal
            listItem.addEventListener('click', function () {
                console.log('Clicked'); // Debugging statement
                fetchDishDetails(dish.ID);
            });

            dishesList.appendChild(listItem);
        });
    }

    function fetchDishDetails(dishId) {
        fetch(`http://localhost:3100/api/dishes/details/${dishId}`)
            .then(response => response.json())
            .then(dishDetails => {
                displayDishDetails(dishDetails);
                $('#dishDetailsModal').modal('show');
            })
            .catch(error => console.error('Error fetching dish details:', error));
    }

    function displayDishDetails(dishDetails) {
        const dishDetailsBody = document.getElementById('dishDetailsBody');
        dishDetailsBody.innerHTML = ''; // Clear previous content
    
        // Display basic dish information including Price
        const dishTitle = document.createElement('h4');
        dishTitle.textContent = `${dishDetails[0].Name} - Price: ${dishDetails[0].Price}`;
        dishDetailsBody.appendChild(dishTitle);
    
        // Display ingredients
        const ingredientsList = document.createElement('ul');
        ingredientsList.className = 'list-group';
        dishDetails.forEach(detail => {
            const ingredientItem = document.createElement('li');
            ingredientItem.className = 'list-group-item';
            ingredientItem.textContent = `${detail.IngredientName}`;
            ingredientsList.appendChild(ingredientItem);
        });
        dishDetailsBody.appendChild(ingredientsList);
    }

     // New function to fetch categories
     function fetchCategories() {
        fetch('http://localhost:3100/api/dishes/categories')
            .then(response => response.json())
            .then(categories => {
                displayButtons(categories, 'categoryButtons', 'category');
            })
            .catch(error => console.error('Error fetching categories:', error));
    }

    // New function to fetch origins
    function fetchOrigins() {
        fetch('http://localhost:3100/api/dishes/origins')
            .then(response => response.json())
            .then(origins => {
                displayButtons(origins, 'originButtons', 'origin');
            })
            .catch(error => console.error('Error fetching origins:', error));
    }

     // New function to display buttons dynamically
     function displayButtons(items, containerId, dataAttribute) {
        const container = document.getElementById(containerId);
        container.innerHTML = ''; // Clear previous content
    
        items.forEach(item => {
            const button = document.createElement('button');
            button.type = 'button';
            button.className = 'btn btn-secondary';
            button.textContent = item.Name;
    
            // Attach a click event to fetch dishes based on category or origin
            button.addEventListener('click', function () {
                // Check dataAttribute and use the correct property
                const attributeId = dataAttribute === 'category' ? item.ID_Category : item.ID;
                fetchDishesByAttribute(attributeId, dataAttribute);
            });
    
            container.appendChild(button);
        });
    }

     // New function to fetch dishes based on category or origin
     function fetchDishesByAttribute(attributeId, attributeType) {
        fetch(`http://localhost:3100/api/dishes/${attributeType}/${attributeId}`)
            .then(response => response.json())
            .then(dishes => {
                displayDishes(dishes);
            })
            .catch(error => console.error(`Error fetching dishes by ${attributeType}:`, error));
    }
    
});
