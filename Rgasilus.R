    ###ERGASILUS IDENTIFICATION BY SPINE-SETA FORMULAE###

#About: This script compares the spine-seta formula of a found copepod with a database of known species.
        #The amount of spines is displayed as a roman numeral on the first place, the amount of setae as an arabic numeral on the second place. If the segment is missing, this is indicated with a '-'.
        #Per species: every line is a leg (1 to 4), with the order of the segments being the following: Coxa, Basis, S1_Exo, S1_Endo, S2_Exo, S2_Endo, S3_Exo, S3_Endo
        #The script outputs the species of the database that is most similar to the unknown copepod, the amount of differences between them, as well as a comparative dataframe. 
        #If there are multiple species with the same amount of similarities, it will output all of them.
        #As many species can be added in the database as needed, as long as the correct format is maintained.
        #NOTE: verify whether all the desired species are in the database!
        #The script gives examples of how the code works, and indicates what parts of the code should be changed according to your findings.
#Author: This script was written by Ferre Vandenberg.


  ##DATABANK

Ergasilus_cunningtoni = c("0-0","0-1","I-0","0-1","I-1","0-1","II-5","II-4",
                          "0-0","0-1","I-0","0-1","0-1","0-2","0-6","I-4",
                          "0-0","0-0","I-0","0-1","0-1","0-2","0-4","I-4",
                          "0-0","0-0","0-0","0-1","0-5","0-2","-","I-3")  #Defining the traits of all the species
Ergasilus_flaccidus = c("0-0","0-0","I-0","0-1","I-1","0-1","II-5","II-4",
                        "0-0","0-0","I-0","0-1","0-1","0-1","0-6","I-4",
                        "0-0","0-0","I-0","0-1","0-1","0-1","0-6","I-4",
                        "0-0","0-0","I-0","0-1","0-5","0-1","-","I-3")
Ergasilus_inflatipes = c("0-0","0-0","I-0","0-1","I-1","0-1","II-5","II-4",
                         "0-0","0-0","I-0","0-1","0-1","0-2","0-6","0-6",
                         "0-0","0-0","I-0","0-1","0-1","0-2","0-6","I-4",
                         "0-0","0-0","I-0","0-0","0-5","0-2","-","I-2")
Ergasilus_kandti = c("0-0","0-0","I-0","0-1","0-1","0-1","II-5","II-4",
                     "0-0","0-0","I-0","0-1","0-1","0-2","0-6","I-4",
                     "0-0","0-0","0-0","0-1","0-1","0-2","0-6","I-4",
                     "0-0","0-0","0-0","0-1","0-5","0-2","-","I-3")
Ergasilus_lamellifer = c("0-0","0-0","I-0","0-1","I-1","0-1","II-5","II-4",
                         "0-0","0-0","0-0","0-1","0-1","0-2","0-6","I-4",
                         "0-0","0-0","0-0","0-1","0-1","0-2","0-6","I-4",
                         "0-0","0-0","I-0","0-1","0-5","0-2","-","I-3")
Ergasilus_latus = c("0-0","0-0","0-0","0-1","I-1","0-1","II-5","II-4",
                    "0-0","0-0","0-0","0-1","0-1","0-2","0-6","I-4",
                    "0-0","0-0","0-0","0-1","0-1","0-2","0-6","I-4",
                    "0-0","0-0","I-0","0-1","0-5","0-2","-","I-3")
Ergasilus_macrodactylus = c("0-0","I-0","I-0","0-1","I-1","0-1","II-5","II-4",
                            "0-0","I-0","I-0","0-1","0-1","0-2","0-6","I-4",
                            "0-0","I-0","0-0","0-1","0-2","0-2","I-4","I-4",
                            "0-0","I-0","0-0","0-1","0-5","0-1","-","I-3")
Ergasilus_megacheir = c("0-0","I-0","I-0","0-1","I-1","0-1","II-5","II-4",
                        "0-0","I-0","0-0","0-1","0-1","0-1","0-6","I-4",
                        "0-0","I-0","0-0","0-1","0-1","0-1","0-6","I-4",
                        "0-0","I-0","0-0","0-1","0-5","0-1","-","I-3")
