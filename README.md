
# Financial Reporting Agent

## Overview

This project is designed to support a Wealth Asset Management platform by providing a structured data solution to manage clients' portfolios, assets, transactions, and perform risk assessments. The project also showcases a **Text-to-SQL model** for querying the database and uses **LangChain** to assist in generating dynamic queries. The data is stored in **Microsoft Fabric Lakehouse**, ensuring scalability and performance for large data sets, making this solution suitable for financial institutions, wealth management firms, and analysts.

---

## Tech Stack
- **Programming Language**: Python 3.10
- **Libraries**: `pandas`, `numpy`, `langchain`, `OpenAI`, `Vanna AI`
- **Cloud Platform**: Microsoft Fabric (OneLake, Lakehouse, Data Warehouse), Azure
- **Model**: GPT-4 with Retrieval-Augmented Generation (RAG)
- **Dashboard Framework**: Vanna AI

---

### **Microsoft Fabric Lakehouse**

**Microsoft Fabric Lakehouse** was a central part of this project as it provided the cloud-based storage layer for all the data related to clients, portfolios, assets, transactions, and risk assessments. The Lakehouse enabled efficient querying and reporting, which is critical for the performance of real-time dashboards and analysis.

After setting up the database schema (which includes tables, views, and stored procedures), the next step was to populate the database with the dummy data required for generating insights. The data inserted into this Lakehouse forms the basis for the wealth management operations, including risk assessments, asset allocations, and transaction tracking.

### **Data Insertion**

Before running any analysis, we needed to insert data into the Microsoft Fabric Lakehouse. This entailed using a Python script  to insert 1GB of dummy data into the database, simulating a real-world scenarios by populating the tables with enough data for meaningful visualisation and analytical insights.

- `data_insertion.py` - This Python file contains the logic to connect to the Microsoft Fabric Lakehouse and insert dummy data into the database.

```bash
python CreateDataWarehouse/insertToSQL.py
```
### **Text-to-SQL Model**

The **Text-to-SQL model** was a crucial part of this project. This AI-driven model is trained to convert natural language questions into SQL queries, making it easier for users who are not familiar with SQL to interact with the wealth management data.

This model was pre-trained and fine-tuned to understand industry-specific queries. You can use it to:
- Query portfolio values,
- Analyze asset distributions,
- Retrieve transaction histories,
- Assess risks, and more.

The Text-to-SQL model dynamically generates SQL queries based on the user’s input and runs those queries against the data stored in the Microsoft Fabric Lakehouse.

- Train Text-to-SQL Model: `RAGToSQL/TrainRAG.py`
- Inference Text-to-SQL Model: `RAGToSQL/InferenceRAG.py`
- Fabrics Text-to-SQL Model: `RAGToSQL/InferenceRAG.py`
---

### **Project Structure**
- **`CreateDataWarehouse`**: Contains the SQL Server scripts for creating tables, views, and stored procedures. Python script to insert 1GB of dummy data into the Microsoft Fabric Lakehouse.
- **`RAGToSQL`**: Contains files to train and inference RAGToSQL 
- **`LangchainFabrics`**: Script for running the Text-to-SQL model with Langchain Vector DB.
- **`requirements.txt`**: Contains a list of required Python packages to run the project.

---

## Project Workflow

1. **Environment Setup**
   - Configured **Microsoft Fabric** and **Azure** environments.

2. **Data Preparation**
   - Imported and organized data using **Dataflow Gen2**.
   - Structured the data in **OneLake** (lakehouse and warehouse).

3. **Data Storage and Querying**
   - Created views and tables in the data warehouse.

4. **RAG System Development**
   - Contextualised GPT-4 with financial data from the warehouse.
   - Validated data consistency across OneLake and the data warehouse.

5. **Interface Development**
   - Implemented **text-to-SQL conversion** with Vanna AI.
   - Built Python scripts for query execution and dashboard visualization.

---

## Project Structure

```
├── CreateDataWarehouse/
│   ├── InsertToSQL.py
│   ├── SQL/
│       ├── create_tables.sql
│       ├── create_views_sql.sql
│       └── stored_procedures.sql
├── LangchainFabrics/
│   ├── LangChainFabrics.py
│   ├── TestConnectionFabrics.py
├── RAGToSQL/
│   ├── FabricsRAG.py
│   ├── TrainRAG.py
│   ├── VisualizeRAG.py
│   └── Helper/
│       ├── Credentials.py
│       ├── FabricsConnection.py
│       └── VannaObject.py
├── requirements.txt
└── Readme.md
```

---
