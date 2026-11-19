Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D25F606A32A
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 11:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=DtItM1VC
Received: from list by lists.xenproject.org with outflank-mailman.1496187.1694845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU0du-0005Cl-VN; Thu, 19 Nov 2026 11:49:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1496187.1694845; Thu, 19 Nov 2026 11:49:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU0du-0005Ce-SI; Thu, 19 Nov 2026 11:49:30 +0000
Received: by outflank-mailman (input) for mailman id 1496187;
 Thu, 19 Nov 2026 11:49:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1xU0dt-0005BR-07
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 11:49:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xU0ds-001iEh-C8
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 12:49:28 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6afee244-2eae-0a2a0a5409dd-0a2a450ca06e-34
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 12:49:28 +0100
Received: from [40.107.162.112]
 (helo=PA4PR04CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6afee248-f479-0a2a450c0019-286ba27081bc-3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 12:49:28 +0100
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by AS8PR03MB10037.eurprd03.prod.outlook.com (2603:10a6:20b:636::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 11:49:26 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%3]) with mapi id 15.21.0592.009; Thu, 19 Nov 2026
 11:49:26 +0000
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
 b=mMN0MNMG9vbgUEnSpTw64nttUp4yPLRknjJe5tDaGdpzHBCtFepiVFmh5IYmL1rYwBieg+f3mwx+7PYfhEB/96eCBsPuefkhYFZpLpE7TtUoGjn9E0I9RwB3ww99tAzgJhwgbFPs6AhywThDRTYrE/TOkWa1MFjjevyh7QUToKmIu0IhkuwJV1CHrTMK09PIuGZKDOqq/BqZT3vIkbK5GTQmZZZGY72Yglp7wmZenzHw1GJabps5c+7/s7/YUfpo1R2SR31qSPcoFASMfgDXdSBHjCC5DHu+WCBNlI1T/IgtjByBv4voRVsvh1Oc7fbgqkdHeL77cvZNlAkCgAgOLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K5FTm/tEl0dsiLJ0HktNmziadQe8K7eE7Ap4wcMwm8U=;
 b=hSS6rc5hJcDnVL17w6FJLKo5QrxrE1mFeoDBaQ0MpppEVm7DDdXvw6ZnHf7LOxqNX7uDrBB7t3VREww+EOr8pAT/ZLjMizsDegIq4gcCcjPHeccVxR4G0zgxewpgLOglrGxv0sdl9/D1dv/YL8cP7Y0LlU43DJwIIOCij2R0nZ9aiwKcGwW64KaSssC6rztCCuWUsVQ4zAcf+yrePIIkQ+8SoaFBV0LR+BYb22i7g1/M3el2pmNNb5q7O3vGs/4INVKR8ILNDYbzSPLCyu0rOb3H2URt/KKj47ERF+Mw3f04AQ6G5P2WUbG0BwwmZ5hLAtIki92b66XoTVCJj/Q3JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K5FTm/tEl0dsiLJ0HktNmziadQe8K7eE7Ap4wcMwm8U=;
 b=DtItM1VCBbS6ydL0IOhM2OiWJfBvKV+vt30Rwzdf89MndkVPWDYbakTxRkezXbfS9pNg6NtS2QxJYrnmfIbtOQXxAfmV5ydZkLwNKYR2WG8WNQUT+9ktwPY/ldimImE6HczUohFi8NuwxgQPHP0PcZHBbnJLMe6vcQgdwku4+NKgSTEGoKK8Cik752KntwXxhj9tp3/R5YDP7ommBPZXC+MuCeCnnONwJVKEwqqj+z6BvgMzw2OD/MLBtKKHX9lE3a/1bRW0x3AReH0acgs3gd9QTU/5p0BhM5hnH5SbNvnMl5B8s6bN9Ku8yzf4/j/nIkRD5RJ0U3GS8NXTuR5Fgw==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2] xen/arm: deviate MISRA R11.8 for capability enable
 callbacks
Thread-Topic: [PATCH v2] xen/arm: deviate MISRA R11.8 for capability enable
 callbacks
Thread-Index: AQHdeBwHGnVyHQGpAEaDepxzc/WbYw==
Date: Thu, 19 Nov 2026 11:49:26 +0000
Message-ID:
 <0b4cc099f7bafa3b5a6e44179b415856e6164096.1795088572.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7526:EE_|AS8PR03MB10037:EE_
