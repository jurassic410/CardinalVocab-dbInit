USE cardinal_vocab;

-- Create the games_vocab_stats table if it does not exist
CREATE TABLE IF NOT EXISTS `games_vocab_stats` (
  `row_id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(255) DEFAULT NULL,
  `id` INT DEFAULT NULL,
  `total_selection_random` INT DEFAULT 0,
  `total_selection_manual` INT DEFAULT 0,
  `total_responses_correct` INT DEFAULT 0,
  `total_responses_wrong` INT DEFAULT 0,
  `kana_translation_responses_correct` INT DEFAULT 0,
  `kana_translation_responses_wrong` INT DEFAULT 0,
  `kana_translation_selection_random` INT DEFAULT 0,
  `kana_translation_selection_manual` INT DEFAULT 0,
  `kana_translation_accepted_responses` JSON DEFAULT NULL,
  `kanji_translation_responses_correct` INT DEFAULT 0,
  `kanji_translation_responses_wrong` INT DEFAULT 0,
  `kanji_translation_selection_random` INT DEFAULT 0,
  `kanji_translation_selection_manual` INT DEFAULT 0,
  `kanji_translation_accepted_responses` JSON DEFAULT NULL,
  `translation_kana_responses_correct` INT DEFAULT 0,
  `translation_kana_responses_wrong` INT DEFAULT 0,
  `translation_kana_selection_random` INT DEFAULT 0,
  `translation_kana_selection_manual` INT DEFAULT 0,
  `translation_kana_accepted_responses_hiragana` JSON DEFAULT NULL,
  `translation_kana_accepted_responses_katakana` JSON DEFAULT NULL,
  PRIMARY KEY (`row_id`)
);

-- Create the spaced_repetition_game_history_data table if it does not exist
CREATE TABLE IF NOT EXISTS `spaced_repetition_game_history_data` (
  `row_id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(255) DEFAULT NULL,
  `game_id` INT DEFAULT NULL,
  `vocab_id` INT DEFAULT NULL,
  `selection_mode` VARCHAR(255) DEFAULT NULL,
  `type` VARCHAR(10) DEFAULT NULL,
  `question` VARCHAR(1000) DEFAULT NULL,
  `accepted_answers` JSON DEFAULT NULL,
  `already_shown` TINYINT DEFAULT 0,
  `user_response` VARCHAR(1000) DEFAULT NULL,
  `user_response_is_correct` TINYINT DEFAULT NULL,
  PRIMARY KEY (`row_id`)
);

-- Create the spaced_repetition_game_history_stats table if it does not exist
CREATE TABLE IF NOT EXISTS `spaced_repetition_game_history_stats` (
  `username` varchar(255) DEFAULT NULL,
  `game_id` int NOT NULL DEFAULT '0',
  `game_completed` tinyint DEFAULT '0',
  `total_vocab` int DEFAULT '0',
  `current_progress` int DEFAULT '0',
  `selected_gamemode` varchar(255) DEFAULT NULL,
  `elapsed_time_minutes` int DEFAULT '0',
  `elapsed_time_second` int DEFAULT '0',
  `option_use_words` tinyint DEFAULT '0',
  `option_use_verbs` tinyint DEFAULT '0',
  `option_use_less_repeated` tinyint DEFAULT '0',
  `option_use_less_repeated_percentage` int DEFAULT '0',
  `option_use_less_repeated_count` int DEFAULT '0',
  `option_use_more_errors` tinyint DEFAULT '0',
  `option_use_more_errors_percentage` int DEFAULT '0',
  `option_use_more_errors_count` int DEFAULT '0',
  `responses_correct` int DEFAULT '0',
  `responses_wrong` int DEFAULT '0',
  `points_max` int DEFAULT '0',
  `points_given` int DEFAULT '0',
  `game_completed_confirmation` tinyint DEFAULT '0',
  PRIMARY KEY (`game_id`)
);

-- Create the spaced_repetition_game_onomatopoeia_stats table if it does not exist
CREATE TABLE IF NOT EXISTS `spaced_repetition_game_onomatopoeia_stats` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `kana_type` varchar(100) DEFAULT NULL,
  `kana` varchar(3) DEFAULT NULL,
  `romaji` varchar(3) DEFAULT NULL,
  `kana_to_romaji_responses_correct` int DEFAULT '0',
  `kana_to_romaji_responses_wrong` int DEFAULT '0',
  `romaji_to_kana_responses_correct` int DEFAULT '0',
  `romaji_to_kana_responses_wrong` int DEFAULT '0',
  `repetitions` int DEFAULT '0',
  PRIMARY KEY (`id`)
);

-- Create the user_profiles table if it does not exist
CREATE TABLE IF NOT EXISTS `user_profiles` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `profile_version` int DEFAULT '7',
  `name` varchar(255) DEFAULT 'example',
  `surname` varchar(255) DEFAULT 'example',
  `mail_address` varchar(255) DEFAULT 'example@example.com',
  `profile_image` tinyint DEFAULT '0',
  `current_level` int DEFAULT '1',
  `current_points` int DEFAULT '0',
  `next_level_points_required` int DEFAULT '25',
  `points_vocabulary_words_add` int DEFAULT '0',
  `points_vocabulary_verbs_add` int DEFAULT '0',
  `points_spaced_repetitions_plays` int DEFAULT '0',
  PRIMARY KEY (`username`)
);

