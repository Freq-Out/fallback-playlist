#!/usr/bin/php
<?php

define('DB_DSN',        'pgsql:dbname=airtime;host=127.0.0.1;port=5432');
define('DB_USER',       'airtime');
define('DB_PASS',       'airtime');

/*
 *
 */

$options = getopt('t:g:e:');

$condition = array();
$conditionSQL = NULL;
if (isset($options['t'])) {

        $condition[] = sprintf("length < '%s'",
                preg_replace('/[^0-9:]/', '', $options['t'])
        );
}
if (isset($options['g'])) {

        $condition[] = sprintf("genre IN ('%s')", implode("','", explode(',',
                preg_replace('/[^a-z,]/', '', $options['g'])
        )));
}
if (isset($options['e'])) {

        $condition[] = sprintf("genre NOT IN ('%s')", implode("','", explode(',',
                preg_replace('/[^a-z,]/', '', $options['e'])
        )));
}
if (count($condition)) {

        $conditionSQL = 'WHERE '.implode(' AND ', $condition);
}

$queryCount = 'SELECT COUNT(*) FROM cc_files '.$conditionSQL;
$querySong = 'SELECT id, directory, filepath, length FROM cc_files '.$conditionSQL.' OFFSET random() * %d LIMIT 1';

try {

        $dbh = new PDO(DB_DSN, DB_USER, DB_PASS);
        $dbh->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);

        $directories = array();
        foreach ($dbh->query('SELECT * FROM cc_music_dirs') as $dir) {

                $directories[$dir['id']] = $dir['directory'];
        }

        $result = $dbh->query($queryCount);
        $count = $result->fetch();
        $count = $count['count'];

        $querySong = sprintf($querySong, $count);
        $result = $dbh->query($querySong);
        $song = $result->fetch();

        $output = $directories[$song['directory']].$song['filepath'];
        echo $output;

        $dbh = NULL;

} catch (PDOException $e) {

        echo $argv[0].' error: '.$e->getMessage();
}

~                                                                    