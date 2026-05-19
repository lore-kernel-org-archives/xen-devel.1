Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE35ACD4F57
	for <xen-devel@archiver.kernel.org>; Tue, 19 May 2026 10:27:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1312729.1582817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPHfd-0007nk-Ty; Tue, 19 May 2026 10:27:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312729.1582817; Tue, 19 May 2026 10:27:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPHfd-0007nd-RK; Tue, 19 May 2026 10:27:29 +0000
Received: by outflank-mailman (input) for mailman id 1312729;
 Tue, 19 May 2026 10:27:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1wPHfd-0007lX-8l
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 10:27:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPHfc-00D3IQ-JI
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 12:27:28 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6a0c3afd-bab6-0a2a0a5309dd-0a2a450cafcc-12
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 12:27:28 +0200
Received: from [52.101.83.89]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6a0c3b0f-62f1-0a2a450c0019-346553593b60-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 12:27:28 +0200
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by DU4PR03MB11485.eurprd03.prod.outlook.com (2603:10a6:10:632::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Tue, 19 May
 2026 10:27:24 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%3]) with mapi id 15.21.0025.023; Tue, 19 May 2026
 10:27:24 +0000
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
 b=JwW+deMeM+9NBofKpMAJTOpbMj2e5m0UjsWghMRCRWAN4PJoUVod+UxaouHQeLKjqRmjbPBcyTeJk7AeYon5ECzuyKjCceb9iwFd4Dvdlj1Yp8F6XjHIlRyT7t4pXzs370GmbuKBTYG2oDOmePPGca1DJDn8tKqGkIEo5hnZvGt1X1GfqoO9xB08+sbBYqbOrBqWh1CxHMurzzH7ELWfyn0KP1T1OuXymHisMLlSXBtDdrKOronXZVYvkupJ6zvnBHAwx7P8UoqbHPk0uZhFcGJcGrJhlLqY2ntVxUOCYFzoDZdG5c+1EhHnNEwC2zUpshvnLGQnUAeyFQDpznwhxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BtDfUFpAGFgBbe1z93oEWSJIKnJn9c0VkRHrAxZiFfY=;
 b=o/fWQQdmrDRk3JtXPMmNw6ZmpNjXof1k5/viyqIXyTxcF2tS4Ae0Wt4SaPlvYJSCRRogz3OQX7CS4TALn8WuDM6uTw9aDCRwrpB+MrJrD4pI6gLD8zU/mK0T8rGebNDTzSyOfgL9/9yQXhRPTxkPMZ9eZugJa0++7iRg6zESxe3bBxrsNHziI3oF2jUlp0WHp9peBZwEPJWB0aDvsW3Cv4qZC+LwRk/o1cUtD/qBFzeHCs2j+A/ub8Bj3Ck7OzLsdDamfFLO0+NRZeEYednREtisyuIEVS1zQhrlDyiqQSLxnrZiQda3hF0WIPOOyYshFSzHl/goOegBLY36+xz3TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BtDfUFpAGFgBbe1z93oEWSJIKnJn9c0VkRHrAxZiFfY=;
 b=GCwXvntVCo1IkbArl4mZTwW4KLkPq6aLAAsnI7MWE9NLShfm/0W3QRt8N3cgOKpPpBKE3O3JQFsNyzAIFB4GqF6jHrzxfhQv8f6RFY1umm8+8AaJVNSdAIX8gs76wVL+anri2AUsCzrIkWQxGeyxg4xRxZhDNMfAk3wqRKSEKORAsAXrFJbuXt7RI+/vx6sLyVQ9q40qakfuyyLnZI6q8o/3CyX5iERVmI3G8Z4rrVePgkROxHIzsSOb5PquMl1sqCyNDGcvizlepkJiUQHD/ZJxB+YarzMODztu7oOjfRpq/7EurPhgFat0zELEAw9vPSBx9QwvrXLXlSFtK1O8ZA==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, Stefano
 Stabellini <sstabellini@kernel.org>
Subject: [PATCH] automation/eclair: export XEN_TARGET_ARCH during assignment
Thread-Topic: [PATCH] automation/eclair: export XEN_TARGET_ARCH during
 assignment
Thread-Index: AQHc53oVx3/uBPUL1EWf6nb6ZvtStA==
Date: Tue, 19 May 2026 10:27:24 +0000
Message-ID:
 <8b3120f7302e591b2828cb77c5f903c84149d498.1779186401.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7526:EE_|DU4PR03MB11485:EE_
