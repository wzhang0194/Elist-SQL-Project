# Portfolio Project - Elist Sales Analysis
Elist is a sample e-commerce company that sells popular electronics to customers around the world. In this portfolio project, I analyzed a sample dataset to investigate trends in revenue, average order value, product popularity, marketing channels, refund rates, and operations to surface insights on overall company performance.

I used SQL queries [here](https://github.com/wzhang0194/Elist-SQL-Project/blob/main/Elist_SQL_Queries.sql) to analyze and summarize the insights below, to be delivered to the finance, product, and marketing teams.

# Summary of Insights
**North America Quarterly Sales Trends (all years)** 
* Between 2019 and 2022, Elist sold an average of 89 Macbooks per quarter to North American customers, resulting in an average quarterly sales revenue of $143.5K. The Macbooks had an average order price of $1600.
  
**North America Monthly Sales Trends (all years)** 
* Between 2019 and 2022, Elist sold an average of 30 Macbooks per month to North American customers , resulting in an average monthly sales of $47.8K. The Macbooks had an average order price of $1603.

**Refund Trends in 2020 and 2021 :**
* In 2020, the monthly refund rates for orders varied between 2% and 3%. The month with the highest number of refunds was May 2020, with a total of 92 refunds and a refund percentage of 3%. 
* In 2021, the number of refunds for Apple products ranged from 7 to 30 per month, with the highest number of refunds occurring in March. Furthermore, the average number of returns for Apple products during the first six months of 2021 was 24, whereas during the last six months, it significantly dropped to an average of just 8 returns.

**Product Refund Trends:**
* The Macbook Air Laptop (4.2%), Thinkpad Laptop (3.8%), and Apple iPhone (3.5%) are the top three products with the highest refund rates. However, it's important to note that this does not necessarily imply that they have the highest number of refunds.
* It should be noted that the Apple iPhone only had 7 refunds compared to the 118 of the Macbook Air Laptop and 79 of the Thinkpad Laptop. 
* The top three products with the highest refund counts are the Apple Airpods headphones (647), 27in 4K gaming monitor (395), and Macbook Air Laptop (118).

**Account Creation Method Trends in Jan/Feb 2022:**
* In the first two months of 2022, the desktop accounted for the majority of customer signups, with a significant number of 2,487 registrations. Following closely behind was mobile, which accounted for 701 customer signups, making it the second most popular account creation method.
* The top two account creation methods, desktop and mobile, had distinct average order values. Desktop users had an average order value of $236, whereas mobile users had an average order value of $185.

**Time to Purchase and Deliver:**
* On average, customers make a purchase approximately two months (64 days) after creating their account, and the average delivery time from the date of purchase is 14 days.

**Marketing Channels:**
* The "best" marketing channel, in this context, is defined as the one with the highest number of orders.
* The direct marketing channel consistently ranks as the top choice across all regions, except in cases where the region is unknown. In such instances, affiliate marketing emerges as the channel with the highest number of orders.
* However, it is important to note that "direct" is not typically considered a marketing channel as it represents customers who directly visit the website without any specific referral. After accounting for direct visits, email emerges as the second-highest marketing channel in terms of the number of orders across all regions.

# Technical Analysis
Sample of query used for sales trends below. More detailed analysis is contained in the sql file in this repository.
![QUERY](https://github.com/wzhang0194/Elist-SQL-Project/assets/129554366/06bf32c3-6a97-4d06-9fd5-0af8caa6650a)

# Recommendations
Based on these insights, the team would like to make several recommendations across several areas:

* **Products:**
    * Maximize Macbook Air Laptop Sales Potential: Although the Macbook Air Laptop maintains a relatively lower average order rate of 3%, its impressive contribution of 21% to total sales signifies strong customer demand. To leverage this potential, consider implementing strategies such as bundling offers with complementary accessories, providing attractive financing options, or highlighting unique features to capture a larger market share for the Macbook Air Laptop.
      
* **Loyalty Program:**
    * Expand Program Benefits: Evaluate the existing benefits offered by the loyalty program and consider expanding them to provide additional value to customers. This could include exclusive discounts, personalized offers, early access to new products, or special events. By enhancing the program benefits, you can incentivize customer loyalty and encourage repeat purchases.
      
 * **Operational Effectiveness:**
     * Streamline Operations: Review and streamline your internal operations to ensure efficient order processing, packaging, and shipping. Identify any bottlenecks or areas for improvement in the delivery process and implement measures to increase efficiency. This could involve optimizing inventory management, improving warehouse operations, and enhancing coordination with shipping partners.
       
* **Marketing Channels:**
    * Develop a Social Media Marketing Plan: Create a comprehensive social media marketing plan that aligns with your overall marketing objectives. Define your target audience, select relevant social media platforms, and establish key performance indicators (KPIs) to measure the effectiveness of your social media campaigns.












