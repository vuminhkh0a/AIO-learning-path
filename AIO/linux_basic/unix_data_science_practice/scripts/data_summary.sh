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