Ergasilus_mirabilis = c("0-0","0-0","I-0","0-1","I-1","0-1","0-6","II-4",
                        "0-0","0-0","0-0","0-1","0-1","0-1","0-4","0-6",
                        "0-0","0-0","I-0","0-1","I-1","0-2","0-6","0-5",
                        "0-0","0-0","I-0","0-0","0-5","0-0","-","0-6")
Ergasilus_nodosus = c("-","-","-","-","-","-","-","-",
                      "-","-","-","-","-","-","-","-",
                      "0-0","0-0","I-0","0-1","0-1","0-2","0-5","0-5",
                      "0-0","0-1","I-0","0-0","0-4","0-0","-","I-2")
Ergasilus_sarsi = c("0-0","0-0","0-0","0-1","I-1","0-1","II-5","II-4",
                    "0-0","0-0","0-0","0-1","0-1","0-2","0-6","I-4",
                    "0-0","0-0","0-0","0-1","0-1","0-2","0-6","I-4",
                    "0-0","0-0","I-0","0-1","0-5","0-2","-","I-3")
Ergasilus_briani = c("0-0","I-0","I-0","0-1","I-1","0-1","II-5","II-4",
                     "0-0","I-0","I-0","0-1","0-1","0-1","I-6","I-4",
                     "0-0","I-0","I-0","0-1","0-1","0-1","I-6","I-4",
                     "0-0","I-0","I-0","0-1","0-4","0-1","-","I-3")
Ergasilus_boleophthalmi = c("0-0","I-0","I-0","0-1","0-1","0-1","II-5","II-4",
                            "0-0","I-0","I-0","0-1","0-1","0-2","0-6","I-4",
                            "0-0","I-0","I-0","0-1","0-1","0-2","I-6","I-4",
                            "0-0","I-0","I-0","0-1","I-5","0-2","-","I-3")
Ergasilus_danjiangensis = c("0-0","I-0","I-0","0-1","0-1","0-1","II-5","II-4",
                            "0-0","I-0","I-0","0-1","0-1","0-1","I-6","I-4",
                            "0-0",'I-0',"I-0","0-1","0-1","0-1","I-6","I-4",
                            "0-0","I-0","I-0","0-1","I-5","0-2","-","I-3")
Ergasilus_lizae = c("0-0","0-0","I-0","0-1","0-1","0-1","II-5","II-4",
                    "0-0","0-0","I-0","0-1","0-1","0-2","0-6","0-5",
                    "0-0","0-0","I-0","0-1","0-1","0-2","0-6","0-5",
                    "0-0","0-0","I-0","0-1","0-5","0-2","-","0-4")
Ergasilus_lobus = c("0-0","I-0","I-0","0-1","0-1","0-1","II-4","II-4",
                    "0-0","I-0","I-0","0-1","0-1","0-2","I-5","I-4",
                    "0-0","I-0","I-0","0-1","0-1","0-2","I-5","I-4",
                    "0-0","I-0","0-0","0-1","I-0","0-2","I-4","I-3")
Ergasilus_pararostralis = c("0-0","I-0","I-0","0-0","0-1","0-1","II-5","II-4",
                            "0-0","I-0","0-0","0-1","0-1","0-1","I-5","I-5",
                            "0-0","I-0","0-0","0-1","0-1","0-1","I-5","I-5",
                            "0-0","I-0","0-0","0-1","0-6","0-1","-","I-4")
Ergasilus_piriformis = c("0-0","I-0","I-0","0-1","0-1","0-1","I-5","II-4",
                         "0-0","I-0","I-0","0-1","0-1","0-1","0-6","I-4",
                         "0-0","I-0","I-0","0-1","0-1","0-1","0-6","I-4",
                         "0-0","I-0","0-0","0-1","0-5","0-2","-","I-3")
Ergasilus_rostralis = c("0-0","I-0","I-0","0-1","0-1","0-1","II-5","II-4",
                        "0-0","I-0","I-0","0-1","0-1","0-2","I-5","I-4",
                        "0-0","I-0","I-0","0-1","0-1","0-2","I-5","I-4",
                        "0-0","I-0","I-0","0-1","0-5","0-2","-","I-3")
Ergasilus_sieboldi = c("0-0","0-0","I-0","0-1","I-1","0-1","II-5","II-4",
                       "0-0","0-0","I-0","0-1","0-1","0-2","I-6","I-4",
                       "0-0","0-0","I-0","0-1","0-1","0-2","I-6","I-4",
                       "0-0","0-0","I-0","0-1","0-5","0-2","-","I-3")
