Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C316ACA5FED
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 00:07:14 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1441823.1659387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEFBW-0001IF-L5; Wed, 07 Oct 2026 00:07:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1441823.1659387; Wed, 07 Oct 2026 00:07:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEFBW-0001Hz-GB; Wed, 07 Oct 2026 00:07:02 +0000
Received: by outflank-mailman (input) for mailman id 1441823;
 Wed, 07 Oct 2026 00:07:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1xEFBV-000166-BJ
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 00:07:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEFBU-007OBc-OG
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 02:07:00 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6ac58cc9-bab6-0a2a0a5309dd-0a2a450abe3a-44
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 02:07:00 +0200
Received: from [40.107.159.76]
 (helo=OSPPR02CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6ac58d24-f2d2-0a2a450a0019-286b9f4c3390-3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 02:07:00 +0200
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com (2603:10a6:20b:595::7)
 by AS4PR03MB8229.eurprd03.prod.outlook.com (2603:10a6:20b:4fb::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Wed, 7 Oct
 2026 00:06:59 +0000
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5]) by AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5%5]) with mapi id 15.21.0496.010; Wed, 7 Oct 2026
 00:06:58 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OrMeCo8BTIo/tkZ2aoMVlMM5OHxj5tJ2IiwAG3wX5A2zJmBVF3Bm0Yu+x2sHEZFRH9Z9PCGYRo329Je/LupiEj6nkU06KWe/aCo5PD2wPbrH6Ky/qNdflqgVcCwwWNn7cw2v2TtIhmfBl/SjelcfY7wEn3vQxaVOMRO6c8Z3BDdWSPq96US+stlMRVtZK9+Ef/bdSevclQBXsu1Rx9K617LYuzvs7sQ45LG31Drb3mkblqxlF3WSxsmw8vVJTVxDoA8oaOJqG8zEo4V8TXU04GaRNpgO+U1/9SQojbzrycNdMRrdzYBSjDC28ud/J/G2a2zjIkkfSnvwmtbltFt57Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZX1fkNMEr4jp0dkdFeex4eMUWUikMiPdGtiu6YaUq9U=;
 b=S6G8OYkvpXXcoVuj/dspUS4Y+wjVVfxEQLIxWVxil5VylJrA2gPlZxEqsgZP7Zm76FZ3ABhKRDoBk7nhlGbMpDhYvY1RhacetbwAmPB2SGZPNwS7okC6IZypVlkLmm+BgTTgrNt5Oll8guKDeLD0QSpuQ+qh5ZRf96VcSr6GKXuaq0cdZcACn+rKdrlmjpbiC5sYul/d6dHkQ7+TT4GeyV1xdT18kUpZWBRGq2uTZAgaUy1WyrEk6Aq2WRp8mvIEbifshRiuy/TTQeMDOtySY/s2hMZo32ToATMC/R0+E/seUnG6arbcQ2s9EV+Gq7L1V56lrCPm4UEN/PWO/VzB4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZX1fkNMEr4jp0dkdFeex4eMUWUikMiPdGtiu6YaUq9U=;
 b=Ase6/KUqs9d5JFfwj4LSOcuIiBLgt0HyPluh/LnY2Y3nR+PfNsWy4IxbYg4Ve89JctJw0UCG3DBtHIjB+VbzXtBBjEx/h9YailinDuAjZ80Gb9i76iaIadBPlpPfqRb/rSoLnK0KUFFmRCi6gGgcsdZSWUGNXuM6scAli0i3WB/4cw02iA9bWcdk/SUHZW2u5o28kazBUf0EKaZgdmEbGr1IdVZ5kas8/ClKUkEFDoAO4VoczbtLQ9L8VRF8Ct0m87KsFi8ZosYRiN+zUB7rGja4lz+2c8rdTaqDMlqYeiVqtJm6jOb+e7jJ+ZhNhFVeQlsmtopNNuHnvy+JCv7I+A==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Milan Djokic <milan_djokic@epam.com>
