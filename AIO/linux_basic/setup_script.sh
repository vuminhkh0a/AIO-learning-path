#!/bin/bash
# setup_practice_data.sh - Tạo dữ liệu thực hành cho bài giảng Unix/Linux for Data Science
# Run: bash setup_practice_data.sh
# Author: Nguyen Thai Ha

echo "Setting up practice data for Unix/Linux Data Science Course..."

# Tạo cấu trúc thư mục
echo "Creating directory structure..."
mkdir -p unix_data_science_practice/{data/{raw,processed,external},logs,config,scripts,reports}

cd unix_data_science_practice

# ===============================
# 1. CUSTOMER DATA (CSV)
# ===============================
echo "Creating customer dataset..."
cat > data/raw/customers.csv << 'EOF'
customer_id,first_name,last_name,email,age,city,state,signup_date,last_login,subscription_tier,total_spent
C001,Alice,Johnson,alice.j@email.com,28,New York,NY,2023-01-15,2024-06-20,premium,2150.75
C002,Bob,Smith,bob.smith@email.com,34,Los Angeles,CA,2023-02-20,2024-06-15,basic,890.50
C003,Carol,Brown,c.brown@email.com,25,Chicago,IL,2023-03-10,2024-05-30,premium,3200.00
C004,David,Wilson,d.wilson@email.com,45,Houston,TX,2023-01-25,2024-06-22,basic,1200.25
C005,Eva,Davis,eva.d@email.com,31,Phoenix,AZ,2023-04-05,2024-04-10,premium,1875.60
C006,Frank,Miller,f.miller@email.com,29,Philadelphia,PA,2023-02-15,2024-06-18,basic,650.80
C007,Grace,Lee,grace.lee@email.com,38,San Antonio,TX,2023-01-30,2024-06-19,premium,2890.45
C008,Henry,Taylor,h.taylor@email.com,42,San Diego,CA,2023-03-20,2024-03-25,basic,425.90
C009,Ivy,Chen,ivy.chen@email.com,27,Dallas,TX,2023-05-01,2024-06-21,premium,1680.30
C010,Jack,Brown,j.brown@email.com,33,San Jose,CA,2023-02-10,2024-06-17,basic,780.15
C011,Karen,White,k.white@email.com,29,Austin,TX,2023-06-01,2024-06-23,premium,1950.80
C012,Leo,Garcia,leo.g@email.com,35,Jacksonville,FL,2023-01-08,2024-06-16,basic,520.40
C013,Maria,Rodriguez,m.rodriguez@email.com,26,San Francisco,CA,2023-04-15,2024-06-14,premium,2750.65
C014,Nick,Anderson,nick.a@email.com,41,Columbus,OH,2023-03-05,2024-05-20,basic,890.70
C015,Olivia,Thomas,o.thomas@email.com,30,Charlotte,NC,2023-02-28,2024-06-19,premium,2100.90
EOF

# ===============================
# 2. SALES TRANSACTIONS (CSV)
# ===============================
echo "Creating sales transactions..."
cat > data/raw/sales_transactions.csv << 'EOF'
transaction_id,customer_id,product_id,product_name,category,quantity,unit_price,total_amount,transaction_date,payment_method
T001,C001,P101,Wireless Headphones,Electronics,1,150.00,150.00,2024-06-20,credit_card
T002,C002,P205,Python Programming Book,Books,2,25.99,51.98,2024-06-15,paypal
T003,C003,P301,Smartphone,Electronics,1,899.99,899.99,2024-05-30,credit_card
T004,C001,P150,USB Cable,Electronics,3,15.00,45.00,2024-06-18,credit_card
T005,C004,P401,Business Shirt,Clothing,2,89.99,179.98,2024-06-22,debit_card
T006,C005,P102,Bluetooth Speaker,Electronics,1,89.95,89.95,2024-04-10,credit_card
T007,C006,P206,Data Science Handbook,Books,1,45.50,45.50,2024-06-18,paypal
T008,C007,P302,Laptop,Electronics,1,1299.99,1299.99,2024-06-19,credit_card
T009,C009,P402,Summer Dress,Clothing,1,55.50,55.50,2024-06-21,credit_card
T010,C010,P103,Wireless Mouse,Electronics,1,35.25,35.25,2024-06-17,debit_card
T011,C003,P207,Machine Learning Book,Books,1,65.99,65.99,2024-06-01,credit_card
T012,C011,P151,Phone Charger,Electronics,2,20.00,40.00,2024-06-23,paypal
T013,C007,P403,Casual Pants,Clothing,1,75.80,75.80,2024-06-10,credit_card
T014,C013,P303,Tablet,Electronics,1,449.99,449.99,2024-06-14,credit_card
T015,C015,P208,Statistics Textbook,Books,1,89.95,89.95,2024-06-19,debit_card
EOF

