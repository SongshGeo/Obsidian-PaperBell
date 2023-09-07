---
methods:
- agent-based model
tags:
- M
---
OOD模型框架是一个让[[agent-based model|多主体模型]]变得更容易描述的指导性框架[@grimm2006]。名字的含义是==ODD+D = Overview, Design concepts, Details, + decision suggestions==。具体框架内容如下：

1. Overview
	- Purpose
		- What is the purpose of the study
		- For whom is the model designed?
	- Entities, state variables and scales. 
		- What kinds of entities are in the model?
		- By what attributes (state variables and parameters) are these entitiescharacterized?
		- What are the exogenous factors / drivers of the model?
		- If applicable, how is space included in the model?
		- What are the temporal and spatial resolutions and extents of the model?
2. Design Concepts
	- Process overview and scheduling
		- What entity does what, and in what order? 
	- Theoretical and Empirical Background
		- Which general concepts, theories or hypotheses are underlying the model's design at the system level or at the levels of the sub models (apart from the decision model)? What is the link to complexity and the purpose of the model?
		- On what assumptions is/are the agents' decision models based?
		- Why is a/are certain decision model chosen?
		- If the model / a submodel (e.g. the decision model) is based on empirical data, where does the data come from?
		- At which level of aggregation were the data available? 
	- Individual decision making
		- What are the subjects and objects of decision-making? On which level of aggregation is decision-making modelled? Are multiple levels of decision making included?
		- What is the basic rationality behind agents' decision-making in the model? Do agents pursue an explicit objective or have other success criteria?
		- How do agents make their decisions?
		- Do the agents adapt their behaviour to changing endogenous and exogenous state variables? And if yes, how?
		- Do social norms or cultural values play a role in the decision-making process?
		- Do spatial aspects play a role in the decision process?
		- Do temporal aspects play a role in the decision process?
		- To which extent and how isuncertainty included in the agents' decision rules?
	- Learning
		- Is individual learning included in the decision process? How do individuals change their decision rules over time as consequence of their experience?
		- Is collective learning implemented in the model?
	- Individual sensing
		- What endogenous and exogenous state variables are individuals assumed to sense and consider in their decisions? Is the sensing process erroneous? 
		- What state variables of which other individuals can an individual perceive? Is the sensing process erroneous? 
		- What is the spatial scale of sensing? 
		- Are the mechanisms by which agents obtain infomation modelled explicityly, or are individuals simply assumed to know these variables? 
		- Are costs for cognition and costs for gathering information included in the model?
	- Individual Prediction
		- Which data uses the agent to predict future conditions?
		- What internal models are agents assumed to use to estimate future conditions or consequences of their decisions?
		- Might agents be erroneous in the prediction process, and how is it implemented?
	- Interaction
		- Are interactions among agents and entities assumed as direct or indirect?
		- On what do the interactions depend?
		- If the interactions involve communication, how are such communications represented?
		- If a coordination network exists, how does it affect the agent behaviour? Is the structure of the network imposed or emergent?
	- Collectives
		- Do the individuals form or belong to aggregations that affect, and are affected by, the individuals? Are these aggregations imposed by the modeller or do they emerge during the simulation? 
		- How are collecrtives represented?
		- How are collectives represented?
	- Heterogeneity
		- Are the agents heterogeneous? If yes, which state variables and/or processes differ between the agents?
		- Are the agents heterogeneous in their decision-making? If yes, which decision models or decision objects differ between the agents?
	- Stochasticity
		- What processes (including initialisation) are modelled by assuming they are random or partly random? 
	- Observation
		- What data are collected from the ABM for testing, understanding, and analyzing it, and how and when are they collected? 
		- What key results, outputs or characteristics of the model are emerging from the individuals? (Emergence)
## Refer & Related
[[agent-based model|多主体模型]]
