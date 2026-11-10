Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053C4606A321
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 09:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=I3zbsP9F
Received: from list by lists.xenproject.org with outflank-mailman.1481418.1685283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQidL-0002Ya-Fo; Tue, 10 Nov 2026 09:59:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1481418.1685283; Tue, 10 Nov 2026 09:59:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQidL-0002YT-CQ; Tue, 10 Nov 2026 09:59:19 +0000
Received: by outflank-mailman (input) for mailman id 1481418;
 Tue, 10 Nov 2026 09:59:18 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1xQidK-0002YJ-Qe
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 09:59:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQidK-00AWiE-2t
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 10:59:18 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6af2eaee-2eae-0a2a0a5409dd-0a2a4504c440-34
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 10:59:17 +0100
Received: from [52.101.72.113]
 (helo=AM0PR02CU008.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6af2eaf5-b57f-0a2a45040019-346548712fab-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 10:59:17 +0100
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by AS8PR03MB7906.eurprd03.prod.outlook.com (2603:10a6:20b:421::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Tue, 10 Nov
 2026 09:59:14 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%3]) with mapi id 15.21.0592.009; Tue, 10 Nov 2026
 09:59:14 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a8l61o9hpx3EliHDyqi+xcCPwJzXmNb9A7y0nuUBAkHQZA3zZl4z/QdPT+J0ZK7FqnGEXzxa14iXQLAf6oG7x3HJ8VQKhhNEbAp5M4oeqWYuvTP6x14J0Y8QxFoO7SfO6S378PZ1wuLhgQ27vdTtWAfNG6RpgQHkOisN1mcXviDnU6HFz29PU+Xp16hFCr0jam2NNLxkY48q+ZwBD5tEqIdodSALt+ZADYLsJcmZOhpHwgL6ed0TSHPaO/nUF6tClnr9B202ESuXAH4iBBPgXJJPeshRNTv7SThGZAQYJflQ90BEjPdCGE6dIhR64yuqn8urhuiU1UZjcEO1cSdIdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VyDvllBXRPxQSfWQLbgsaxP6xURaC1wpiaByY+WHwbU=;
 b=c3KJXzNSAjXz0ymguTXPdYv+rqdIw07pwD47gTYeOZZ9F6szU5KiQNYaPq0AWyJ3mL8WgbNFoMTXKw1YxBu1TJ9/GK9fY+GMB7ufeWr4WRiQ5KCrtF9myd9LbrQKscCjH3k+9hVhU1qFKRdkEseqEeuGScebb1YMqHvn8eh5wlt1L6Z22vtDBYoifaAmHnl5jKlqgQbKvieESfdhxxefyhIM17p+yayYgn9PDkW4nk43tcYX+NRqp8rebBlnAwJ9w3KbM+bADLAV39QbjRGl9DHWo1eW+LyOXIeAjpWXU2Xcm1v+Bew3gX26ahuWwnajsFahd4i2NugysQSMHV1AAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VyDvllBXRPxQSfWQLbgsaxP6xURaC1wpiaByY+WHwbU=;
 b=I3zbsP9Fd3lk2iOOPVTq1MeMhmMMzx910bttV8RFk9WMqaWMo38olwY26NGLVxk8z0ooILcgLbzz9AS+YM5EOn+kfBbQXmOdpTNIJ2bu60El59eofpyn4u+5ey/siFK81eGSjjL8Xo8oMlYmH52yj06KfuBW3RO4sPej1vS7xfAaaKLBwa2ETCPDmH9Y2JT45sFsRv3zB1aSJ+8bwxqbJDUkHM/J9vWrGyb6Du88bUc19mBkc/2bPkg42XxNHQerwQEOtR/eJ2ECsqRLpmDdtMJxmxqugFQW9e4/DveGkqJtxxVFoVdu9IJFvgt0uWzO3sLLyv9whVCpIGGd0LTErA==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Dario Faggioli
	<dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>, George Dunlap
	<gwd@xenproject.org>
Subject: [PATCH] xen/sched: resolve MISRA R18.3 pointer comparison
Thread-Topic: [PATCH] xen/sched: resolve MISRA R18.3 pointer comparison
Thread-Index: AQHdcPokuddABcs0aEGWzDRXWlu8ug==
Date: Tue, 10 Nov 2026 09:59:14 +0000
Message-ID:
 <696c419c0f41bab22a02cff418eb78ce55ec5667.1794303077.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7526:EE_|AS8PR03MB7906:EE_
