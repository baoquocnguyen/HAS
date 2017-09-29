cd /etc/apache2/sites-available
sudo a2enmod headers
sudo a2ensite priority.conf
sudo service apache2 reload 
sudo service apache2 start
sudo service apache2 reload
cd 
cd /home/quoc/Test/02_fairness_test/03_chrome_test_priority