Subject: [PATCH v4 09/22] xen/arm: vsmmuv3: Add support for cmdqueue handling
Thread-Topic: [PATCH v4 09/22] xen/arm: vsmmuv3: Add support for cmdqueue
 handling
Thread-Index: AQHdVe/FeuyLdMB91Eu+JPmDuJ9vXw==
Date: Wed, 7 Oct 2026 00:06:58 +0000
Message-ID:
 <b7fcd3cdbe97ae2f23a5797f8c9c51ddba63fcc6.1791328190.git.milan_djokic@epam.com>
References: <cover.1791328190.git.milan_djokic@epam.com>
In-Reply-To: <cover.1791328190.git.milan_djokic@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB9587:EE_|AS4PR03MB8229:EE_
x-ms-office365-filtering-correlation-id: 05f0c31c-419a-4d02-0685-08df2406e7cd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|56012099006|11063799006|10067099003|6133799003|3023799007|22082099003|38070700021|18002099003;
x-microsoft-antispam-message-info:
 xNxCcjEM1NxhoPH1HxJCASu3AOcGCKakDmszI+bOLTz1gvcltd3AEKilhQ3HBm9uJ9+MdxVyluzJCfXs5kYPnEIO3aKwS1+0fSyagavzCEbqDzTNfacWlAxrVNRtYJHaBI5s3vKgHeZ3ThwzTHWyhP7HVmZNRWxhwL58VJpgh7lLWLSULnWgT3hyZ8Xug6bMCEyOpVZ3acGKOURuqCW5fxEFr8uD0JkEvsK/qwbOL83JBqoBcHoq3minpFbAsVYZv+yghXe2iQH1pJJ3EE3JrDiv3uotow2Mao07fDnm9DnEX9+e29XjzdlP7OiYNz1MWVY7EPpm16yApfxCc5Nrgk+CUHBsHxuyIFSIvj4ChyNHD0y10mHufG5l7mQOoJ29COCQI3gxzHPvAQ/FSIq4ajEgO5CjoZBKyOtQOBbWhu1N0HXQFnnJPhLkrMHNaT7uN1F+633wllV3F3huWmL5FzDOBktz/apyHkRGVzUao73DTGUWvgj0/JunyGSomTrlc/O1ZSOt0MCxCQIAqUQz1/aLgOBTtpGIZ/GvApoTVv+ta7WGvDDX23iooqnz4kOj7h/0lAKqG+IEKdbJUspdKnrv+KqKgHLSRcItzqOSFYUwbAxikkitatLsK57+4vUF99CE9G5MNuZkiUryOeOiROXAsCnEzTxYk7gj81hXjVybzaoy0VKEkVubOkAkNuj0VixrPDGiSBFG1RAZtdXZiHAPMZDnhHUfF7UnXR8P3yM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9587.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(56012099006)(11063799006)(10067099003)(6133799003)(3023799007)(22082099003)(38070700021)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OWQ1SmdMN3VsSGJ4WWFnTEx4eFlCL0QxakxqMElrRDFGbEJmZlh2NmY2YnBE?=
 =?utf-8?B?eGJtVGlZWWpWeGhUL0t5MDNnT1hxUGw3Q2MvSXVHN1F2MmZ3YWdVeUlzVjFY?=
 =?utf-8?B?bWNZcnF6YU5jVVNZaVZxWXl0NzZ0WVdWQU9QeThkcWd5NzBwbGZiejM0WUZl?=
 =?utf-8?B?VzVOUXI1dnhvNEF4R1BMTmRzUjVaNjZmTWI1WkRraTRnS1BZMG9LWG44N0Ix?=
 =?utf-8?B?aTFyZit5dnFCYUlxanNpTFhVd2w4MlBYRW1oN1hPM1lKd3JpUm5LWGZKcEdx?=
 =?utf-8?B?UyswTmJEZHIzdnVHNWZOeW5aeHZnVy9LN0wvYUpmVktNdnY3REo2eXlDNkFp?=
 =?utf-8?B?ZUVrWnJ6dHlzMGQ5bWl6L1A2QTVYUEJEc1RZWm90QnNCV3hTMndCYXJWZHhS?=
 =?utf-8?B?QkZONitSUTZoRTZGWjdaMUtXWS9uTWdUOHVBbEYrM3o3MVBJc204Z2pFdDAw?=
 =?utf-8?B?MFVHYk8vOFZ0UVp6WWI1bGpmZk5oMHZQZExjaGZFVWlBSEFHVHo3dlZFQWQ5?=
 =?utf-8?B?dnJ3WDdKS0Z6K2tFYUllM04wWE1Pdm52OXlab1RxYS90cXF6Nnc2bSs1M3RB?=
 =?utf-8?B?OXdPeFNUd1JVT2pmdWNBRnJQQ0VzR2J1cHVZOWNIUE9kMXVBTXovNG5yamRs?=
 =?utf-8?B?VkRLeXp2aDFMeEFhb3RXNk10bnp0RkhkZjdTT05LZUJ0Z0Q3TFpGNCtNa2k1?=
 =?utf-8?B?aUpGeUpIKzR0QjJaV1hraGZtb2xwN2drS0d0dGdCbFk5Slh6UzBTYUc3SDRI?=
 =?utf-8?B?S3NSV3ppbVBMR3J5aXF1eElnWGVjSVdyUFM4ZWdIQzB5L2NyZVV6ODdWak9r?=
 =?utf-8?B?ZWthbzNXNVNvYWRUcVBseUdUaXJnemNtVHlKRzNQZ1dYekxLWXZWS0RLSHNq?=
 =?utf-8?B?bUNpQmt5MnZVZ0llai9iREgrUTlOVHZIQWhaVUQ5NHFJemZnWS9IYUtON3FT?=
 =?utf-8?B?SXVqeDZLQzdkSTR5ZVhINmtwRzRyK1lqaU40bjE5SzEyUHhYZGlIRTllRCtG?=
 =?utf-8?B?bFE1NWd5UW5uRFhaeTFyUUxMWUUwQnFDZ1V2aEVXSVMyeVZwRVlIM3ZVR1hU?=
 =?utf-8?B?cFhTYjBsVnhUalZnSkEwa0RlNVRWWGJkL1JLSjFKVC9XdVg0bWVPSTdwZTJZ?=
 =?utf-8?B?c1NBMGdMMWUweXpuTitPQ1FUeUJ2T3hyTUtnVG9TS3dySDM2eitxd05kY1BW?=
 =?utf-8?B?VTl3blVrMkFYTTJJUmFMQ0xOVU04akowMkM3NjZ3OEF5UmJKMTJzTnEyUy8y?=
 =?utf-8?B?Yk9rZUliNTkyU2FxWmZ6MUJhUC9nMG9HTUNwTGNpMkRBTUlCa0F2cUNlemhY?=
 =?utf-8?B?WnBZZU9heDVxVW1Hclh5aUs4ZFlGVDZVQnRVdkRBMWozRVV2amlRNHRMWFdI?=
 =?utf-8?B?ZWJKRytYTmcwTHBWbDRSTWg2VSsyeEtXYjhjcmN6UnllMUZzL1N6V0FtNFdT?=
 =?utf-8?B?T29DTm13Q1FtSy8yTzNLYVN4RDVHb1pyekhuaUtkWDNHdFFzTThRcjUyVlVW?=
 =?utf-8?B?YWNPTVovUmdSQkM0OVV3OFVoeFJlUXU5bm1FdGZnV29nbmhhUkZXU3NjeW5U?=
 =?utf-8?B?cHg4QjVJdmF0TUY1OURJL1d5bnliQnlYYS9aMG1JQWZGdnVocjlhSmdPa0pN?=
 =?utf-8?B?c0VtTmNsZkNmUi9pZUk3aGdaUE85RzVVNE9uNVpadllPNnphZ3BtbmJOOHdu?=
 =?utf-8?B?NE1aM1UxVEJKdFBzQ3NPZlRqOEk0dGZjUENJVDc2c2Q4T1RyL1hYRnJKcVNH?=
 =?utf-8?B?SnpaWGFTWVhRM3BFZVZIbFVYUE1GdFhhS0U3VjlLM1JFdW1XREJRaUNKdUd6?=
 =?utf-8?B?TXBpNTFNNXFEY3FzSWEySlQ0cU5pKzU3a1NMZERjTlZHSGsreXJ4RXIva0FM?=
 =?utf-8?B?TWZndkJxM1JBNzVwOFkwNFpuNzlTWWs4ZmhXNXVHUXE0N3V5MlZ1YWVwZDlQ?=
 =?utf-8?B?aFdHUWV0VzJ2QnZQNUFTRUdzT3dJRXprUzlYUk81Y2d2WjJLYzl1TlE0VElh?=
 =?utf-8?B?WEhDajBETEpkU0dlTUhFUVQ2YXY1RG1wa2szZmtIU1dMUVpiVHIyMWh0d1Vm?=
 =?utf-8?B?VnA5OVFXL0NDc0xHVVdEZ1JIUXFFd2MrSEhWdEJqL3NBSzhaL2xYK29mRlQ3?=
 =?utf-8?B?aE5uUHl4aGQ2TE9SUFM0NXd6b1M1T28vRFJ2UFQyR3BlTGcwUm1ZYXVZTFI2?=
 =?utf-8?B?MVpBbzRjeklRblk2aHhOc1BvQ3ZJazhmZ0JyMXNJcm1mT1RPZUNaN2lETTNE?=
 =?utf-8?B?UmhRSS9hamFadmZIQnBJT1FGRFZLVVQ1TGN3Q1hhOXltblhKVUdodS92YVJI?=
 =?utf-8?B?NUdtNTYxNG1QODNPNmlYdWpmQk9FNFUzMW9DbFlPWW5BeG5tcXdQQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9587.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05f0c31c-419a-4d02-0685-08df2406e7cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2026 00:06:58.7049
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cl+uhOYLPwbpYYpCqoBy7WscD/5V29QVH82DQbj5tRpxmj7Cd+vvCYJIWOrgdYBiE2XK1Q5EUYpFtvQyv1tfVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR03MB8229
X-purgate-ID: tlsNG-4011c0/1791331620-524DFCFC-3EC5DF58/0/0
X-purgate-type: clean
X-purgate-size: 7386