Ergasilus_sittangensis = c("0-0","I-0","I-0","0-1","0-1","0-1","II-5","II-4",
                           "0-0","I-0","I-0","0-1","0-1","0-1","0-6","I-4",
                           "0-0","I-0","I-0","0-1","0-1","0-2","0-6","I-4",
                           "0-0","I-0","I-0","0-1","0-5","0-2","-","I-3")
Ergasilus_hypomesi = c("0-0","0-0","I-0","0-1","0-1","0-1","II-5","II-4",
                       "0-0","0-0","I-0","0-1","0-1","0-2","0-6","I-4",
                       "0-0","0-0","I-0","0-1","0-1","0-2","0-6","I-4",
                       "0-0","0-0","I-0","0-1","0-5","0-2","-","I-3")
Ergasilus_caparti = c("0-0","I-0","0-0","0-0","I-1","0-1","II-5","II-4",
                      "0-0","I-0","0-0","0-1","0-1","0-1","0-6","I-4",
                      "0-0","I-0","0-0","0-1","0-1","0-1","0-6","I-4",
                      "0-0","I-0","0-0","0-1","0-5","0-1","-","I-3")
Ergasilus_parasarsi = c("0-0","0-0","I-0","0-1","0-1","0-1","II-5","II-4",
                        "0-0","0-0","0-0","0-1","0-1","0-1","0-6","I-4",
                        "0-0","0-0","0-0","0-1","0-1","0-1","0-6","I-4",
                        "0-0","0-0","0-1","0-1","0-5","0-1","-","I-3")
Ergasilus_parvus = c("0-0","I-0","I-0","0-1","I-1","0-1","II-5","II-4",
                     "0-0","I-0","0-0","0-1","0-1","0-1","0-6","I-4",
                     "0-0","I-0","0-0","0-1","0-1","0-1","0-6","I-4",
                     "0-0","I-0","0-0","0-0","0-5","0-1","-","I-3")
Ergasilus_ilani = c("0-0","0-0","I-0","0-0","0-1","0-1","II-5","II-3",
                    "0-0","0-0","0-0","0-1","I-0","0-2","0-6","I-4",
                    "0-0","0-0","0-0","0-0","0-0","0-2","0-6","0-5",
                    "0-0","0-0","0-0","0-0","0-5","0-0","-","0-4")

Databank = data.frame (Ergasilus_cunningtoni,Ergasilus_flaccidus,Ergasilus_inflatipes,
                       Ergasilus_kandti, Ergasilus_lamellifer,Ergasilus_latus, Ergasilus_macrodactylus,
                       Ergasilus_megacheir,Ergasilus_mirabilis,Ergasilus_nodosus,Ergasilus_sarsi,
                       Ergasilus_briani,Ergasilus_boleophthalmi,Ergasilus_danjiangensis,
                       Ergasilus_lizae,Ergasilus_lobus,Ergasilus_pararostralis,
                       Ergasilus_piriformis,Ergasilus_rostralis, Ergasilus_sieboldi,
                       Ergasilus_sittangensis,Ergasilus_hypomesi,Ergasilus_caparti,
                       Ergasilus_parasarsi,Ergasilus_parvus,Ergasilus_ilani) #Putting all the species in a data frame

rownames(Databank) = c("L1_Coxa","L1_Basis","L1_S1_Exo","L1_S1_Endo","L1_S2_Exo","L1_S2_Endo","L1_S3_Exo","L1_S3_Endo",
                       "L2_Coxa","L2_Basis","L2_S1_Exo","L2_S1_Endo","L2_S2_Exo","L2_S2_Endo","L2_S3_Exo","L2_S3_Endo",
                       "L3_Coxa","L3_Basis","L3_S1_Exo","L3_S1_Endo","L3_S2_Exo","L3_S2_Endo","L3_S3_Exo","L3_S3_Endo",
                       "L4_Coxa","L4_Basis","L4_S1_Exo","L4_S1_Endo","L4_S2_Exo","L4_S2_Endo","L4_S3_Exo","L4_S3_Endo") #The name of the traits (SAME ORDER AS IN DATABASE!)


  ##COMPARING UNKNOWN SPECIMEN WITH DATABANK BASED ON TRAITS