x-ms-office365-filtering-correlation-id: c9634285-0e86-445f-8efa-08df4633297e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|42112799006|38070700021|10067099003|11063799006|56012099006|261022105027099003|261021121427099003|261026140227099003|261026121527099003|261028144727099003|261102123227099003|261009223027099003|18002099003|6133799003|3023799007;
x-microsoft-antispam-message-info:
 PxiFnuENh8nT/+opVqI69C31fBwRbQWQg2VmPJURK53FqjPeE6/xPik38aiSEY2vb3IN6Hw83QTgBDjDBi9AaDNcoadIwt8p3fkuDVbXq53780iKFyBQWxJTTp/s7O8BAZo6LlZe9i/A2nMmE3h35o0843inKYgYzeQLve4NFqH+Puxgyi3E25CvANRqSQxg2p6Ycl4E9IFeXop+e8U0v4iTzpxDRb56fdi4s67CRwE751OYeSDt3XWvwnNBDauIC661EOWXxUTrfLez3HXLmK9SOGH+aHxKEPi2N1RKaI3P50IsORTEKuwtkgWvcoQe7H7J5CGYZhZ6AnRKC05781d1lCy/g80AIHg/+KV7/hf/kafjuhjhP5Y/HZWCJd7LunWxlA/kROyhjpsVnMaXOy9B0JFDZ9rCBFh5ZoiGiOAxJ9n9V2FhL/wN42cTUCTDUPeK3kffXPoGYRT6/SdbPtxET0FONIBAPRLy1SBbul5MDlr+AWhdVb5QtGekG8tQw74W+kfgWOpUQUrThEoAZQwojevc/GaGKH3RoFafQQeaZtkJAuzHrdwOlsaGoD9xr+vCH6rhbHhfVFT1OI/K4WBbrveIkTXTJqtzIJdO47Ht5DHv804evLQ2YLHHvsBugmi3whwNaMgMB0CrWoN4CACl234fVsS6SzaMrRfvh5cEYO4DYh31JAsqSoNn7TB7MuU149ya8iN3dd3DUddu8+Mg7cLsXnahoE02G49y1mY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(42112799006)(38070700021)(10067099003)(11063799006)(56012099006)(261022105027099003)(261021121427099003)(261026140227099003)(261026121527099003)(261028144727099003)(261102123227099003)(261009223027099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?d3d4cEZEWUR3MDA5OUpVdE5HQ2hTVWlQUHhkdUVSd3lYeEVpcFJBR0FvL25W?=
 =?utf-8?B?ZjNRZThhZXhNRXpqejJoVWo5TUl3aXhscmlTU3FpUVdKWGVuMk9tY2lyVi8x?=
 =?utf-8?B?eXlORjB0TEwzYyt0aHNyNkhVdEQ1K3Q0eEdIeHBmcGQ3cStsSnRiUzl1RFM0?=
 =?utf-8?B?RHV6Rmxocis3S0NYcXJoZ2QzRjhWS1hrNTh3VW5Td24xZEZnUGUrUloyaFps?=
 =?utf-8?B?OEhWYm9tZU01aHZVQ3FDVUdST2c2Yk9xRDI1R3dTcWlSanBUbFA0dFUycDhm?=
 =?utf-8?B?T1RPTGU5OFVrNXF4RXJOYjZXUUx0RUZIN1FQaE15eVNpZVpGZGk2NUprajdk?=
 =?utf-8?B?Ymk3c1A1YW9uRUFwbDArVTZSZjJiMk5OMTdhUHVsdTI1ZmQyQnZMK2M0Q3Jn?=
 =?utf-8?B?VlFaVGlqdkZnZVNxUHNYQnZJelc1Y0Y4K3hiMWJ1NUgxU01LSytkQkVzeGsw?=
 =?utf-8?B?RjRlYlVlekhZSlUrYVZmOXFYWnM3MlFTTWIrNXQ1Wm9abU52Z1p5RWhLMktm?=
 =?utf-8?B?VGR2RDRJZCtTMW53RE5uaGlVam9Ra1NpR2pWVDFqOU52Zlk0VE0vRHorVnVF?=
 =?utf-8?B?cEc0QzJ1T2NIMi9CM3kremI3alQ5KzZuUGFEUDRhbDNaQjZlUjZRMEJUeVhn?=
 =?utf-8?B?TllBVkNlT3EvSWgxSURCc2l1RTcxU3FtbXdUcVZxa3JzS1llVHEvOG9mZkhw?=
 =?utf-8?B?aXhmMVF1bFpsOWVrYUFJd0pqRzJ6SHhVTHhSZGRTY0tQaFU0SDBlS2NTMG4x?=
 =?utf-8?B?YzBJYURmT29tOTZIb09lQitWaXlBSmxPTXpTc013RUhTWGY4ZTN6OFpWS2lQ?=
 =?utf-8?B?NXF3NXl4T1VwOUdUanoxZzVCeTZYWmI0MGhtbjdYUWUvMFdELzIxZXRmc3lG?=
 =?utf-8?B?N000RE1WZldZdzA3ZUdkNWFxc2FHUE9saUpCck0ybTBxUDE0a0k0MEYvekQx?=
 =?utf-8?B?RE5XQ3RyNWhCZnpKUW1qYlpaenM0MVB0NWxLaWFpSUZjM1ZUanFqN1IrcDJI?=
 =?utf-8?B?b21lSGpLU0FSdnNEaVFpdWMwOHZtVzZaMDBXU2JOTzlyVHhzZWtwZ1F5UFlm?=
 =?utf-8?B?aTlSdXFxd3R1cXJrWlUvQndZM3pJNWdyRFNDNTZwdHNKQU1DMnF4Tk40N2dz?=
 =?utf-8?B?V1dENDJhYTRKK05rQlIrUHpvcWpBelJlcjJESE9EazV2Y21vdGJEa2ZwRjlC?=
 =?utf-8?B?MnduQlFyUTIrTnpTSnNtblAyOWl4Z3MzV25BZWFZQ3JiRHRwWUh3bmJnSFBT?=
 =?utf-8?B?OGZOWHQzNlAzVTFPUUZvQzl0dDJRY1RvaW9zMDhNZDQrOEFHR3g3YVRjY3NS?=
 =?utf-8?B?N1NyWmd6RVhrWHB4eURMemxLZnVMWFl6N0tnUHBaUER1c2tmNytaVkg1d3FK?=
 =?utf-8?B?NFNKVVNrWjl2cDB2SUNDUWlvemlLaENSL2x4QVQvdmxuaytuVWRCTzZscUNa?=
 =?utf-8?B?STdBTm10Sy8xZFlBZ05OKzU3VEtMWlZ2U21Wemg2L011OWZ5eHRQbThvd1lF?=
 =?utf-8?B?TU0yYlU4VEx1U0lVNlROdTcvc1RLZGtZRU9ZcTdGVkVsTUtBYUJadGxSK3VG?=
 =?utf-8?B?WU9tclBNTHkvSjJQU0xNYmVlVlZycFhwNGVUSklkaTRnem9LNitaWDJzcWkz?=
 =?utf-8?B?MlAweERYM0ZGRXE2QU9ZbzVFcXQreStxUXByTThMVWdUbTlPZTRJeGpRb1VO?=
 =?utf-8?B?dnZDd1h1OXgzaWNLUGNaci9OYm9KSFhzMGxicWFKVEJEUDFjemtNb3h1cTM0?=
 =?utf-8?B?anBjb0ZBNGJmUXJNcmxwNUdSaWlJYWVFdGxtd3hTajdvaXdHR1JIeFJoSnp3?=
 =?utf-8?B?anpUZG1jV2JXZ2p0aXBxZ3NpQlNrSzcyNFgrU1JNK0tkL252WmdEeks3bUk0?=
 =?utf-8?B?aS9QYi93K2ptN2NVWFpVOVFFN2xjbitydzYyb3VHbGF2LzdnUisyZURtanVk?=
 =?utf-8?B?clhEZGQ5ZlJXN0hSdVlpLzhDc29pdFF2ZUV0a2FTV3lSK3NTSVdhMlZTc1Rj?=
 =?utf-8?B?VngxaWd1bWpXQnpPRDJBR0k1Z0laQVJtbUY1QXppY1FjbUVNVWQzWWRuaURV?=
 =?utf-8?B?bWhZd0Q2QmxGSHdKVTZXN1VhSmorbTdOSG5rTXdIekxDa21hVU50YkNHVk9u?=
 =?utf-8?B?YUJwMHVJdUU3YU0vc3JHaSt6cFNkYlVYekNKSjF3ME05SnhtbFREU1AvK0tQ?=
 =?utf-8?B?Y1BZVmc2Y1VWSHJvZnJ3T0FpY2tZTjNDa0JaSDhxa29BRVY3eC9sUWE3cUpR?=
 =?utf-8?B?RUxTM1pVcFZPYUhKbkNPanJoZUdyT3pFNkV1cXN0dEQvamZ2MjYvRVE2S3Iw?=
 =?utf-8?B?NkJaRU96Ykh6WEtEOE83Y1hhbDBKcFJxSGpKSWV1MTd2OEdmWXZFWWk3YlRI?=
 =?utf-8?Q?ClKp4yqukOypVdiI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9634285-0e86-445f-8efa-08df4633297e
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2026 11:49:26.3284
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3BAG8sHpfZ6JjISVWBX4a+bUbp4d9kVRgknHJ29/JKd5Pq0BOAH/XMbk3oXb4cgq+JzcfdlGPexmet0tdqXP0GZ4bUDbyc1kaMSCJjXJ3q8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB10037
X-purgate-ID: tlsNG-d25034/1795088968-77ED2A5B-BCA62CF6/0/0
X-purgate-type: clean
X-purgate-size: 3588
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

TUlTUkEgQyBSdWxlIDExLjggZm9yYmlkcyBjYXN0cyB0aGF0IHJlbW92ZSB0aGUgY29uc3QgcXVh
bGlmaWVyIGZyb20NCnRoZSBwb2ludGVkLXRvIHR5cGUuIGVuYWJsZV9jcHVfY2FwYWJpbGl0aWVz
KCkgYW5kDQplbmFibGVfbm9uYm9vdF9jcHVfY2FwcygpIGNhc3QgYSBjb25zdCBzdHJ1Y3QgYXJt
X2NwdV9jYXBhYmlsaXRpZXMNCnBvaW50ZXIgdG8gdm9pZCAqIHNvIHRoYXQgaXQgY2FuIGJlIHBh
c3NlZCB0byB0aGUgY2FwYWJpbGl0eSBlbmFibGUNCmNhbGxiYWNrLCBlaXRoZXIgZGlyZWN0bHkg
b3IgdGhyb3VnaCBzdG9wX21hY2hpbmVfcnVuKCkuDQoNClRoZSBjYWxsYmFjayB0eXBlIHRha2Vz
IHZvaWQgKiBieSBjb252ZW50aW9uLiBFeGlzdGluZyBjYWxsYmFjaw0KaW1wbGVtZW50YXRpb25z
IHRyZWF0IHRoZSBwb2ludGVyIGFzIGNvbnN0IGFuZCBkbyBub3QgbW9kaWZ5IHRoZQ0Kb2JqZWN0
LiBEb2N1bWVudCBib3RoIGNhc3RzIHdpdGggU0FGLTE1LXNhZmUgY29tbWVudC4NCg0KTm8gZnVu
Y3Rpb25hbCBjaGFuZ2VzLg0KDQpTaWduZWQtb2ZmLWJ5OiBEbXl0cm8gUHJva29wY2h1ayA8ZG15
dHJvX3Byb2tvcGNodWsxQGVwYW0uY29tPg0KLS0tDQpDaGFuZ2VzIGluIHYyOg0KLSBtYWtlIFNB
Ri0xNSBnZW5lcmljIGZvciBjYXN0aW5nIGEgY29uc3QgcG9pbnRlciB0byB2b2lkICogZm9yIGEN
CiAgY2FsbGJhY2ssIG5vdCBBcm0gY2FwcyBvbmx5DQotLS0NCiBkb2NzL21pc3JhL3NhZmUuanNv
biAgICAgIHwgOCArKysrKysrKw0KIHhlbi9hcmNoL2FybS9jcHVmZWF0dXJlLmMgfCAyICsrDQog
MiBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspDQoNCmRpZmYgLS1naXQgYS9kb2NzL21p
c3JhL3NhZmUuanNvbiBiL2RvY3MvbWlzcmEvc2FmZS5qc29uDQppbmRleCAzNTg0Y2I5MGM2Li44
NWEyZjMxNjkyIDEwMDY0NA0KLS0tIGEvZG9jcy9taXNyYS9zYWZlLmpzb24NCisrKyBiL2RvY3Mv
bWlzcmEvc2FmZS5qc29uDQpAQCAtMTI0LDYgKzEyNCwxNCBAQA0KICAgICAgICAgfSwNCiAgICAg
ICAgIHsNCiAgICAgICAgICAgICAiaWQiOiAiU0FGLTE1LXNhZmUiLA0KKyAgICAgICAgICAgICJh
bmFseXNlciI6IHsNCisgICAgICAgICAgICAgICAgImVjbGFpciI6ICJNQzNBMi5SMTEuOCINCisg
ICAgICAgICAgICB9LA0KKyAgICAgICAgICAgICJuYW1lIjogIlJ1bGUgMTEuODogY2FzdCBjb25z
dCBwb2ludGVyIHRvIHZvaWQgKiBmb3IgYSBjYWxsYmFjayIsDQorICAgICAgICAgICAgInRleHQi
OiAiQ2FsbGJhY2tzIG9mdGVuIGhhdmUgdm9pZCAqIHBhcmFtZXRlcnMsIHRvIGJlIHR5cGUtZ2Vu
ZXJpYy4gQ2FzdGluZyBhIGNvbnN0LXF1YWxpZmllZCBwb2ludGVyIHRvIHZvaWQgKiBvbmx5IHRv
IHBhc3MgaXQgaW50byBzdWNoIGEgc2lnbmF0dXJlIGlzIHNhZmUgd2hlbiB0aGUgY2FsbGJhY2sg
aW1wbGVtZW50YXRpb24gdHJlYXQgdGhlIHBvaW50ZXIgYXMgY29uc3QgYW5kIGRvIG5vdCBtb2Rp
ZnkgdGhlIG9iamVjdC4iDQorICAgICAgICB9LA0KKyAgICAgICAgew0KKyAgICAgICAgICAgICJp
ZCI6ICJTQUYtMTYtc2FmZSIsDQogICAgICAgICAgICAgImFuYWx5c2VyIjoge30sDQogICAgICAg
ICAgICAgIm5hbWUiOiAiU2VudGluZWwiLA0KICAgICAgICAgICAgICJ0ZXh0IjogIk5leHQgSUQg
dG8gYmUgdXNlZCINCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vY3B1ZmVhdHVyZS5jIGIveGVu
L2FyY2gvYXJtL2NwdWZlYXR1cmUuYw0KaW5kZXggOGQ4Y2QxOWE5Ni4uN2RiMGY4ZGNkYiAxMDA2
NDQNCi0tLSBhL3hlbi9hcmNoL2FybS9jcHVmZWF0dXJlLmMNCisrKyBiL3hlbi9hcmNoL2FybS9j
cHVmZWF0dXJlLmMNCkBAIC03Miw2ICs3Miw3IEBAIHZvaWQgX19pbml0IGVuYWJsZV9jcHVfY2Fw
YWJpbGl0aWVzKGNvbnN0IHN0cnVjdCBhcm1fY3B1X2NhcGFiaWxpdGllcyAqY2FwcykNCiAgICAg
ICAgICAgICAgKiBhbiBJUEksIGdpdmluZyB1cyBhIFBTVEFURSB0aGF0IGRpc2FwcGVhcnMgd2hl
biB3ZQ0KICAgICAgICAgICAgICAqIHJldHVybi4NCiAgICAgICAgICAgICAgKi8NCisgICAgICAg
ICAgICAvKiBTQUYtMTUtc2FmZSBSMTEuOCBjYXN0IGNvbnN0IHBvaW50ZXIgdG8gdm9pZCAqIGZv
ciBhIGNhbGxiYWNrICovDQogICAgICAgICAgICAgcmV0ID0gc3RvcF9tYWNoaW5lX3J1bihjYXBz
LT5lbmFibGUsICh2b2lkICopY2FwcywgTlJfQ1BVUyk7DQogICAgICAgICAgICAgLyogc3RvcF9t
YWNoaW5lX3J1biBzaG91bGQgbmV2ZXIgZmFpbCBhdCB0aGlzIHN0YWdlIG9mIHRoZSBib290LiAq
Lw0KICAgICAgICAgICAgIEJVR19PTihyZXQpOw0KQEAgLTEwOCw2ICsxMDksNyBAQCBpbnQgZW5h
YmxlX25vbmJvb3RfY3B1X2NhcHMoY29uc3Qgc3RydWN0IGFybV9jcHVfY2FwYWJpbGl0aWVzICpj
YXBzKQ0KIA0KICAgICAgICAgaWYgKCBjYXBzLT5lbmFibGUgKQ0KICAgICAgICAgew0KKyAgICAg
ICAgICAgIC8qIFNBRi0xNS1zYWZlIFIxMS44IGNhc3QgY29uc3QgcG9pbnRlciB0byB2b2lkICog
Zm9yIGEgY2FsbGJhY2sgKi8NCiAgICAgICAgICAgICBpbnQgcmV0ID0gY2Fwcy0+ZW5hYmxlKCh2
b2lkICopY2Fwcyk7DQogDQogICAgICAgICAgICAgaWYgKCByZXQgKQ0KLS0gDQoyLjQzLjANCg==

