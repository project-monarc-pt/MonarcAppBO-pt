<?php
/**
 * Local Configuration Override
 *
 * This configuration override file is for overriding environment-specific and
 * security-sensitive configuration information. Copy this file without the
 * .dist extension at the end and populate values as needed.
 *
 * @NOTE: This file is ignored from Git by default with the .gitignore included
 * in ZendSkeletonApplication. This is a good practice, as it prevents sensitive
 * credentials from accidentally being committed into version control.
 */

$appdir = getenv('APP_DIR') ?: '${PATH_TO_MONARC}';

$package_json = json_decode(file_get_contents('./package.json'), true);

return [
    'doctrine' => [
        'connection' => [
            'orm_default' => [
                'params' => [
                    'host' => '${DBHOST}',
                    'user' => '${DBUSER_MONARC}',
                    'password' => '${DBPASSWORD_MONARC}',
                    'dbname' => '${DBNAME_COMMON}',
                ],
            ],
            'orm_cli' => [
                'params' => [
                    'host' => '${DBHOST}',
                    'user' => '${DBUSER_MONARC}',
                    'password' => '${DBPASSWORD_MONARC}',
                    'dbname' => '${DBNAME_CLI}',
                ],
            ],
        ],
    ],

    'languages' => [
        'pt' => [
            'index' => 1,
            'label' => 'Português',
        ],
        'en' => [
            'index' => 2,
            'label' => 'English',
        ],
    ],

    'defaultLanguageIndex' => 1,

    'activeLanguages' => ['pt','en'],

    'appVersion' => $package_json['version'],

    'checkVersion' => true,
    'appCheckingURL' => 'https://version.monarc.lu/check/MONARC',

    'email' => [
        'name' => 'MONARC',
        'from' => 'info@monarc.lu',
    ],

    'instanceName' => 'Development', // for example a short URL or client name from ansible
    'twoFactorAuthEnforced' => false,

    'terms' => 'https://my.monarc.lu/terms.html',

    'monarc' => [
        'ttl' => 60,
        'cliModel' => 'generic',
    ],

    'twoFactorAuthEnforced' => false,

    'mospApiUrl' => 'https://objects.monarc.lu/api/',

    'statsApi' => [
        'baseUrl' => 'http://127.0.0.1:${STATS_PORT}',
        'apiKey' => '${APIKEY}',
    ],

    'import' => [
        'uploadFolder' => $appdir . '/data/import/files',
        'isBackgroundProcessActive' => false,
    ],

    'export' => [
        'defaultWithEval' => true,
    ],

    'captcha' => [
        'enabled' => true,
        'failedLoginAttempts' => 3,
        'params' => [
            'name' => 'MonarcCaptcha',
            'font' => $appdir . '/data/fonts/arial.ttf',
            'fontSize' => 30,
            'height' => 60,
            'wordLen' => 6,
            'timeout' => 300,
            'imgDir' => $appdir . '/public/captcha',
            'imgUrl' => 'captcha/',
        ],
    ],

    /* Custom configuration of the smtp. The example config below is to make Mailcatcher work for the dev env.
    'smtpOptions' => [
        'name' => 'localhost',
        'host' => '127.0.0.1',
        'port' => 1025,
    ],
    */
];
