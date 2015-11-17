-- ----------------------------------------------------------------------------
-- MySQL Workbench Migration
-- Migrated Schemata: eclesia0
-- Source Schemata: eclesia
-- Created: Mon Nov 16 15:56:45 2015
-- Workbench Version: 6.3.3
-- ----------------------------------------------------------------------------

SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------------------------------------------------------
-- Schema eclesia0
-- ----------------------------------------------------------------------------
DROP SCHEMA IF EXISTS `eclesia0` ;
CREATE SCHEMA IF NOT EXISTS `eclesia0` ;

-- ----------------------------------------------------------------------------
-- Table eclesia0.auth_group
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `eclesia0`.`auth_group` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name` (`name` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table eclesia0.auth_group_permissions
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `eclesia0`.`auth_group_permissions` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `group_id` INT(11) NOT NULL,
  `permission_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `group_id` (`group_id` ASC, `permission_id` ASC),
  INDEX `auth_group__permission_id_3722684e571285e1_fk_auth_permission_id` (`permission_id` ASC),
  CONSTRAINT `auth_group__permission_id_3722684e571285e1_fk_auth_permission_id`
    FOREIGN KEY (`permission_id`)
    REFERENCES `eclesia0`.`auth_permission` (`id`),
  CONSTRAINT `auth_group_permission_group_id_68b202212be57470_fk_auth_group_id`
    FOREIGN KEY (`group_id`)
    REFERENCES `eclesia0`.`auth_group` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table eclesia0.auth_permission
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `eclesia0`.`auth_permission` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `content_type_id` INT(11) NOT NULL,
  `codename` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `content_type_id` (`content_type_id` ASC, `codename` ASC),
  CONSTRAINT `auth__content_type_id_1b620702f8fd8621_fk_django_content_type_id`
    FOREIGN KEY (`content_type_id`)
    REFERENCES `eclesia0`.`django_content_type` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 19
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table eclesia0.django_content_type
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `eclesia0`.`django_content_type` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `app_label` VARCHAR(100) NOT NULL,
  `model` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `django_content_type_app_label_421e93e64310c699_uniq` (`app_label` ASC, `model` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 16
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table eclesia0.auth_user
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `eclesia0`.`auth_user` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `password` VARCHAR(128) NOT NULL,
  `last_login` DATETIME NULL DEFAULT NULL,
  `is_superuser` TINYINT(1) NOT NULL,
  `username` VARCHAR(30) NOT NULL,
  `first_name` VARCHAR(30) NOT NULL,
  `last_name` VARCHAR(30) NOT NULL,
  `email` VARCHAR(254) NOT NULL,
  `is_staff` TINYINT(1) NOT NULL,
  `is_active` TINYINT(1) NOT NULL,
  `date_joined` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username` (`username` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table eclesia0.auth_user_groups
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `eclesia0`.`auth_user_groups` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_id` INT(11) NOT NULL,
  `group_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `user_id` (`user_id` ASC, `group_id` ASC),
  INDEX `auth_user_groups_group_id_75269b25e3c92682_fk_auth_group_id` (`group_id` ASC),
  CONSTRAINT `auth_user_groups_group_id_75269b25e3c92682_fk_auth_group_id`
    FOREIGN KEY (`group_id`)
    REFERENCES `eclesia0`.`auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_784af348315d8cce_fk_auth_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `eclesia0`.`auth_user` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table eclesia0.auth_user_user_permissions
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `eclesia0`.`auth_user_user_permissions` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_id` INT(11) NOT NULL,
  `permission_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `user_id` (`user_id` ASC, `permission_id` ASC),
  INDEX `auth_user_u_permission_id_677d434100ce972b_fk_auth_permission_id` (`permission_id` ASC),
  CONSTRAINT `auth_user_u_permission_id_677d434100ce972b_fk_auth_permission_id`
    FOREIGN KEY (`permission_id`)
    REFERENCES `eclesia0`.`auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissi_user_id_7134eda71dca5518_fk_auth_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `eclesia0`.`auth_user` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table eclesia0.cargo
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `eclesia0`.`cargo` (
  `id` INT(11) NOT NULL,
  `descricao` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table eclesia0.cidade
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `eclesia0`.`cidade` (
  `id` INT(11) NOT NULL,
  `estado` INT(11) NULL DEFAULT NULL,
  `nome` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `estado_fk_idx` (`estado` ASC),
  CONSTRAINT `estado_fk`
    FOREIGN KEY (`estado`)
    REFERENCES `eclesia0`.`estado` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table eclesia0.estado
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `eclesia0`.`estado` (
  `id` INT(11) NOT NULL,
  `nome` VARCHAR(45) NULL DEFAULT NULL,
  `sigla` VARCHAR(4) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table eclesia0.culto
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `eclesia0`.`culto` (
  `id` INT(11) NOT NULL,
  `data` DATE NULL DEFAULT NULL,
  `inicio` TIME NULL DEFAULT NULL,
  `fim` TIME NULL DEFAULT NULL,
  `presentes` INT(11) NULL DEFAULT NULL,
  `dizimos` DOUBLE NULL DEFAULT NULL,
  `ofertas` DOUBLE NULL DEFAULT NULL,
  `arrecadacao_total` DOUBLE NULL DEFAULT NULL,
  `observacoes` LONGTEXT NULL DEFAULT NULL,
  `abertura_id` INT(11) NULL DEFAULT NULL,
  `pregador_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `culto_8a782ce4` (`abertura_id` ASC),
  INDEX `culto_015b2a94` (`pregador_id` ASC),
  CONSTRAINT `culto_abertura_id_7edac238a0a723ad_fk_pessoa_id`
    FOREIGN KEY (`abertura_id`)
    REFERENCES `eclesia0`.`pessoa` (`id`),
  CONSTRAINT `culto_pregador_id_69362fe0eb671186_fk_pessoa_id`
    FOREIGN KEY (`pregador_id`)
    REFERENCES `eclesia0`.`pessoa` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table eclesia0.pessoa
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `eclesia0`.`pessoa` (
  `id` INT(11) NOT NULL,
  `nome` VARCHAR(95) NULL DEFAULT NULL,
  `data_nascimento` DATE NULL DEFAULT NULL,
  `sexo` VARCHAR(1) NULL DEFAULT NULL,
  `estado_civil` INT(11) NULL DEFAULT NULL,
  `naturalidade` VARCHAR(45) NULL DEFAULT NULL,
  `rg` VARCHAR(45) NULL DEFAULT NULL,
  `cpf` VARCHAR(45) NULL DEFAULT NULL,
  `profissao` VARCHAR(50) NULL DEFAULT NULL,
  `escolaridade` INT(11) NULL DEFAULT NULL,
  `endereco` VARCHAR(250) NULL DEFAULT NULL,
  `cep` VARCHAR(45) NULL DEFAULT NULL,
  `cidade` INT(11) NULL DEFAULT NULL,
  `uf` INT(11) NULL DEFAULT NULL,
  `telefone_residencial` VARCHAR(45) NULL DEFAULT NULL,
  `telefone_celular` VARCHAR(45) NULL DEFAULT NULL,
  `email` VARCHAR(150) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `cidade_fk_idx` (`cidade` ASC),
  INDEX `estado_fk_idx` (`uf` ASC),
  INDEX `estado_civil_fk_idx` (`estado_civil` ASC),
  INDEX `escolaridade_fk_idx` (`escolaridade` ASC),
  INDEX `pessoa_estado_fk_idx` (`uf` ASC),
  INDEX `pessoa_estado_civil_fk_idx` (`estado_civil` ASC),
  INDEX `pessoa_escolaridade_fk_idx` (`escolaridade` ASC),
  INDEX `pessoa_cidade_fk_idx` (`cidade` ASC),
  CONSTRAINT `pessoa_cidade_fk`
    FOREIGN KEY (`cidade`)
    REFERENCES `eclesia0`.`cidade` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `pessoa_escolaridade_fk`
    FOREIGN KEY (`escolaridade`)
    REFERENCES `eclesia0`.`escolaridade` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `pessoa_estado_fk`
    FOREIGN KEY (`uf`)
    REFERENCES `eclesia0`.`estado` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `pessoa_estadocivil_fk`
    FOREIGN KEY (`estado_civil`)
    REFERENCES `eclesia0`.`estadocivil` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table eclesia0.culto_diaconos
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `eclesia0`.`culto_diaconos` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `culto_id` INT(11) NOT NULL,
  `membro_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `culto_id` (`culto_id` ASC, `membro_id` ASC),
  INDEX `culto_diaconos_membro_id_6e5505665abbc64e_fk_membro_id` (`membro_id` ASC),
  CONSTRAINT `culto_diaconos_culto_id_291245a2c657a5ff_fk_culto_id`
    FOREIGN KEY (`culto_id`)
    REFERENCES `eclesia0`.`culto` (`id`),
  CONSTRAINT `culto_diaconos_membro_id_6e5505665abbc64e_fk_membro_id`
    FOREIGN KEY (`membro_id`)
    REFERENCES `eclesia0`.`membro` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table eclesia0.membro
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `eclesia0`.`membro` (
  `id` INT(11) NOT NULL,
  `pessoa` INT(11) NULL DEFAULT NULL,
  `cargo` INT(11) NULL DEFAULT NULL,
  `data_entrada` DATE NULL DEFAULT NULL,
  `arrolado_por` VARCHAR(45) NULL DEFAULT NULL,
  `data_batismo` DATE NULL DEFAULT NULL,
  `igreja_batismo` VARCHAR(45) NULL DEFAULT NULL,
  `religiao_antrerior` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `membro_cargo_fk_idx` (`cargo` ASC),
  CONSTRAINT `membro_cargo_fk`
    FOREIGN KEY (`cargo`)
    REFERENCES `eclesia0`.`cargo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table eclesia0.culto_musicos
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `eclesia0`.`culto_musicos` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `culto_id` INT(11) NOT NULL,
  `membro_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `culto_id` (`culto_id` ASC, `membro_id` ASC),
  INDEX `culto_musicos_membro_id_7f7c97b70bfb26ec_fk_membro_id` (`membro_id` ASC),
  CONSTRAINT `culto_musicos_culto_id_e443a20990c652b_fk_culto_id`
    FOREIGN KEY (`culto_id`)
    REFERENCES `eclesia0`.`culto` (`id`),
  CONSTRAINT `culto_musicos_membro_id_7f7c97b70bfb26ec_fk_membro_id`
    FOREIGN KEY (`membro_id`)
    REFERENCES `eclesia0`.`membro` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table eclesia0.culto_pastores_presentes
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `eclesia0`.`culto_pastores_presentes` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `culto_id` INT(11) NOT NULL,
  `membro_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `culto_id` (`culto_id` ASC, `membro_id` ASC),
  INDEX `culto_pastores_presentes_membro_id_3c6b2d2d3fce038b_fk_membro_id` (`membro_id` ASC),
  CONSTRAINT `culto_pastores_presentes_culto_id_205ad4fdf3e88ffe_fk_culto_id`
    FOREIGN KEY (`culto_id`)
    REFERENCES `eclesia0`.`culto` (`id`),
  CONSTRAINT `culto_pastores_presentes_membro_id_3c6b2d2d3fce038b_fk_membro_id`
    FOREIGN KEY (`membro_id`)
    REFERENCES `eclesia0`.`membro` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table eclesia0.django_admin_log
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `eclesia0`.`django_admin_log` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `action_time` DATETIME NOT NULL,
  `object_id` LONGTEXT NULL DEFAULT NULL,
  `object_repr` VARCHAR(200) NOT NULL,
  `action_flag` SMALLINT(5) UNSIGNED NOT NULL,
  `change_message` LONGTEXT NOT NULL,
  `content_type_id` INT(11) NULL DEFAULT NULL,
  `user_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `djang_content_type_id_2285db57b717dc73_fk_django_content_type_id` (`content_type_id` ASC),
  INDEX `django_admin_log_user_id_776e1ec608d8a960_fk_auth_user_id` (`user_id` ASC),
  CONSTRAINT `djang_content_type_id_2285db57b717dc73_fk_django_content_type_id`
    FOREIGN KEY (`content_type_id`)
    REFERENCES `eclesia0`.`django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_776e1ec608d8a960_fk_auth_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `eclesia0`.`auth_user` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 14
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table eclesia0.django_migrations
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `eclesia0`.`django_migrations` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `app` VARCHAR(255) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `applied` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 14
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table eclesia0.django_session
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `eclesia0`.`django_session` (
  `session_key` VARCHAR(40) NOT NULL,
  `session_data` LONGTEXT NOT NULL,
  `expire_date` DATETIME NOT NULL,
  PRIMARY KEY (`session_key`),
  INDEX `django_session_de54fa62` (`expire_date` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table eclesia0.escolaridade
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `eclesia0`.`escolaridade` (
  `id` INT(11) NOT NULL,
  `descricao` VARCHAR(55) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table eclesia0.estadocivil
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `eclesia0`.`estadocivil` (
  `id` INT(11) NOT NULL,
  `descricao` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table eclesia0.religioes
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `eclesia0`.`religioes` (
  `id` INT(11) NOT NULL,
  `data` DATE NULL DEFAULT NULL,
  `inicio` TIME NULL DEFAULT NULL,
  `fim` TIME NULL DEFAULT NULL,
  `presentes` INT(11) NULL DEFAULT NULL,
  `dizimos` DOUBLE NULL DEFAULT NULL,
  `ofertas` DOUBLE NULL DEFAULT NULL,
  `arrecadacao_total` DOUBLE NULL DEFAULT NULL,
  `observacoes` LONGTEXT NULL DEFAULT NULL,
  `abertura_id` INT(11) NULL DEFAULT NULL,
  `pregador_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `religioes_8a782ce4` (`abertura_id` ASC),
  INDEX `religioes_015b2a94` (`pregador_id` ASC),
  CONSTRAINT `religioes_abertura_id_5f93a5811838d1a1_fk_pessoa_id`
    FOREIGN KEY (`abertura_id`)
    REFERENCES `eclesia0`.`pessoa` (`id`),
  CONSTRAINT `religioes_pregador_id_5a9dc4e483681451_fk_pessoa_id`
    FOREIGN KEY (`pregador_id`)
    REFERENCES `eclesia0`.`pessoa` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
SET FOREIGN_KEY_CHECKS = 1;