# ===============================
# 3. WEBSITE ACCESS LOGS
# ===============================
echo "Creating website access logs..."
cat > logs/website_access.log << 'EOF'
192.168.1.101 - - [20/Jun/2024:10:30:15 +0000] "GET /home HTTP/1.1" 200 2048 "https://google.com" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36"
192.168.1.102 - - [20/Jun/2024:10:31:20 +0000] "GET /products/electronics HTTP/1.1" 200 3072 "https://example.com/home" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36"
10.0.0.50 - - [20/Jun/2024:10:32:45 +0000] "POST /api/cart/add HTTP/1.1" 200 512 "https://example.com/products" "Mozilla/5.0 (iPhone; CPU iPhone OS 14_7_1 like Mac OS X) AppleWebKit/605.1.15"
192.168.1.101 - - [20/Jun/2024:10:35:10 +0000] "GET /checkout HTTP/1.1" 200 1024 "https://example.com/cart" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36"
203.113.45.12 - - [20/Jun/2024:10:40:55 +0000] "GET /admin/login HTTP/1.1" 404 256 "-" "python-requests/2.28.1"
192.168.1.103 - - [20/Jun/2024:11:15:30 +0000] "GET /products/books HTTP/1.1" 200 2560 "https://google.com" "Mozilla/5.0 (Linux; Android 11; SM-G991B) AppleWebKit/537.36"
10.0.0.51 - - [20/Jun/2024:11:20:45 +0000] "POST /api/payment HTTP/1.1" 500 128 "https://example.com/checkout" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36"
192.168.1.104 - - [20/Jun/2024:11:25:15 +0000] "GET /profile HTTP/1.1" 200 1536 "https://example.com/home" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36"
8.8.8.8 - - [20/Jun/2024:11:30:20 +0000] "GET /robots.txt HTTP/1.1" 200 64 "-" "Googlebot/2.1"
192.168.1.102 - - [20/Jun/2024:11:35:40 +0000] "GET /search?q=laptop HTTP/1.1" 200 4096 "https://example.com/home" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36"
172.16.0.25 - - [20/Jun/2024:12:10:15 +0000] "GET /api/products HTTP/1.1" 200 8192 "-" "curl/7.68.0"
192.168.1.105 - - [20/Jun/2024:12:15:30 +0000] "POST /api/reviews HTTP/1.1" 201 256 "https://example.com/products/P301" "Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/605.1.15"
203.113.45.12 - - [20/Jun/2024:12:20:45 +0000] "GET /wp-admin HTTP/1.1" 404 256 "-" "python-requests/2.28.1"
192.168.1.106 - - [20/Jun/2024:12:25:10 +0000] "GET /contact HTTP/1.1" 200 1024 "https://example.com/home" "Mozilla/5.0 (Linux; Android 12; Pixel 6) AppleWebKit/537.36"
10.0.0.52 - - [20/Jun/2024:12:30:55 +0000] "DELETE /api/cart/P101 HTTP/1.1" 204 0 "https://example.com/cart" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36"
EOF

# ===============================
# 4. APPLICATION LOGS
# ===============================
echo "Creating application logs..."
cat > logs/application.log << 'EOF'
2024-06-20 10:30:15 INFO [main] Starting e-commerce application v2.1.0
2024-06-20 10:30:16 INFO [db] Database connection established: postgresql://localhost:5432/ecommerce
2024-06-20 10:30:17 INFO [cache] Redis cache connected: localhost:6379
2024-06-20 10:31:20 INFO [api] User C001 authenticated successfully
2024-06-20 10:32:45 INFO [cart] Item P101 added to cart for user C001
2024-06-20 10:35:10 INFO [checkout] Processing payment for order O001, amount: $150.00
2024-06-20 10:35:12 INFO [payment] Payment successful: transaction_id=T001
2024-06-20 10:40:55 WARN [security] Suspicious login attempt from IP 203.113.45.12
2024-06-20 11:15:30 INFO [api] User C003 authenticated successfully
2024-06-20 11:20:45 ERROR [payment] Payment failed for order O002: insufficient_funds
2024-06-20 11:20:46 ERROR [payment] Payment processor timeout, order O002 marked as failed
2024-06-20 11:25:15 INFO [profile] User C004 updated profile information
2024-06-20 11:30:20 INFO [crawler] Search engine bot detected: Googlebot/2.1
2024-06-20 11:35:40 INFO [search] Search query executed: "laptop", results: 45 items
2024-06-20 12:10:15 INFO [api] API rate limit warning for IP 172.16.0.25: 95/100 requests
2024-06-20 12:15:30 INFO [reviews] New review submitted for product P301, rating: 5 stars
2024-06-20 12:20:45 WARN [security] Multiple failed login attempts from IP 203.113.45.12, blocking for 1 hour
2024-06-20 12:25:10 INFO [contact] Contact form submitted by user C006
2024-06-20 12:30:55 INFO [cart] Item P101 removed from cart for user C001
2024-06-20 12:35:20 ERROR [inventory] Product P205 out of stock, order O003 cannot be fulfilled
EOF

