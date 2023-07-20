# Portfolio Project - Elist Sales Analysis
Elist is a simulated e-commerce company specializing in popular electronics, catering to a global customer base. This data analysis project focuses on a sample dataset, aiming to uncover key trends in revenue, marketing channels, and operational aspects. By conducting this analysis, valuable insights regarding the overall company performance are derived.

I used SQL queries [here](https://github.com/wzhang0194/Elist-SQL-Project/blob/main/Elist_SQL_Queries.sql) to analyze and summarize the insights below, to be delivered to the finance, product, and marketing teams.

# Summary of Insights
**North America Quarterly Sales Trends (all years)** 
* Between 2019 and 2022, Elist sold an average of 89 Macbooks per quarter to North American customers, resulting in an average quarterly sales revenue of $143.5K. The Macbooks had an average order price of $1600.
  
**North America Monthly Sales Trends (all years)** 
* Between 2019 and 2022, Elist sold an average of 30 Macbooks per month to North American customers , resulting in an average monthly sales of $47.8K. The Macbooks had an average order price of $1603.

**Refund Trends in 2020 and 2021:**
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

* **Product Refunds:**
    * Identify and Address Root Causes: Analyze the reasons behind the high refund rates and the spike in refunds during specific months, such as May 2020 and March 2021. Identify any recurring issues or patterns causing dissatisfaction among customers. This analysis can help in addressing the root causes and minimizing refund requests.

 * **Account Creation Methods:**
     * Optimize User Experience on Desktop and Mobile: Since desktop is the primary account creation method with a higher number of signups, prioritize enhancing the user experience on desktop devices. Ensure that the website is responsive, intuitive, and provides a seamless browsing and signup process for desktop users. Similarly, focus on improving the mobile experience to capitalize on the significant number of signups from mobile users.
            
 * **Operational Effectiveness:**
     * Nurture Customer Engagement and Retention: Recognize the time gap between customer account creation and making a purchase, which averages around two months. Implement strategies to nurture customer engagement during this period to keep them connected with your brand. This can include personalized emails, exclusive offers, relevant content, and targeted promotions to encourage them to make a purchase sooner.
       
* **Marketing Channels:**
    * Optimize Direct Marketing Strategies: Recognize the significance of the direct marketing channel and capitalize on its effectiveness in driving orders. Implement targeted direct marketing campaigns to attract customers who directly visit the website. Enhance the website's user experience, ensure compelling and informative content, and provide clear calls-to-action to encourage conversions.







