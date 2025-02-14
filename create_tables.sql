-- categoriesテーブル
CREATE TABLE
  categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    parent_category_id INT,
    FOREIGN KEY (parent_category_id) REFERENCES categories (category_id)
  ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- usersテーブル
CREATE TABLE
  users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    address VARCHAR(255),
    tel VARCHAR(20),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
  ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- productsテーブル
CREATE TABLE
  products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price INT NOT NULL,
    category_id INT,
    image_url VARCHAR(255),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES categories (category_id)
  ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- ordersテーブル
CREATE TABLE
  orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    total_price INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users (user_id)
  ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- order_detailsテーブル
CREATE TABLE
  order_details (
    order_detail_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders (order_id),
    FOREIGN KEY (product_id) REFERENCES products (product_id)
  ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;