# ===============================
# 5. API RESPONSE (JSON)
# ===============================
echo "Creating API response data..."
cat > data/external/api_responses.json << 'EOF'
{
  "user_analytics": {
    "total_users": 15,
    "active_users_today": 12,
    "new_signups_this_month": 3,
    "churn_rate": 8.5,
    "engagement_metrics": [
      {"date": "2024-06-20", "page_views": 145, "unique_visitors": 12, "bounce_rate": 32.1},
      {"date": "2024-06-21", "page_views": 189, "unique_visitors": 15, "bounce_rate": 28.7},
      {"date": "2024-06-22", "page_views": 167, "unique_visitors": 13, "bounce_rate": 35.2}
    ]
  },
  "sales_summary": {
    "total_revenue": 8956.43,
    "total_orders": 15,
    "average_order_value": 597.09,
    "conversion_rate": 23.4,
    "top_categories": [
      {"category": "Electronics", "revenue": 4825.62, "orders": 8},
      {"category": "Books", "revenue": 328.91, "orders": 4},
      {"category": "Clothing", "revenue": 387.08, "orders": 3}
    ]
  },
  "product_performance": [
    {"product_id": "P301", "name": "Smartphone", "category": "Electronics", "sales": 899.99, "views": 234, "conversion": 12.8},
    {"product_id": "P302", "name": "Laptop", "category": "Electronics", "sales": 1299.99, "views": 189, "conversion": 15.3},
    {"product_id": "P101", "name": "Wireless Headphones", "category": "Electronics", "sales": 150.00, "views": 456, "conversion": 8.7},
    {"product_id": "P207", "name": "Machine Learning Book", "category": "Books", "sales": 65.99, "views": 78, "conversion": 4.2}
  ]
}
EOF

# ===============================
# 6. WEATHER DATA (JSON)
# ===============================
echo "Creating weather dataset..."
cat > data/external/weather_data.json << 'EOF'
{
  "location": "Hanoi, Vietnam",
  "timezone": "Asia/Ho_Chi_Minh",
  "current": {
    "temperature": 28.5,
    "humidity": 72,
    "pressure": 1013.2,
    "description": "partly cloudy"
  },
  "forecast": [
    {"date": "2024-06-20", "temp_min": 24.1, "temp_max": 32.3, "humidity": 68, "precipitation": 0.2},
    {"date": "2024-06-21", "temp_min": 25.2, "temp_max": 31.8, "humidity": 74, "precipitation": 5.1},
    {"date": "2024-06-22", "temp_min": 23.9, "temp_max": 29.7, "humidity": 81, "precipitation": 12.3},
    {"date": "2024-06-23", "temp_min": 22.5, "temp_max": 28.4, "humidity": 79, "precipitation": 8.7},
    {"date": "2024-06-24", "temp_min": 24.8, "temp_max": 33.1, "humidity": 66, "precipitation": 0.0}
  ]
}
EOF

# ===============================
# 7. MODEL TRAINING LOGS
# ===============================
echo "Creating ML model logs..."
cat > logs/model_training.log << 'EOF'
2024-06-20 09:00:01 INFO Starting model training: RandomForestClassifier
2024-06-20 09:00:02 INFO Dataset loaded: 10000 samples, 15 features
2024-06-20 09:00:05 INFO Train/test split: 8000/2000 samples
2024-06-20 09:00:10 INFO Epoch 1/10 - accuracy: 0.72, precision: 0.68, recall: 0.75, f1: 0.71
2024-06-20 09:02:15 INFO Epoch 2/10 - accuracy: 0.78, precision: 0.74, recall: 0.82, f1: 0.78
2024-06-20 09:04:20 INFO Epoch 3/10 - accuracy: 0.83, precision: 0.79, recall: 0.87, f1: 0.83
2024-06-20 09:06:25 INFO Epoch 4/10 - accuracy: 0.85, precision: 0.82, recall: 0.88, f1: 0.85
2024-06-20 09:08:30 INFO Epoch 5/10 - accuracy: 0.87, precision: 0.84, recall: 0.90, f1: 0.87
2024-06-20 09:10:35 WARN Epoch 6/10 - accuracy: 0.86, precision: 0.83, recall: 0.89, f1: 0.86 (slight decrease)
2024-06-20 09:12:40 INFO Epoch 7/10 - accuracy: 0.88, precision: 0.85, recall: 0.91, f1: 0.88
2024-06-20 09:14:45 INFO Epoch 8/10 - accuracy: 0.89, precision: 0.86, recall: 0.92, f1: 0.89
2024-06-20 09:16:50 WARN Epoch 9/10 - accuracy: 0.88, precision: 0.85, recall: 0.91, f1: 0.88 (overfitting detected)
2024-06-20 09:18:55 INFO Epoch 10/10 - accuracy: 0.87, precision: 0.84, recall: 0.90, f1: 0.87
2024-06-20 09:19:00 INFO Training completed. Best model: Epoch 8 (accuracy: 0.89)
2024-06-20 09:19:05 INFO Model saved: models/random_forest_20240620.pkl
2024-06-20 09:19:10 INFO Feature importance calculated and saved
2024-06-20 09:19:15 INFO Cross-validation score: 0.86 ± 0.03
EOF

