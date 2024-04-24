
# Simulation of AODV Routing with Blackhole Attack 

This project simulates a mobile ad hoc network (MANET) using the Ad-hoc On-demand Distance Vector (AODV) routing protocol and investigates its vulnerability to blackhole attacks. AODV is implemented to establish routes between nodes, while a blackhole node is introduced to intercept and potentially disrupt communication. Through visualization, the simulation demonstrates the impact of the blackhole attack on routing paths, comparing routes with and without the presence of the malicious node. This project serves as an educational tool to understand the behavior of routing protocols in the face of security threats, offering insights into strategies for mitigating such attacks in MANETs.

- [Blockchain-Enabled](https://github.com/atanu16/Blockchain-Enabled-AODV-Routing-Simulation-for-Secure-MANETs) <-- Checkout Simulation of Blockchain-Enabled AODV Routing Preventing from Blackhole-Attack from here 

- Both are Same Code but this one is contain Blackhole-Attack Simulation only.

![Simulation ](https://i.ibb.co/MS9Z0V5/image.png)


## Output Explanation

The lines "Route without blackhole" and "Route with blackhole" indicate the paths followed by data packets from the source node to the destination node in the simulated network, both in the absence and presence of a blackhole attack, respectively.

- Route without blackhole :
1. This line indicates the path taken by data packets when there is no blackhole node in the network.
2. In this case, the route consists of two nodes: node 1 (the source node) and node 20 (the destination node).
3. The data packets are successfully transmitted from the source node (node 1) to the destination node (node 20) without encountering any disruption or interference.
- Route with blackhole :
1. This line indicates the path taken by data packets when a blackhole node is present in the network.
2. In this case, the route consists of three nodes: node 1 (the source node), node 20 (the destination node), and node 10 (the blackhole node).
3. The data packets, instead of being routed directly from the source node to the destination node, are diverted through the blackhole node (node 10).
4. This diversion is characteristic of a blackhole attack, where the malicious node intercepts and drops or alters data packets, disrupting communication between legitimate nodes.



## Nodes


The nodes are visually distinguished by three different colors: red, blue, and green. Let's explain the significance of each color:

 - Red Nodes:
The source node and destination node are both represented by red color.
These nodes are crucial in routing protocols as they represent the starting point (source) and the destination of data packets.
- Blue Nodes:
Nodes along the route without a blackhole are represented by blue color.
These nodes are part of the shortest path between the source and destination nodes in the absence of any malicious activity.
- Green Nodes:
The blackhole node is represented by green color.
This node is introduced into the network as part of the simulation to mimic a malicious node that disrupts communication by dropping or altering packets.






## Installation
Add this blackhole.m in your matlab and run it 

```bash
blackhole.m
```


## Authors

- [@Atanu](https://www.github.com/atanu16)

