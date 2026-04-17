# BrightTV Viewer Behaviour Analysis

## Overview  
This case study analyses user profile and viewership data from BrightTV to uncover actionable insights that support **subscription growth and increased user engagement**.

The objective was to:

- Understand key **viewership and engagement drivers**  
- Analyse **user consumption behaviour across time, content, and segments**  
- Identify opportunities to **increase engagement and platform usage**  
- Provide **data-driven recommendations** to support subscription growth and retention  

---

## Approach & Methodology  

The analysis was conducted in a structured, end-to-end workflow:

### 1. Project Planning  
- Defined key business questions aligned to subscription growth  
- Structured analytical approach using visual planning tools  
- Identified relevant datasets and key variables  

---

### 2. Data Processing (SQL – Databricks)  
- Cleaned and transformed raw datasets (user profiles & viewership)  
- Joined datasets to create a unified analytical table  
- Engineered new features to enhance analysis:

**Time-based features**
- Conversion from UTC to South African time  
- Month, date, day of week  
- Weekday vs Weekend classification  

**Time buckets**
- Early Morning, Morning, Mid-Morning, Afternoon, Evening, Night  

**Engagement metrics**
- Session duration (seconds)  
- Viewer Type (Casual, Engaged, Binge)  
- Engagement Level classification  

**User segmentation**
- Age group classification  
- Handling missing values (e.g. Age = 0 treated as NULL)  

---

### 3. Data Analysis (Excel)  
- Built pivot tables to explore:

  - Viewership trends over time (monthly, daily)  
  - Engagement patterns by time of day  
  - Content performance (channels)  
  - User segmentation (age, gender, province)  
  - Engagement levels and viewer types  

- Developed visualisations to highlight:

  - Usage peaks and low-consumption periods  
  - High-performing vs underperforming content  
  - Behavioural patterns across segments  

---

### 4. Insights & Presentation  
- Synthesised findings into **executive-level insights**  
- Structured recommendations aligned to **subscription growth objectives**  
- Compiled into a PowerPoint presentation for decision-makers  

---

## Key Insights  

### Strong Growth in Usage  
Viewership increased significantly over time, with usage concentrated during **weekends and afternoons**, reflecting leisure-driven consumption behaviour.

---

### Low Engagement Dominates  
Approximately **69% of sessions are low engagement**, indicating that most users interact with the platform casually.

---

### Time Drives Engagement  
- **Evenings and nights** show the highest engagement levels  
- **Morning sessions** are typically short and low engagement  

---

### Content Drives Retention  
- Most-viewed channels are not always the most engaging  
- Certain channels generate significantly higher watch time  

---

### Demographics Are Not Key Drivers  
- **Gender has minimal impact** on behaviour  
- **Age influences volume**, but not significantly engagement  
- **Province varies in scale vs engagement**, not behaviour  

---

### Untapped Opportunity in Low-Usage Periods  
Weekday mornings and mid-day periods show **low usage and low engagement**, representing a key opportunity for growth.

---

## Recommendations  

### Increase Engagement Depth  
- Promote binge-worthy content  
- Introduce autoplay and curated viewing experiences  
Improves retention and reduces churn  

---

### Optimise Content Strategy  
- Prioritise high-engagement content  
- Promote content strategically across time periods  
Increases watch time and session depth  

---

### Unlock Low-Usage Periods  
- Push high-engagement content during mornings and mid-day  
- Use targeted notifications to drive usage  
Expands total platform consumption  

---

### Improve Personalisation  
- Recommend content based on user behaviour  
- Highlight trending and high-retention content  
Converts casual users into engaged viewers  

---

### Target Growth Strategically  
- Focus on high-volume segments (e.g. young adults)  
- Scale high-volume regions while nurturing high-engagement regions  
Maximises user acquisition and lifetime value  

---

## Tools Used  

- **Miro** → Project planning and flowchart design  
- **Canva** → Project structuring and visual planning  
- **Databricks (SQL)** → Data cleaning, transformation, and feature engineering  
- **Microsoft Excel** → Data analysis (Pivot Tables) and visualisation  
- **PowerPoint** → Presentation of insights and recommendations  

---

## Outcome  

This case study demonstrates how data can be leveraged to:

- Identify key drivers of **user engagement and consumption**  
- Understand behavioural patterns across time, content, and segments  
- Highlight inefficiencies in engagement and content utilisation  
- Provide actionable strategies to **increase subscription growth and retention**  

---

> **Key Takeaway:**  
> The fastest path to growing subscriptions is not just acquiring new users, but increasing the value extracted from existing users through deeper engagement.

---

## Contact  

**Refilwe Mofokeng**  
www.linkedin.com/in/refilwe-mofokeng