# ===============================
# 8. CONFIGURATION FILES
# ===============================
echo "Creating configuration files..."
cat > config/database.conf << 'EOF'
# Database Configuration
host=localhost
port=5432
database=ecommerce_db
username=admin
password=secret123
max_connections=100
timeout=30

# Redis Cache
redis_host=localhost
redis_port=6379
redis_db=0
cache_ttl=3600
EOF

cat > config/app_settings.ini << 'EOF'
[general]
app_name=E-commerce Platform
version=2.1.0
debug=false
log_level=INFO

[api]
base_url=https://api.example.com
rate_limit=1000
timeout=30
retry_attempts=3

[features]
enable_analytics=true
enable_recommendations=true
enable_notifications=false
maintenance_mode=false
EOF

# ===============================
# 9. SCRIPTS
# ===============================
echo "Creating utility scripts..."
cat > scripts/data_summary.sh << 'EOF'
#!/bin/bash
# Quick data summary script

echo "=== DATA SUMMARY REPORT ==="
echo "Generated: $(date +'%Y-%m-%d %H:%M:%S')"
echo "================================"

echo -e "\nCUSTOMER METRICS:"
echo "Total customers: $(tail -n +2 data/raw/customers.csv | wc -l)"
echo "Premium customers: $(tail -n +2 data/raw/customers.csv | grep -c premium)"
echo "Basic customers: $(tail -n +2 data/raw/customers.csv | grep -c basic)"

echo -e "\nSALES METRICS:"
echo "Total transactions: $(tail -n +2 data/raw/sales_transactions.csv | wc -l)"
echo "Total revenue: $(tail -n +2 data/raw/sales_transactions.csv | cut -d',' -f8 | awk '{sum+=$1} END {print sum}')"

echo -e "\nWEB TRAFFIC:"
echo "Total requests: $(wc -l < logs/website_access.log)"
echo "Unique IPs: $(cut -d' ' -f1 logs/website_access.log | sort | uniq | wc -l)"
echo "404 errors: $(grep -c " 404 " logs/website_access.log)"

echo -e "\nAPPLICATION HEALTH:"
echo "Error count: $(grep -c ERROR logs/application.log)"
echo "Warning count: $(grep -c WARN logs/application.log)"
echo "Info messages: $(grep -c INFO logs/application.log)"
EOF

chmod +x scripts/data_summary.sh

# ===============================
# 10. SAMPLE DATA FILES FOR PRACTICE
# ===============================
echo "Creating practice files..."

# Simple numbers file for basic commands
echo "Creating numbers.txt..."
seq 1 100 | shuf > data/raw/numbers.txt

# Names file for sorting practice
cat > data/raw/names.txt << 'EOF'
Alice
Bob
Carol
David
Eva
Frank
Grace
Henry
Ivy
Jack
Karen
Leo
Maria
Nick
Olivia
EOF

# Mixed data for grep practice
cat > data/raw/mixed_data.txt << 'EOF'
apple,red,sweet,5.99
BANANA,yellow,sweet,2.99
Cherry,red,sour,8.99
date,brown,sweet,12.99
Elderberry,purple,tart,15.99
fig,purple,sweet,7.99
GRAPE,green,sweet,4.99
honeydew,green,sweet,6.99
EOF

# ===============================
# COMPLETION MESSAGE
# ===============================
echo ""
echo "Practice data setup completed!"
echo ""
echo "Created structure:"
tree . 2>/dev/null || find . -type d | head -10
echo ""
echo "Files created:"
echo "   • Customer data: data/raw/customers.csv (15 customers)"
echo "   • Sales data: data/raw/sales_transactions.csv (15 transactions)"
echo "   • Web logs: logs/website_access.log (15 requests)"
echo "   • App logs: logs/application.log (20 entries)"
echo "   • API data: data/external/api_responses.json"
echo "   • Weather data: data/external/weather_data.json"
echo "   • Config files: config/*.conf, config/*.ini"
echo "   • Utility script: scripts/data_summary.sh"
echo ""
echo "Ready for hands-on practice!"
echo "Try: ./scripts/data_summary.sh"
