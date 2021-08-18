CREATE DATABASE IF NOT EXISTS `DIRECTIONS` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `DIRECTIONS`;

CREATE TABLE `CRÉDIT_DIRECTION` (
  `id` VARCHAR(42),
  `nom_client` VARCHAR(42),
  `montant` VARCHAR(42),
  `date` VARCHAR(42),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `DIRECTION` (
  `id` VARCHAR(42),
  `nom` VARCHAR(42),
  `telephone` VARCHAR(42),
  `adresse` VARCHAR(42),
  `id_Crédit_direction` VARCHAR(42),
  `id_Remboursement_direction` VARCHAR(42),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `PASSER_COMMANDE` (
  `id` VARCHAR(42),
  `id_Commande` VARCHAR(42),
  `id_Direction` VARCHAR(42),
  PRIMARY KEY (`id`, `id_1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `COMMANDE` (
  `id` VARCHAR(42),
  `date` VARCHAR(42),
  `produit` VARCHAR(42),
  `quantité` VARCHAR(42),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `STATION` (
  `id` VARCHAR(42),
  `nom_station` VARCHAR(42),
  `adresse_station` VARCHAR(42),
  `telephone_station` VARCHAR(42),
  `type_payement` VARCHAR(42),
  `statusbis_station` VARCHAR(42),
  `objectif` VARCHAR(42),
  `besion` VARCHAR(42),
  `status` VARCHAR(42),
  `gerant_id` VARCHAR(42),
  `reseau_id` VARCHAR(42),
  `id_pompiste` VARCHAR(42),
  `id_banque` VARCHAR(42),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `CLIENT` (
  `id` VARCHAR(42),
  `nom` VARCHAR(42),
  `telephone` VARCHAR(42),
  `adresse` VARCHAR(42),
  `id_Crédit_géran` VARCHAR(42),
  `id_Remboursement_direction` VARCHAR(42),
  `id_Remboursement_gérant` VARCHAR(42),
  `id_Crédit_direction` VARCHAR(42),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `REMBOURSEMENT_DIRECTION` (
  `id` VARCHAR(42),
  `nom_client` VARCHAR(42),
  `montant` VARCHAR(42),
  `date` VARCHAR(42),
  `type_payement` VARCHAR(42),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `VERSEMENT` (
  `id` VARCHAR(42),
  `date` VARCHAR(42),
  `montant` VARCHAR(42),
  `num_borderaux` VARCHAR(42),
  `banque` VARCHAR(42),
  `nom_station` VARCHAR(42),
  `` VARCHAR(42),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `CRÉDIT_GÉRANT` (
  `id` VARCHAR(42),
  `nom_client` VARCHAR(42),
  `montant` VARCHAR(42),
  `date` VARCHAR(42),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `GÉRANT` (
  `id` VARCHAR(42),
  `prenom_gerant` VARCHAR(42),
  `nom_gerant` VARCHAR(42),
  `adresse_gerant` VARCHAR(42),
  `telephone_gerant` VARCHAR(42),
  `mail_gerant` VARCHAR(42),
  `id_user` VARCHAR(42),
  `login` VARCHAR(42),
  `id_Remboursement_gérant ` VARCHAR(42),
  `id_Direction` VARCHAR(42),
  `id_Crédit_gérant` VARCHAR(42),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `BANQUE` (
  `id` VARCHAR(42),
  `nom_banque` VARCHAR(42),
  `adress_banque` VARCHAR(42),
  `date_versement` VARCHAR(42),
  `recu_versement` VARCHAR(42),
  `id_versement` VARCHAR(42),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `CUVE` (
  `id` VARCHAR(42),
  `capacite` VARCHAR(42),
  `station_id` VARCHAR(42),
  `produit_id` VARCHAR(42),
  `statut` VARCHAR(42),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `REMBOURSEMENT_GÉRANT` (
  `id` VARCHAR(42),
  `nom_client` VARCHAR(42),
  `montant` VARCHAR(42),
  `date` VARCHAR(42),
  `type_payement` VARCHAR(42),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `PRODUIT` (
  `id` VARCHAR(42),
  `nom` VARCHAR(42),
  `reference` VARCHAR(42),
  `prix` VARCHAR(42),
  `livraison_bis_id` VARCHAR(42),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `POMPE` (
  `id` VARCHAR(42),
  `libelle` VARCHAR(42),
  `satus` VARCHAR(42),
  `cuve_id` VARCHAR(42),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `POMPISTE` (
  `id` VARCHAR(42),
  `prenom_pompiste` VARCHAR(42),
  `nom_pompiste` VARCHAR(42),
  `telephone_pompiste` VARCHAR(42),
  `id_user` VARCHAR(42),
  `login` VARCHAR(42),
  `station_id` VARCHAR(42),
  `statut` VARCHAR(42),
  `id_vente` VARCHAR(42),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `INDEX_POMPE` (
  `id` VARCHAR(42),
  `type_index` VARCHAR(42),
  `index_depart` VARCHAR(42),
  `index_fermeture` VARCHAR(42),
  `id_pompe` VARCHAR(42),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `VENTE` (
  `id` VARCHAR(42),
  `type_vente` VARCHAR(42),
  `montant_vente` VARCHAR(42),
  `` VARCHAR(42),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `DIRECTION` ADD FOREIGN KEY (`id_2`) REFERENCES `REMBOURSEMENT_DIRECTION` (`id`);
ALTER TABLE `DIRECTION` ADD FOREIGN KEY (`id_1`) REFERENCES `CRÉDIT_DIRECTION` (`id`);
ALTER TABLE `PEUT_COMMANDER` ADD FOREIGN KEY (`id_1`) REFERENCES `COMMANDE` (`id`);
ALTER TABLE `PEUT_COMMANDER` ADD FOREIGN KEY (`id`) REFERENCES `DIRECTION` (`id`);
ALTER TABLE `STATION` ADD FOREIGN KEY (`id_2`) REFERENCES `BANQUE` (`id`);
ALTER TABLE `STATION` ADD FOREIGN KEY (`id_1`) REFERENCES `POMPISTE` (`id`);
ALTER TABLE `CLIENT` ADD FOREIGN KEY (`id_4`) REFERENCES `CRÉDIT_DIRECTION` (`id`);
ALTER TABLE `CLIENT` ADD FOREIGN KEY (`id_3`) REFERENCES `REMBOURSEMENT_GÉRANT` (`id`);
ALTER TABLE `CLIENT` ADD FOREIGN KEY (`id_2`) REFERENCES `REMBOURSEMENT_DIRECTION` (`id`);
ALTER TABLE `CLIENT` ADD FOREIGN KEY (`id_1`) REFERENCES `CRÉDIT_GÉRANT` (`id`);
ALTER TABLE `GÉRANT` ADD FOREIGN KEY (`id_3`) REFERENCES `CRÉDIT_GÉRANT` (`id`);
ALTER TABLE `GÉRANT` ADD FOREIGN KEY (`id_2`) REFERENCES `DIRECTION` (`id`);
ALTER TABLE `GÉRANT` ADD FOREIGN KEY (`id_1`) REFERENCES `REMBOURSEMENT_GÉRANT` (`id`);
ALTER TABLE `BANQUE` ADD FOREIGN KEY (`id_1`) REFERENCES `VERSEMENT` (`id`);
ALTER TABLE `POMPISTE` ADD FOREIGN KEY (`id_1`) REFERENCES `VENTE` (`id`);
ALTER TABLE `INDEX_POMPE` ADD FOREIGN KEY (`id_1`) REFERENCES `POMPE` (`id`);