#Example specimen COP5 (Make sure to always run ALL the lines (slowly!) per copepod so the correct output is given!) 

Cop5 = c("0-0","0-0","I-0","0-0","I-1","0-1","I-5","I-4",
         "0-0","0-1","I-0","0-1","0-1","0-2","0-6","0-5",
         "0-0","0-0","I-0","0-1","0-1","0-2","0-6","0-5",
         "0-0","0-0","I-0","0-1","0-5","0-2","-","I-3") #Edit name and spine-seta formula

Cop5_frame = data.frame (Cop5) #Edit x 2
rownames(Cop5_frame) = c("L1_Coxa","L1_Basis","L1_S1_Exo","L1_S1_Endo","L1_S2_Exo","L1_S2_Endo","L1_S3_Exo","L1_S3_Endo",
                         "L2_Coxa","L2_Basis","L2_S1_Exo","L2_S1_Endo","L2_S2_Exo","L2_S2_Endo","L2_S3_Exo","L2_S3_Endo",
                         "L3_Coxa","L3_Basis","L3_S1_Exo","L3_S1_Endo","L3_S2_Exo","L3_S2_Endo","L3_S3_Exo","L3_S3_Endo",
                         "L4_Coxa","L4_Basis","L4_S1_Exo","L4_S1_Endo","L4_S2_Exo","L4_S2_Endo","L4_S3_Exo","L4_S3_Endo") #Edit name (+ traits same name as in databank)

matching_traits <- numeric(ncol(Databank)) 
for (i in 1:ncol(Databank)) {
  matching_traits[i] <- sum(Cop5_frame == Databank[, i]) #Edit
}
max_matching_traits <- max(matching_traits)
most_similar_columns <- colnames(Databank)[matching_traits == max_matching_traits]
Compar5 <- Databank[, most_similar_columns] #Edit
Compar5 <- data.frame(Cop5_frame, Compar5) #Edit x 3
num_differences <- sum(Compar5[, 1] != Compar5[, 2]) #Edit x 2

cat("Most similar to:",most_similar_columns)    #These lines show the results
cat("Number of differences:", num_differences, "\n")
Compar5 #Edit, this line shows the comparison table with the most similar species


#Example specimen COP7

Cop7 = c("0-0","0-0","I-0","0-1","I-1","0-1","II-5","II-3",
         "0-0","0-0","0-0","0-1","0-1","0-2","0-5","I-4",
         "0-0","0-0","I-0","0-1","0-0","0-2","0-2","I-4",
         "0-0","0-0","I-0","0-1","0-5","0-2","-","I-3") #Edit name and spine-seta formula

Cop7_frame = data.frame (Cop7) #Edit x 2
rownames(Cop7_frame) = c("L1_Coxa","L1_Basis","L1_S1_Exo","L1_S1_Endo","L1_S2_Exo","L1_S2_Endo","L1_S3_Exo","L1_S3_Endo",
                         "L2_Coxa","L2_Basis","L2_S1_Exo","L2_S1_Endo","L2_S2_Exo","L2_S2_Endo","L2_S3_Exo","L2_S3_Endo",
                         "L3_Coxa","L3_Basis","L3_S1_Exo","L3_S1_Endo","L3_S2_Exo","L3_S2_Endo","L3_S3_Exo","L3_S3_Endo",
                         "L4_Coxa","L4_Basis","L4_S1_Exo","L4_S1_Endo","L4_S2_Exo","L4_S2_Endo","L4_S3_Exo","L4_S3_Endo") #Edit name

matching_traits <- numeric(ncol(Databank)) 
for (i in 1:ncol(Databank)) {
  matching_traits[i] <- sum(Cop7_frame == Databank[, i]) #Edit
}
max_matching_traits <- max(matching_traits)
most_similar_columns <- colnames(Databank)[matching_traits == max_matching_traits]
Compar7 <- Databank[, most_similar_columns] #Edit
Compar7 <- data.frame(Cop7_frame, Compar7) #Edit x 3
num_differences <- sum(Compar7[, 1] != Compar7[, 2]) #Edit x 2

cat("Most similar to:",most_similar_columns)
cat("Number of differences:", num_differences, "\n")
Compar7 #Edit