RnJvbTogUmFodWwgU2luZ2ggPHJhaHVsLnNpbmdoQGFybS5jb20+DQoNCkFkZCBzdXBwb3J0IGZv
ciB2aXJ0dWFsIGNtZHF1ZXVlIGhhbmRsaW5nIGZvciBndWVzdHMNCg0KU2lnbmVkLW9mZi1ieTog
UmFodWwgU2luZ2ggPHJhaHVsLnNpbmdoQGFybS5jb20+DQpTaWduZWQtb2ZmLWJ5OiBNaWxhbiBE
am9raWMgPG1pbGFuX2Rqb2tpY0BlcGFtLmNvbT4NCi0tLQ0KIHhlbi9kcml2ZXJzL3Bhc3N0aHJv
dWdoL2FybS92c21tdS12My5jIHwgMTI3ICsrKysrKysrKysrKysrKysrKysrKysrKysNCiAxIGZp
bGUgY2hhbmdlZCwgMTI3IGluc2VydGlvbnMoKykNCg0KZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJz
L3Bhc3N0aHJvdWdoL2FybS92c21tdS12My5jIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJt
L3ZzbW11LXYzLmMNCmluZGV4IGM0ZmVmNmU4YmQuLjEwMTQzOTI3ZTcgMTAwNjQ0DQotLS0gYS94
ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vdnNtbXUtdjMuYw0KKysrIGIveGVuL2RyaXZlcnMv
cGFzc3Rocm91Z2gvYXJtL3ZzbW11LXYzLmMNCkBAIC04LDYgKzgsNyBAQA0KICAqIFRoaXMgbmVl
ZHMgdG8gYmUgZnVsbHkgaGFuZGxlZCBpbiB0aGUgZnV0dXJlLg0KICAqLw0KIA0KKyNpbmNsdWRl
IDx4ZW4vZ3Vlc3RfYWNjZXNzLmg+DQogI2luY2x1ZGUgPHhlbi9wYXJhbS5oPg0KICNpbmNsdWRl
IDx4ZW4vc2NoZWQuaD4NCiAjaW5jbHVkZSA8YXNtL21taW8uaD4NCkBAIC0zMyw2ICszNCw1MSBA
QA0KICNkZWZpbmUgU01NVV9FVlRRUyAgICAgICAgICAxOQ0KICNkZWZpbmUgRFdPUkRTX0JZVEVT
ICAgICAgICA4DQogDQorLyogDQorICogU01NVXYzIGNvbW1hbmQgZGVmaW5pdGlvbnMNCisgKiBT
b21lIGNvbW1hbmRzIGFyZSBmdWxseSBoYW5kbGVkIGJ5IHRoZSBlbXVsYXRpb24gbGF5ZXIsIHdo
aWxlIG90aGVycyBhcmUNCisgKiBjdXJyZW50bHkgdHJlYXRlZCBhcyBhcmNoaXRlY3R1cmFsIG5v
LW9wcyBiZWNhdXNlIHRoZSByZXF1aXJlZCBiZWhhdmlvcg0KKyAqIGlzIGVpdGhlciBpbXBsaWNp
dGx5IGd1YXJhbnRlZWQgYnkgWGVuIG9yIG5vdCB5ZXQgbW9kZWxlZCBleHBsaWNpdGx5Lg0KKyAq
DQorICogRW11bGF0aW9uIGhhbmRsZWQgY29tbWFuZHM6DQorICoNCisgKiAtIENNRF9DRkdJX1NU
RQ0KKyAqIC0gQ01EX1RMQklfTkhfQVNJRA0KKyAqIC0gQ01EX1RMQklfTlNOSF9BTEwNCisgKiAt
IENNRF9UTEJJX05IX1ZBDQorICoNCisgKiBOby1vcC9JbXBsaWNpdGx5IGhhbmRsZWQgY29tbWFu
ZHM6DQorICoNCisgKiAtIENNRF9TWU5DDQorICogLSBDTURfUFJFRkVUQ0hfQ0ZHDQorICogLSBD
TURfQ0ZHSV9DRA0KKyAqIC0gQ01EX0NGR0lfQ0RfQUxMDQorICogLSBDTURfQ0ZHSV9BTEwNCisg
Kg0KKyAqIFRPRE86IFJlbWFpbmluZyBhcmNoaXRlY3R1cmUtZGVmaW5lZCBjb21tYW5kcyBhcmUg
bm90IHN1cHBvcnRlZCAoZXJyb3INCisgKiBwcm9kdWNlZCksIGR1ZSB0byBsYWNrIG9mIHN1cHBv
cnQgaW4gU01NVXYzIGRyaXZlciAvIGVtdWxhdGlvbiBsYXllcg0KKyAqIFRPRE86IFJhbmdlIC8g
cGVyLWRldmljZSBpbnZhbGlkYXRpb24gbm90IHN1cHBvcnRlZCBhdG0NCisgKiBUT0RPOiBMb25n
LXJ1bm5pbmcgY29tbWFuZCBxdWV1ZSBoYW5kbGluZyBpcyBub3QgaW1wbGVtZW50ZWQgKGNvbW1h
bmQNCisgKiBjb25zdW1wdGlvbiBzaG91bGQgYmUgYnVkZ2V0ZWQgd2l0aCBhc3luY2hyb25vdXMg
cmVzdW1wdGlvbikuDQorICovDQorI2RlZmluZSBDTURRX09QX1BSRUZFVENIX0NGRyAgICAweDEN
CisjZGVmaW5lIENNRFFfT1BfQ0ZHSV9TVEUgICAgICAgIDB4Mw0KKyNkZWZpbmUgQ01EUV9PUF9D
RkdJX0FMTCAgICAgICAgMHg0DQorI2RlZmluZSBDTURRX09QX0NGR0lfQ0QgICAgICAgICAweDUN
CisjZGVmaW5lIENNRFFfT1BfQ0ZHSV9DRF9BTEwgICAgIDB4Ng0KKyNkZWZpbmUgQ01EUV9PUF9U
TEJJX05IX0FTSUQgICAgMHgxMQ0KKyNkZWZpbmUgQ01EUV9PUF9UTEJJX05IX1ZBICAgICAgMHgx
Mg0KKyNkZWZpbmUgQ01EUV9PUF9UTEJJX05TTkhfQUxMICAgMHgzMA0KKyNkZWZpbmUgQ01EUV9P
UF9DTURfU1lOQyAgICAgICAgMHg0Ng0KKw0KKy8qIFF1ZXVlIEhhbmRsaW5nICovDQorI2RlZmlu
ZSBRX0JBU0UocSkgICAgICAgKChxKS0+cV9iYXNlICYgUV9CQVNFX0FERFJfTUFTSykNCisjZGVm
aW5lIFFfQ09OU19FTlQocSkgICAoUV9CQVNFKHEpICsgUV9JRFgocSwgKHEpLT5jb25zKSAqIChx
KS0+ZW50X3NpemUpDQorI2RlZmluZSBRX1BST0RfRU5UKHEpICAgKFFfQkFTRShxKSArIFFfSURY
KHEsIChxKS0+cHJvZCkgKiAocSktPmVudF9zaXplKQ0KKw0KKy8qIEhlbHBlciBNYWNyb3MgKi8N
CisjZGVmaW5lIHNtbXVfY21kX2dldF9jb21tYW5kKHgpICAgICBGSUVMRF9HRVQoQ01EUV8wX09Q
LCB4KQ0KKw0KIC8qIHZpcnR1YWwgc21tdSBxdWV1ZSAqLw0KIHN0cnVjdCBhcm1fdnNtbXVfcXVl
dWUgew0KICAgICB1aW50NjRfdCAgICBxX2Jhc2U7IC8qIGJhc2UgcmVnaXN0ZXIgKi8NCkBAIC05
OSw2ICsxNDUsODMgQEAgc3RhdGljIGlubGluZSBib29sIHNtbXVfZ2V0X2V2dHFfZW5hYmxlZChz
dHJ1Y3QgdmlydF9zbW11ICpzbW11KQ0KICAgICBzcGluX3VubG9jaygmc21tdS0+Y3IwX2xvY2sp
Ow0KIA0KICAgICByZXR1cm4gZW5hYmxlZDsNCit9Ow0KKw0KKy8qIFF1ZXVlIG1hbmlwdWxhdGlv
biBmdW5jdGlvbnMgKi8NCitzdGF0aWMgYm9vbCBxdWV1ZV9lbXB0eShzdHJ1Y3QgYXJtX3ZzbW11
X3F1ZXVlICpxKQ0KK3sNCisgICAgcmV0dXJuIFFfSURYKHEsIHEtPnByb2QpID09IFFfSURYKHEs
IHEtPmNvbnMpICYmDQorICAgICAgICAgICBRX1dSUChxLCBxLT5wcm9kKSA9PSBRX1dSUChxLCBx
LT5jb25zKTsNCit9DQorDQorc3RhdGljIHZvaWQgcXVldWVfaW5jX2NvbnMoc3RydWN0IGFybV92
c21tdV9xdWV1ZSAqcSkNCit7DQorICAgIHVpbnQzMl90IGNvbnMgPSAoUV9XUlAocSwgcS0+Y29u
cykgfCBRX0lEWChxLCBxLT5jb25zKSkgKyAxOw0KKyAgICBxLT5jb25zID0gUV9PVkYocS0+Y29u
cykgfCBRX1dSUChxLCBjb25zKSB8IFFfSURYKHEsIGNvbnMpOw0KK30NCisNCitzdGF0aWMgdm9p
ZCBkdW1wX3NtbXVfY29tbWFuZCh1aW50NjRfdCAqY29tbWFuZCkNCit7DQorICAgIGdwcmludGso
WEVOTE9HX0VSUiwgImNtZCAweCUwMmxseDogJTAxNiJQUkl4NjQiICUwMTYiUFJJeDY0IlxuIiwN
CisgICAgICAgICAgICAgc21tdV9jbWRfZ2V0X2NvbW1hbmQoY29tbWFuZFswXSksIGNvbW1hbmRb
MF0sIGNvbW1hbmRbMV0pOw0KK30NCitzdGF0aWMgaW50IGFybV92c21tdV9oYW5kbGVfY21kcyhz
dHJ1Y3QgdmlydF9zbW11ICpzbW11KQ0KK3sNCisgICAgc3RydWN0IGFybV92c21tdV9xdWV1ZSAq
cSA9ICZzbW11LT5jbWRxOw0KKyAgICBzdHJ1Y3QgZG9tYWluICpkID0gc21tdS0+ZDsNCisgICAg
dWludDY0X3QgY29tbWFuZFtDTURRX0VOVF9EV09SRFNdOw0KKyAgICBwYWRkcl90IGFkZHI7DQor
ICAgIGludCByZXQgPSAwOw0KKw0KKyAgICBpZiAoICFzbW11X2dldF9jbWRxX2VuYWJsZWQoc21t
dSkgKQ0KKyAgICAgICAgcmV0dXJuIDA7DQorDQorICAgIHdoaWxlICggIXF1ZXVlX2VtcHR5KHEp
ICkNCisgICAgew0KKyAgICAgICAgaW50IHJldDsNCisNCisgICAgICAgIGFkZHIgPSBRX0NPTlNf
RU5UKHEpOw0KKyAgICAgICAgcmV0ID0gYWNjZXNzX2d1ZXN0X21lbW9yeV9ieV9ncGEoZCwgYWRk
ciwgY29tbWFuZCwNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNp
emVvZihjb21tYW5kKSwgZmFsc2UpOw0KKyAgICAgICAgaWYgKCByZXQgKSB7DQorICAgICAgICAg
ICAgcXVldWVfaW5jX2NvbnMocSk7DQorICAgICAgICAgICAgcmV0dXJuIHJldDsNCisgICAgICAg
IH0NCisNCisgICAgICAgIHN3aXRjaCAoIHNtbXVfY21kX2dldF9jb21tYW5kKGNvbW1hbmRbMF0p
ICkNCisgICAgICAgIHsNCisgICAgICAgIGNhc2UgQ01EUV9PUF9DRkdJX1NURToNCisgICAgICAg
ICAgICBicmVhazsNCisgICAgICAgIGNhc2UgQ01EUV9PUF9QUkVGRVRDSF9DRkc6DQorICAgICAg
ICBjYXNlIENNRFFfT1BfQ0ZHSV9DRDoNCisgICAgICAgIGNhc2UgQ01EUV9PUF9DRkdJX0NEX0FM
TDoNCisgICAgICAgIGNhc2UgQ01EUV9PUF9DRkdJX0FMTDoNCisgICAgICAgIGNhc2UgQ01EUV9P
UF9DTURfU1lOQzoNCisgICAgICAgICAgICBicmVhazsNCisgICAgICAgIGNhc2UgQ01EUV9PUF9U
TEJJX05IX0FTSUQ6DQorICAgICAgICBjYXNlIENNRFFfT1BfVExCSV9OU05IX0FMTDoNCisgICAg
ICAgIGNhc2UgQ01EUV9PUF9UTEJJX05IX1ZBOg0KKyAgICAgICAgICAgIHJldCA9IGlvbW11X2lv
dGxiX2ZsdXNoX2FsbChzbW11LT5kLCAxKTsNCisgICAgICAgICAgICBpZiAoICFyZXQgKQ0KKyAg
ICAgICAgICAgICAgICBicmVhazsNCisgICAgICAgICAgICBmYWxsdGhyb3VnaDsNCisgICAgICAg
IGRlZmF1bHQ6DQorICAgICAgICAgICAgZ2RwcmludGsoWEVOTE9HX0VSUiwgInZTTU1VdjM6IHVu
aGFuZGxlZCBjb21tYW5kXG4iKTsNCisgICAgICAgICAgICBkdW1wX3NtbXVfY29tbWFuZChjb21t
YW5kKTsNCisgICAgICAgICAgICBicmVhazsNCisgICAgICAgIH0NCisNCisgICAgICAgIGlmICgg
cmV0ICkNCisgICAgICAgIHsNCisgICAgICAgICAgICBnZHByaW50ayhYRU5MT0dfRVJSLA0KKyAg
ICAgICAgICAgICAgICAgICAgICJ2U01NVXYzOiBjb21tYW5kIGVycm9yICVkIHdoaWxlIGhhbmRs
aW5nIGNvbW1hbmRcbiIsDQorICAgICAgICAgICAgICAgICAgICAgcmV0KTsNCisgICAgICAgICAg
ICBkdW1wX3NtbXVfY29tbWFuZChjb21tYW5kKTsNCisgICAgICAgIH0NCisgICAgICAgIHF1ZXVl
X2luY19jb25zKHEpOw0KKyAgICB9DQorDQorICAgIHJldHVybiByZXQ7DQogfQ0KIA0KIHN0YXRp
YyBpbnQgdnNtbXV2M19tbWlvX3dyaXRlKHN0cnVjdCB2Y3B1ICp2LCBtbWlvX2luZm9fdCAqaW5m
bywNCkBAIC0yMjEsNiArMzQ0LDEwIEBAIHN0YXRpYyBpbnQgdnNtbXV2M19tbWlvX3dyaXRlKHN0
cnVjdCB2Y3B1ICp2LCBtbWlvX2luZm9fdCAqaW5mbywNCiAgICAgICAgICAgICByZWczMiA9IHNt
bXUtPmNtZHEucHJvZDsNCiAgICAgICAgICAgICB2cmVnX3JlZzMyX3VwZGF0ZSgmcmVnMzIsIHIs
IGluZm8pOw0KICAgICAgICAgICAgIHNtbXUtPmNtZHEucHJvZCA9IHJlZzMyOw0KKw0KKyAgICAg
ICAgICAgIGlmICggYXJtX3ZzbW11X2hhbmRsZV9jbWRzKHNtbXUpICkNCisgICAgICAgICAgICAg
ICAgZ2RwcmludGsoWEVOTE9HX0VSUiwgImVycm9yIGhhbmRsaW5nIHZTTU1VdjMgY29tbWFuZHNc
biIpOw0KKw0KICAgICAgICAgICAgIHNwaW5fdW5sb2NrKCZzbW11LT5jbWRfcXVldWVfbG9jayk7
DQogICAgICAgICAgICAgYnJlYWs7DQogDQotLSANCjIuNDMuMA0K