x-ms-office365-filtering-correlation-id: 9bdf3dec-df40-4831-f1d4-08deb59137f2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|42112799006|376014|11063799006|18002099003|56012099003|38070700021;
x-microsoft-antispam-message-info:
 2dYy9Xmo9B58lDIwXhtfG7RRHUKZqid2rIrwhaUt7IYj2CVCOMhsXkgYT3IfKabKI9m68LasKMHC5xZMrgs9OlQlLnTQztvwlCqsHgt9sAOxiNTWmQ2midSOKzHRXsnlF8soZmqZ96PzJY7R30FEQWvZaB7fP35D7DaShpN+O74P2Kmo2IxpXJP0bgAxBZCtCl2zjUyrT1vffzaawcOP85YdMnjcBmnhVB4tx2+SNHjfhICKM2Fbpi3aJJ1dwur7UjOzCP4d8BGNtaPqiwEeXfWQ4jykAGxfIZQj41ahV81uhxQtu0sUtygneSphxNlTCkLxNbFSlkUtj2WN+Nu+qz2cVLITOE7eQufZ/7sQJLAogFgifxTeybCUN722LFZfNjvNROingpvS1DJ9b7nWDfq49qleGZu6VTGO00fMjo8nm2N6U3KKGmK8NCW62AiiC/p8FiNYjT6bGmzrB4d5k37p7V9Fj5m1xQvkGwfaKEk0kc0CQ/XSuviV8hmKI3unKs7vvuyzNiaNNEvs7JHMD6WFmen8JbS3EMqxxB4SKlcSnBMHTbyAIo4jNLA1pyIc3JjVEx0UToLk5y5daOGh8U0D/tY1qoPnUk1xnv1uWS7vWOF+X0FgMiSGPHcEW3h+OGIUQvAcy6RdmtUjm4WlXxxfwEZitZjRJiKXkvgvsXiqF/tvcvlexNFeV9H3J0j52fMvbeQ1dzvFpKwk78CTsUJ2amao3Y8oqmmSj8ziPf0+e/NV04mMmBWU1SYF7oY5
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(42112799006)(376014)(11063799006)(18002099003)(56012099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?+MxB2WgXptJG8uhhxKAURgsRRLQQFdkrTCfbh9VHOkvWAyjGNMWbUvP5cR?=
 =?iso-8859-1?Q?yt2yZQhstAvhaqAsp2dsBR1JMFzpfpaPvnqj8gXiLT1vTEOoFL+y1yAf9a?=
 =?iso-8859-1?Q?0nZROg82+EpigGqJX+AuoNDtpmHzA7EtMp98QPs+1Ls3MXjWQ2dvTrNUhb?=
 =?iso-8859-1?Q?Q6HiuHpyVOH2pAvdmg80mHhyxs7cGzaNwQpZLo/NaHCD9QjSER6NDYFhKv?=
 =?iso-8859-1?Q?3vJYrMpqH4P2O6peBoRUWRRiDn8I8cTWfB4JDMNyyq2nA6ZEOwykiaMTw8?=
 =?iso-8859-1?Q?q0U2RukAwKSAqWPFDNdYCpNY4VL0IpKlkiDgzcHkCr8KLWm3tsMJJ2048S?=
 =?iso-8859-1?Q?+lP3yLKHpAjv/Se8Bi9lDgg6ceQHAkYJTCid3QlyaRoXBhebrRWIC4WWzB?=
 =?iso-8859-1?Q?S8fdVpymYSYWoo8qEw8+mxRPrwlJZTMTYgyBPxrjC9MvRuYDLONnnVb4p5?=
 =?iso-8859-1?Q?/0EJN+by6PgdUSIfecLuMlKx9t7RzTtmaU7gSupGjQi6GcKnun9t8APucg?=
 =?iso-8859-1?Q?u45ncqFSlrMcaWjx+0Dy6hqsKefduBdKlL+SRb/4+krO2jkVWbDS+eAT80?=
 =?iso-8859-1?Q?DlzXL7peo+gG3PMM04NS0qYFC4UAeTu/K34EYj5/0OciJ2EJIram7/izcT?=
 =?iso-8859-1?Q?/PM8JROfPEtigeuf6jm2jm+1U2Q55Fwl18cd/tilwZhYAv1q+UyZT6BQjt?=
 =?iso-8859-1?Q?tQs9PT0cvFlIdWHmgk3T26XnlY+mgzz36OjlBF6n9KsI27xH78rESwPGNF?=
 =?iso-8859-1?Q?5Tg9YF1kSzkDWqeHv4+Htriq3Wa876RvnVBIgkgBmJDZtMq9cE7WHsms57?=
 =?iso-8859-1?Q?brUKsC7nqkwdIkkBXEupph9ub1w3h3/BKtbasGWLeIBWLGhbexRBURArXS?=
 =?iso-8859-1?Q?a0pQsfBfU/lenFT5eHDWnQjYpggRg+fVHckNeJ1pHwigP8MNAOocPFOVAy?=
 =?iso-8859-1?Q?ct6YWYK8m+yP9H8vfBiHvEKo53fufgwU4andNAe+OSq2Hhc0r6npVQDK+a?=
 =?iso-8859-1?Q?0+7eSl80z008Tnr2DIxCX1Vk7wdp5Qib2mq84Xwa0F1skrGaTAmozHvplq?=
 =?iso-8859-1?Q?ObUuv5Iia2Xk8NOlzUeZCwbOw5qYw8qKG0j4btjEOnYvtSeqCuA5KcQvru?=
 =?iso-8859-1?Q?kB2H/Yng7lGhzKeEtaOnfTsDtu2pXexGYLgcqDunJfqUfadnyaxAF62mKt?=
 =?iso-8859-1?Q?1mOB/v7YjmPvJtTYAaAlw9JMOIrhg1wUDIezcdN/3qrV+Xmu9MQvYURIgt?=
 =?iso-8859-1?Q?H8F6fOoaYkAVSN1fgdDgiv76Bmj0sdSYz8cbrVukmEcS47b8KN0CoTNMNx?=
 =?iso-8859-1?Q?zAmAKUv5TblgKhTYrmBnsb44Dyt6aIf58Klx5uT3DAJi0Bv4+npYARafFI?=
 =?iso-8859-1?Q?wEw3vkhu+mUrSjFQ78eSJmbvzDuBQa288oPhHXaH6YjoLKwEBOvEJlQcW1?=
 =?iso-8859-1?Q?Q0JejMReBHZGjyvDu0TqqVrUTmUjho6UNf0e+lZlt0VX6elprw9dRGUZ0Q?=
 =?iso-8859-1?Q?nvlWK+EWNEhy8kq/Q4ghxAe407lIW6ZH7Plt6RaHiJgNfTgLOrK+gJsj8d?=
 =?iso-8859-1?Q?7WOhluY+RB+LnctnYcQcfyjpAE7HXNhVdd2fK4jZ64ExHHdZLoxc1mFJJ7?=
 =?iso-8859-1?Q?3YeRhh1x9IAT8XAOkOVy4hKmZZc1c//ySa1phXq8ZZsdLoWdgyS7bQw/AJ?=
 =?iso-8859-1?Q?dtXVKTH5iP0itXYEpa8O7eUPYSQ9BlYLBQxBuirkdiDrypufkUfqjHIp+V?=
 =?iso-8859-1?Q?mzypOFBH45OqKjP8W5fV9ZtUZ6/npcI68LLIe8Nhh5xBNJ9kX/CSLqtAjf?=
 =?iso-8859-1?Q?D1liWC07SyYlG/U6EML1MSTTBuYxYt8=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bdf3dec-df40-4831-f1d4-08deb59137f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2026 10:27:24.6165
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pr2gGYoKdI36LkQgthK373rtCRKHt8bIP7FfZbX3Sjl2AyGQXOpUrT8ptuFjva22/FNz5zV0f2Ka+Ig4bfb+ObBXvLaBd2qBurvDUnJtOyo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR03MB11485
X-purgate-ID: tlsNG-d25034/1779186448-E1360CF5-09C8955E/0/0
X-purgate-type: clean
X-purgate-size: 970

Move XEN_TARGET_ARCH export into the architecture selection
branches instead of exporting the variable before assignment.
This ensures the selected architecture value is correctly
propagated.

No functional changes.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
 automation/eclair_analysis/prepare.sh | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/automation/eclair_analysis/prepare.sh b/automation/eclair_anal=
ysis/prepare.sh
index e941e6edc4..fde83c2d2d 100755
--- a/automation/eclair_analysis/prepare.sh
+++ b/automation/eclair_analysis/prepare.sh
@@ -22,12 +22,10 @@ if [ $# -ne 1 ]; then
   exit 1
 fi
=20
-export XEN_TARGET_ARCH
-
 if [ "$1" =3D "X86_64" ]; then
-  XEN_TARGET_ARCH=3Dx86_64
+  export XEN_TARGET_ARCH=3Dx86_64
 elif [ "$1" =3D "ARM64" ]; then
-  XEN_TARGET_ARCH=3Darm64
+  export XEN_TARGET_ARCH=3Darm64
 else
   fatal "Unknown configuration: $1"
 fi
--=20
2.43.0

