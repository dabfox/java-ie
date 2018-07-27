/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cd.bc;

import java.util.ArrayList;

/**
 *
 * @author Marcellin Dbfx
 */
public class ChainageArriere {
    //Création des variables

    public static String baseDeConnaissance;//Base de connaissance
    public static String requete;//Interrogation que l'on lance à la base de connaissance
    public static ArrayList<String> agenda;//structure de données temporaire qui contiendra les faits selectionnés après filtrage
    //à tel cycle
    // ->analogique à l'agenda de CLISPS
    public static ArrayList<String> faits;//base des faits
    public static ArrayList<String> regles;//base des regles
    public static ArrayList<String> impliquee;//structure des données qui contiendra toutes les implications et substitutions

    public ChainageArriere(String req, String bc) {
        //initialisation
        agenda = new ArrayList<>();
        regles = new ArrayList<>();
        impliquee = new ArrayList<>();
        faits = new ArrayList<>();
        baseDeConnaissance = bc;
        requete = req;
        init(baseDeConnaissance);
    }

    //Mise en place des valeurs initiales pour le chainage arrière
    public static void init(String bc) {
        agenda.add(requete);
        // decoupage de la bc en propositions
        //Notre séparateur est le point virgule ";"
        //On separe aussi les faits de  règles
        String[] regl = bc.split(";");
        for (String r : regl) {
            if (!r.contains("=>")) {
                //Seule une règle peut contenir les symbole "=>"
                //Jamais un fait...ceci nous a permis cette discrimination règle/faits
                faits.add(r);
            } else {
                // ajout de la règle dans la br
                regles.add(r);
            }
        }
    }

// method which calls the main bcentails() method and returns output back to iengine
    //execution du chainage arrière proprément dit!
    //et renvoie la reponse après interrogation de la base de connaissance
    public String execute() {
        String reponse;

        if (chainageArr()) {
            // il y a des symboles dans lesquel est bel et bien impliqué notre but
            reponse = "faits: ";
            // loop through all entailed symbols in reverse
            //parcours par chainage arrière des differant symboles
            for (int i = impliquee.size() - 1; i >= 0; i--) {
                if (i == 0) {
                    reponse += impliquee.get(i);
                } else // pas de virgule à la fin
                {
                    reponse += impliquee.get(i) + ", ";
                }

            }
        } // aucune implication 
        else {
            reponse = "Aucun fait à prouvé!";
        }
        return reponse;
    }

    //chainage arrière proprement dit
    public boolean chainageArr() {

        //Tant qu'il ya au moins un symbole dans la liste...on parcours la liste
        while (!agenda.isEmpty()) {
            // on recupere le symbole courant
            String q = agenda.remove(agenda.size() - 1);

            //on l'ajoute dans la liste des symboles qui impliquent le but
            impliquee.add(q);

            //Si c un fait, on a pas besoin de traitement supplementaires
            if (!faits.contains(q)) {
                // .. sinon..
                // on garde dans cette nouvelle structure de données pour  les nouveaus symboles
                ArrayList<String> p = new ArrayList<>();
                regles.stream().filter((clause) -> (conclusionContient(clause, q))).map((clause) -> getPremises(clause)).forEach((temp) -> {
                    for (String temp1 : temp) {
                        // ajout du symbole dans la structure des données temporaire
                        p.add(temp1);
                    }
                });
                //la bc ne peut rien prouvé
                //puisqu'aucun symbole generé
                if (p.isEmpty()) {
                    return false;
                } else {

                    //ajout dans l'agenda des symboles précedamment traités
                    for (int i = 0; i < p.size(); i++) {
                        if (!impliquee.contains(p.get(i))) {
                            agenda.add(p.get(i));
                        }
                    }

                }
            }

        }//fin tant que
        return true;
    }

// traitement des symboles/propositions contenant des conjonctions, "&" dans notre cas
    //separation des premisses
    public static ArrayList<String> getPremises(String proposition) {
        // recuperation des premisses
        String premise = proposition.split("=>")[0];
        ArrayList<String> temp = new ArrayList<>();
        String[] conjonctions = premise.split("&");
        for (String conj : conjonctions) {
            if (!agenda.contains(conj)) {
                temp.add(conj);
            }
        }
        return temp;
    }

    //verification si un fait apparait dans la conclusion d'une proposition
    //renvoie d'un booléen TRUE si le fait apparait dans la conclusion

    /**
     *
     * @param proposition
     * @param fai
     * @return
     */
        public static boolean conclusionContient(String proposition, String fai) {
        String conclusion = proposition.split("=>")[1];
        return conclusion.equals(fai);

    }
}