-- Create the user_settings table if it does not exist
CREATE TABLE IF NOT EXISTS `user_settings` (
  `username` varchar(256) NOT NULL,
  `general_devOptions_devPage` tinyint(1) DEFAULT '0',
  `general_other_bottomLogBar` tinyint(1) DEFAULT '0',
  `general_other_notificationsPosition` varchar(10) DEFAULT 'left',
  `vocabulary_addEditWords_contextualSearch` tinyint(1) DEFAULT '1',
  `vocabulary_addEditWords_advancedOptionsVocabPreview` tinyint(1) DEFAULT '0',
  `vocabulary_addEditWords_verbPreview` varchar(10) DEFAULT '1',
  `vocabulary_search_searchAtStartup` tinyint(1) DEFAULT '0',
  `vocabulary_search_showPerTypeResultsCount` tinyint DEFAULT '1',
  `vocabulary_visualization_menuPosition` varchar(10) DEFAULT 'right',
  `spacedRepetition_countdownCorrectResponse` int DEFAULT '3000',
  `spacedRepetition_countdownWrongResponse` int DEFAULT '10000',
  PRIMARY KEY (`username`)
);

-- Create the vocabulary_id_manager table if it does not exist
CREATE TABLE IF NOT EXISTS `vocabulary_id_manager` (
  `username` varchar(255) NOT NULL,
  `next_id` int DEFAULT '0',
  `words_total_current` int DEFAULT '0',
  `words_total_deleted` int DEFAULT '0',
  `words_total_romaji` int DEFAULT '0',
  `words_total_hiragana` int DEFAULT '0',
  `words_total_katakana` int DEFAULT '0',
  `words_total_kanji` int DEFAULT '0',
  `verbs_total_current` int DEFAULT '0',
  `verbs_total_deleted` int DEFAULT '0',
  `verbs_total_romaji` int DEFAULT '0',
  `verbs_total_hiragana` int DEFAULT '0',
  `verbs_total_kanji` int DEFAULT '0',
  PRIMARY KEY (`username`)
);

-- Create the vocabulary_id_vocab_type_mapping table if it does not exist
CREATE TABLE IF NOT EXISTS `vocabulary_id_vocab_type_mapping` (
  `row_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `id` int DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`row_id`)
);

-- Create the vocabulary_tags_mapping table if it does not exist
CREATE TABLE IF NOT EXISTS `vocabulary_tags_mapping` (
  `username` varchar(255) DEFAULT NULL,
  `tag_id` int NOT NULL,
  `tag_name` varchar(1000) DEFAULT NULL,
  `tag_words_count` int DEFAULT '0',
  `tag_verbs_count` int DEFAULT '0',
  PRIMARY KEY (`tag_id`)
);

-- Create the vocabulary_verbs_list table if it does not exist
CREATE TABLE IF NOT EXISTS `vocabulary_verbs_list` (
  `id` int NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `regular_verb` tinyint(1) DEFAULT NULL,
  `romaji_present_affirmative` varchar(1000) DEFAULT NULL,
  `romaji_present_negative` varchar(1000) DEFAULT NULL,
  `romaji_past_affirmative` varchar(1000) DEFAULT NULL,
  `romaji_past_negative` varchar(1000) DEFAULT NULL,
  `hiragana_present_affirmative` varchar(1000) DEFAULT NULL,
  `hiragana_present_negative` varchar(1000) DEFAULT NULL,
  `hiragana_past_affirmative` varchar(1000) DEFAULT NULL,
  `hiragana_past_negative` varchar(1000) DEFAULT NULL,
  `kanji_present_affirmative` varchar(1000) DEFAULT NULL,
  `kanji_present_negative` varchar(1000) DEFAULT NULL,
  `kanji_past_affirmative` varchar(1000) DEFAULT NULL,
  `kanji_past_negative` varchar(1000) DEFAULT NULL,
  `translation` varchar(1000) DEFAULT NULL,
  `description` text,
  `tags` varchar(3000) DEFAULT NULL,
  `exclude_from_spaced_repetition` tinyint(1) DEFAULT NULL,
  `edited_year` int DEFAULT NULL,
  `edited_month` int DEFAULT NULL,
  `edited_day` int DEFAULT NULL,
  `edited_hour` int DEFAULT NULL,
  `edited_minute` int DEFAULT NULL,
  `edited_second` int DEFAULT NULL,
  `created_year` int DEFAULT NULL,
  `created_month` int DEFAULT NULL,
  `created_day` int DEFAULT NULL,
  `created_hour` int DEFAULT NULL,
  `created_minute` int DEFAULT NULL,
  `created_second` int DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- Create the vocabulary_words_list table if it does not exist
CREATE TABLE IF NOT EXISTS `vocabulary_words_list` (
  `id` int NOT NULL,
  `username` varchar(1000) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `romaji` varchar(1000) DEFAULT NULL,
  `hiragana` varchar(1000) DEFAULT NULL,
  `katakana` varchar(1000) DEFAULT NULL,
  `kanji` varchar(1000) DEFAULT NULL,
  `translation` varchar(1000) DEFAULT NULL,
  `tags` varchar(1000) DEFAULT NULL,
  `description` text,
  `exclude_from_spaced_repetition` tinyint DEFAULT '0',
  `edited_year` int DEFAULT NULL,
  `edited_month` int DEFAULT NULL,
  `edited_day` int DEFAULT NULL,
  `edited_hour` int DEFAULT NULL,
  `edited_minute` int DEFAULT NULL,
  `edited_second` int DEFAULT NULL,
  `created_year` int DEFAULT NULL,
  `created_month` int DEFAULT NULL,
  `created_day` int DEFAULT NULL,
  `created_hour` int DEFAULT NULL,
  `created_minute` int DEFAULT NULL,
  `created_second` int DEFAULT NULL,
  PRIMARY KEY (`id`)
);