x-ms-office365-filtering-correlation-id: 6b509270-0374-4ea4-644d-08df3f1146da
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|376014|366016|23010399003|1800799024|10067099003|18002099003|38070700021|56012099006|11063799006|261021121427099003|261021123027099003|261102123227099003|261009223027099003|260925022911599003|261026121527099003|260925021311599003|260925021911599003;
x-microsoft-antispam-message-info:
 ogQ/Ha0IYY7ZKYSKWhx+GnO3kYw94w7NETEWo2dsQxACsbe4Y8wpoQx3eziLf2slpeN6hlbhAxsD3nJFYDyi+aIwvTDwDputHj631Hy/NODBnP2E6cbeATasTvIRjoL3j9Oj+Lzxo2uJT6cuycjWATRbKg0D0inijw6pGL7iqJ0UXNPal7mMpfBoECxn0ZqazQ1XYkNFkMW4RKTwgfivdvsmY8t09LRL5pZFGBLrsBM5hwzWHVPHjVfnwBfiInbAS8fsw1FUZUla9XRbf4D7kPxvmvnHbL6Ci+MIUrBkX9ZqvINjqBXG+CFpgMFT5/R/SMtRZFhnrA19E7zBecm8TI7pv4bzWYRCCEO5gfiekGeWH6VTw7s0kYMK0DMZcAkS9jAyYnoUZzAC1UJFlw3FuEUFtrIDsXBHxn3tHW+1Xsq585y2oAL2COUmxCMjYpXn2gfD5f+vguFmuabzbMXjxubKKctjt6/Q8FTefF5FwpAwq9YYrQefpdL32z0mkoLiYkZW8NnhxPN7xyIN2ba0oqITSnHi2E8BLF/T0/VFD7NFewWfTo8/r9PSFy2LOFIVUqF7zD1r9EP/YqJPMqiaty7Agh7tFoEyXszeUEiCX0XMMkDk/c9txYUcxZYyB2by2oQ05FWFXlVJ8fczYvD2Ipv5Xm4k2Ks4KZrC3NN4o68MMOXVDoThDpIRXY3YI6O+J1LkqzbxNQspArcvv39kFFDVjqkSZXn+rmqsS1yxdb8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(376014)(366016)(23010399003)(1800799024)(10067099003)(18002099003)(38070700021)(56012099006)(11063799006)(261021121427099003)(261021123027099003)(261102123227099003)(261009223027099003)(260925022911599003)(261026121527099003)(260925021311599003)(260925021911599003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?S2swUGxyblVmR3M3YVo1SGRJQWxzT2ZyMkp0ZnM2MklrOVVCNkZCclpVT21Q?=
 =?utf-8?B?SThFY2FncEtsYXdIWDlJZGU5MEk3cEQvSVE3VVM0WFJyMVhZNW9LK1VPaFU2?=
 =?utf-8?B?SkZQYXlIclF0Q1lnZGtKRWlZdXVlelRPMXpoUFlyV09qNW54bWEzV09BRCsx?=
 =?utf-8?B?MUJxNm5RT1gzcmJSeEt3anpWUmk5a2w5U3ZZMmdGUFRwNVhjQjdITzdIWmdD?=
 =?utf-8?B?Y2RiM01Qa1VXOGU0VC9LSUYrd1krMWlKdmR3dFIwaHZKTTlWN21HOUNKSXE1?=
 =?utf-8?B?SXRyTkp6aE5NaWxPbW9GMEhKRzd6VW5iL0lhNndjWW5LdGl1cmRHWjgzR3ZW?=
 =?utf-8?B?MTBzOTY0QldrcXV4QUtoM08ralBZU2VpRVM2YW5sKzB5dGNCTWxFZVM1ZHBw?=
 =?utf-8?B?OGZVd0lobmsxZExxTVJhaUx6clg0MGFFcVc5WlZZa3B6UmRXYzVsVVQ2aENZ?=
 =?utf-8?B?KzBBUHdhSkNxSDNOZjZmQjNNQjFPa0FCVGZja1duKzZwSVhCZXp2bCtFMkJF?=
 =?utf-8?B?bm5vSUZZSnhqK1FHL2daODZaRkRkNlhwdmxOdXVzTG5CR3c0QWUxN2FWQkVh?=
 =?utf-8?B?ZUt3dXBlb2ZWNXB0TzRPVE5xMldFN3YxNUdSaUdvNEEyKzNpQnNCVTBXS3cz?=
 =?utf-8?B?Q204cGkxb1VuUXJONXBqNkxIVGxKK0JQWmVSQ0JPVDhpb1QweTk2UTBoVGh0?=
 =?utf-8?B?ZllsOGNPZU5mUjVDQkVYcUx6bVloN0FKbWp3VGFVUFhla2RZL0gzektjelll?=
 =?utf-8?B?SUxrVDh5MmVMcUlpZ0R0ak5TRk5XV2VyRElnWkNtMzlsVVlWbHp3ZnE5eDdj?=
 =?utf-8?B?S2F1WVplNmdEeGpPUnFsNzVlRjNCcDRCMTZtc29tV29RRjJVRkdtNEQyY1Mw?=
 =?utf-8?B?OHlxNVBzaVNpRjRXWTVOK1lJbFo0OGF3RVYyTUxZNXg2WjV6UUlFQlR1bEgx?=
 =?utf-8?B?bGZrNm44SnJ6b3IyZGlheWRPUjUwUkNHUjB0YVgrZ3FwV1NKZUVUcDVSUFoy?=
 =?utf-8?B?bW9ldG85bHNSR000ZlY2K2dGKzN6cjRFblFjbzNrWVh3cVBqMk81dFlKYmlj?=
 =?utf-8?B?U3VXK1VEUkpTT0NpUGo3b25aUUFkQ09VUHE0aGcvem9yK2ZSckp6SXJSbDFR?=
 =?utf-8?B?aWt6by83VFF6dlN6b0liWk5Td040bGJuTTdxS2h5Q0FOejNSWktPYU40NmUv?=
 =?utf-8?B?dEVsd2l1YS9oU2NQREdOaTdhSFhWWm9OVHBGUzYwUTB0WE9yRmZ4Umlqd0NF?=
 =?utf-8?B?TmkzNUMwNmFSMXdJOW94THV6Q1RseHBWM1VLbnNVU0FuWEtQeDJLT2liMnFZ?=
 =?utf-8?B?TmtZYWUvVCsxdHMzeEhXMnJrOTlQY1Z6TDE2ZElrYWp5b2hicWpCNUhjOXl3?=
 =?utf-8?B?UFAwVCtpaElzcy9mWCtPekUyV3BHRFRDTU1XcUtuSE93T3NmTG4yVW9acWgw?=
 =?utf-8?B?WkRmekljL0lzNDFERHRRQ2lwSUY5Slhxb0gzcHpZV1B4dThyUXhjeUtOR0NH?=
 =?utf-8?B?cUtQWHRRclFpWExDRmU4cGtNNWRwc0k4YTlSbVQ3UzFVMVkxcVdrTjdFdXdy?=
 =?utf-8?B?K09uV3RrSVAvK1hTL0xwYjR5bC9Fblh1M2UyQTRrQkx0RDBFWWFEQWVYRlJI?=
 =?utf-8?B?ZGQ0MDIvdkVZcWJyQ21iZnZHWEdXL3hQcnBad3dFTngxMkpTVXpYR3doQjVZ?=
 =?utf-8?B?R25xSTNzY2lWVDVReXI3eWpGZmVBZTBiWXpPc3J6NjVaclNmV0UreGFEOCtY?=
 =?utf-8?B?VGhuWkZkTGMwMXBmRlpyYm9QSGRZZU1XVjQ3QWdxTUJsL0dZWEVzM2UvRXlp?=
 =?utf-8?B?NWhXS0NHUkhqTzVXelBkVE15ak5wdTNYNDg3K2YxYVAvQVRNQVI3L1p0eDJq?=
 =?utf-8?B?N21pbDcxMnZ0UGtOcjJnVUZXSmQ1WWRqOWNUM3NRMVd5ZmIyN3ZGblRjR1k3?=
 =?utf-8?B?czg1TmxpdHN2RlRkWW1yekdsTVNCSXpiRDRHdENVVVdFSlEwS01YdndmT3ZS?=
 =?utf-8?B?TG9CQmJvV25KaS9QSHk1RE85dEtOY3hNRXhieEQvVkx2R1lHRHd1UnFrcWxP?=
 =?utf-8?B?Tm0xRnF4YUZCMmlFbStNdElhMk5PekIwVW0rN0ZjL3VoOVdjaG9uSEk2cy9z?=
 =?utf-8?B?cXhvZzJwMnJzUFNNUkdSUmRsbmY3U3QyT3dhNG5MazFaRGFOU1NYSHkvb1Zt?=
 =?utf-8?B?NFo0VU1sSjdmcWIzUFgvRldkYW4xdEVJMmREMlRncU5ITHhyVjVnNlg0Smpy?=
 =?utf-8?B?UXZRaWNVdmVxREo0UFIvcHpKbkxpbW9xY3piOTBrNDU3OEdWanVPWnI0UnVy?=
 =?utf-8?B?bWxrUWZXNVduRXhVVlA3cHdpMExFN0czMTBSQUJJMmhGMEtSSlhLMUJBVHh6?=
 =?utf-8?Q?OHI2dcV8R8E3lBc0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b509270-0374-4ea4-644d-08df3f1146da
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2026 09:59:14.5380
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X9SLmJCFGkdoC21SPgA02y3aOdRIjAUWNYCrYoQzdWNFvWG+IgGjLv0/yJK4PdQ7bvtQCnMJGZ0RZgNC76bzgg9hh416R+gIY9R8511rtXE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7906
X-purgate-ID: tlsNG-ebf023/1794304757-52ECEB50-98376F0B/0/0
X-purgate-type: clean
X-purgate-size: 1984
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

TUlTUkEgQyBSdWxlIDE4LjMgc3RhdGVzOiAiVGhlIHJlbGF0aW9uYWwgb3BlcmF0b3JzID4sID49
LCA8IGFuZCA8PQ0Kc2hhbGwgbm90IGJlIGFwcGxpZWQgdG8gb2JqZWN0cyBvZiBwb2ludGVyIHR5
cGUgZXhjZXB0IHdoZXJlIHRoZXkNCnBvaW50IGludG8gdGhlIHNhbWUgb2JqZWN0Ii4NCg0Kc2No
ZWRfc3Bpbl9sb2NrX2RvdWJsZSgpIHRha2VzIHRoZSBsb2NrIGF0IHRoZSBsb3dlciBhZGRyZXNz
IGZpcnN0Lg0KVGhlIHR3byBzcGlubG9ja190IHBvaW50ZXJzIGFyZSBub3QgcmVxdWlyZWQgdG8g
cG9pbnQgaW50byB0aGUgc2FtZQ0Kb2JqZWN0LCBzbyBjb21wYXJlIHRoZSBhZGRyZXNzZXMgYXMg
aW50ZWdlcnMuDQoNCnVuc2lnbmVkIGxvbmcgaXMgdGhlIHJpZ2h0IGludGVnZXIgdHlwZSBoZXJl
LiBJdCBpcyBwb2ludGVyLXNpemVkIG9uDQpldmVyeSBhcmNoaXRlY3R1cmUgWGVuIHN1cHBvcnRz
LCBzbyB0aGUgY2FzdCBrZWVwcyB0aGUgZnVsbCBhZGRyZXNzLA0KYW5kIGFuIHVuc2lnbmVkIGNv
bXBhcmlzb24gc3RpbGwgbWVhbnMgImxvd2VyIGFkZHJlc3MgZmlyc3QiLiBBIHNpZ25lZA0KbG9u
ZyB3b3VsZCBpbnRlcnByZXQgYW4gYWRkcmVzcyB3aXRoIHRoZSBoaWdoIGJpdCBzZXQgYXMgbmVn
YXRpdmUsIHNvDQp0aGUgb3JkZXIgd291bGQgbm8gbG9uZ2VyIGZvbGxvdyB0aGF0IHJ1bGUuDQoN
Ck5vIGZ1bmN0aW9uYWwgY2hhbmdlLg0KDQpTaWduZWQtb2ZmLWJ5OiBEbXl0cm8gUHJva29wY2h1
ayA8ZG15dHJvX3Byb2tvcGNodWsxQGVwYW0uY29tPg0KLS0tDQpUZXN0IENJIHBpcGVsaW5lOg0K
aHR0cHM6Ly9naXRsYWIuY29tL3hlbi1wcm9qZWN0L3Blb3BsZS9kaW1hcHJrcDRrL3hlbi8tL3Bp
cGVsaW5lcy8zMDQ4ODAxOTQ1DQotLS0NCiB4ZW4vY29tbW9uL3NjaGVkL2NvcmUuYyB8IDIgKy0N
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCg0KZGlmZiAt
LWdpdCBhL3hlbi9jb21tb24vc2NoZWQvY29yZS5jIGIveGVuL2NvbW1vbi9zY2hlZC9jb3JlLmMN
CmluZGV4IDg4YWU0MGY5NTQuLjEwYjZlZWNjY2QgMTAwNjQ0DQotLS0gYS94ZW4vY29tbW9uL3Nj
aGVkL2NvcmUuYw0KKysrIGIveGVuL2NvbW1vbi9zY2hlZC9jb3JlLmMNCkBAIC0zNzcsNyArMzc3
LDcgQEAgc3RhdGljIGFsd2F5c19pbmxpbmUgdm9pZCBzY2hlZF9zcGluX2xvY2tfZG91YmxlKA0K
ICAgICB7DQogICAgICAgICAqZmxhZ3MgPSBfc3Bpbl9sb2NrX2lycXNhdmUobG9jazEpOw0KICAg
ICB9DQotICAgIGVsc2UgaWYgKCBsb2NrMSA8IGxvY2syICkNCisgICAgZWxzZSBpZiAoICh1bnNp
Z25lZCBsb25nKWxvY2sxIDwgKHVuc2lnbmVkIGxvbmcpbG9jazIgKQ0KICAgICB7DQogICAgICAg
ICAqZmxhZ3MgPSBfc3Bpbl9sb2NrX2lycXNhdmUobG9jazEpOw0KICAgICAgICAgX3NwaW5fbG9j
ayhsb2NrMik7DQotLSANCjIuNDMuMA0K

