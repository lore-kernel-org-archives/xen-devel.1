Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38A1606A338
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 23:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=ZOHB6qWx
Received: from list by lists.xenproject.org with outflank-mailman.1480471.1684370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQYwr-0007qA-85; Mon, 09 Nov 2026 23:38:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1480471.1684370; Mon, 09 Nov 2026 23:38:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQYwr-0007q3-5W; Mon, 09 Nov 2026 23:38:49 +0000
Received: by outflank-mailman (input) for mailman id 1480471;
 Mon, 09 Nov 2026 23:38:48 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Volodymyr_Babchuk@epam.com>) id 1xQYwq-0007pl-Aw
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 23:38:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQYwp-008ojk-GQ
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 00:38:47 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6af2594c-8faa-0a2a0a5109dd-0a2a4506901a-34
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 00:38:47 +0100
Received: from [52.101.65.142]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6af25986-195a-0a2a45060019-3465418eceb8-4
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 00:38:47 +0100
Received: from VE1PR03MB6078.eurprd03.prod.outlook.com (2603:10a6:803:113::29)
 by VI0PR03MB10567.eurprd03.prod.outlook.com (2603:10a6:800:209::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Mon, 9 Nov
 2026 23:38:44 +0000
Received: from VE1PR03MB6078.eurprd03.prod.outlook.com
 ([fe80::4722:b91:9b24:ee48]) by VE1PR03MB6078.eurprd03.prod.outlook.com
 ([fe80::4722:b91:9b24:ee48%4]) with mapi id 15.21.0592.009; Mon, 9 Nov 2026
 23:38:43 +0000
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
 b=Hzu5/F2Dulbond2Qm7ss47ExxGnkWNzsfTdb+Qcd0G/zlbn8pf6pKMJyWz7aUxTp/1lm27n6Uu51qf4mpBzaCMXqWFoegfK1L0U95605nTNeJufNlxRlwv6JpTvBj8UbQn8BanGPC/jhbcU8FLg41V7qxQft53XpRn+od7nIkZNgKRepHoUQiaxK5U6nT6elST6x3AmaL9gkKy6aDIDX/6Tp2pmxUU7oULiHa2MYZeOboeAJOZU4pPkAN+w9SOduHynUa/9i8Ybnx9HWD//yJLYfWHuot8AYY/SC3nY3jv2PN9sIWsJfIh/1yhRuhdU+he+tlUtgCBovUwXqFxA0+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i4cLwG16XlNpnDiz/wJYHhlpRGZpYfEKm9hcM0WWfs4=;
 b=CMhywG8pShtz2AxV8O34pe4e2IN+F1RmPOtxU2WQDaI+8k/PPWoNPgyYHpjCHj8gMIW52S7fHjC8FgVtGNI/Tb+dj/2hkVy1d/p+67V8Axyw2rZr68GvNQ7hKn6IhOeQtoes8x+TcCYLvjaCy332hxaNTXiQff6MyHb0VmsLKueTxLX5OYvGw8P2cb5O8sAXIfjkJ5pKvnUme6exvly3OBqFCPNuQ5thsrn7ThIREmOyCAxcyfvDgauyAjaaZdZjbSAbz43NDw6TSmMLV1SaLaMhTU5LaLgPTmz6p/tO3PmZkQvs05LWKd/lmZEVMsbW7mJU+DP0shAAknRLqkImDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i4cLwG16XlNpnDiz/wJYHhlpRGZpYfEKm9hcM0WWfs4=;
 b=ZOHB6qWxzi2nuAWkFb8ej16JSzu5mHylm3oNRjCIBvaM4vNw+0vEqxHnaOe1EQSvRuN7vHymti7Mx0dlODsaHnpAh4gAVxy39MYvM2CWfEiAsGMlGLz1V4ApnrwJWBP+EmnaJYOYj4nvUtl4c3KiYq4jTB2LIw55GDESxMYWNSiRHyxmI9mO4F9R6TMpbh0XrybZYh9k2G12VcKbQZDZbFFKsIbC+TK1aGmpnI5W944kSRwtZTfY1wwHi1qPm93K7qVpX9RgQ7CLpmXHuDtzddGl+ZYsI5xihFjotQcuu2pvCF89UyfeqVD6hhGYVwn+cZ5mY0ThqpFQtTsHZLHQtg==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger@xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v11 6/6] docs: Document CPU hotplug
Thread-Topic: [PATCH v11 6/6] docs: Document CPU hotplug
Thread-Index: AQHdcDtO8MUZhkc6jkm6vG/XjR44FQ==
Date: Mon, 9 Nov 2026 23:38:43 +0000
Message-ID: <87se19d18d.fsf@epam.com>
References: <cover.1794222015.git.mykyta_poturai@epam.com>
	<b29769962099a9d5ff14b879b87a588ed2e96665.1794222015.git.mykyta_poturai@epam.com>
In-Reply-To:
 <b29769962099a9d5ff14b879b87a588ed2e96665.1794222015.git.mykyta_poturai@epam.com>
	(Mykyta Poturai's message of "Mon, 9 Nov 2026 11:12:49 +0000")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: mu4e 1.14.3; emacs 30.2
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VE1PR03MB6078:EE_|VI0PR03MB10567:EE_
x-ms-office365-filtering-correlation-id: 7f1faca1-ee9c-4d10-fadb-08df3eba97a9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|42112799006|38070700021|261028144727099003|260925021311599003|260925021911599003|260925022911599003|4143699003|11063799006|261022105027099003|261021121427099003|56012099006|261022075727099003|261009223027099003|261026121527099003|261026140227099003|261102123227099003|10067099003|22082099003|18002099003|6133799003;
x-microsoft-antispam-message-info:
 uj+vU02H0SzHXDqN264N65pNqdAE5cHpGUxozwRnFMtc8vSZu+n8ElWOpiynLsaWm29wrhd8S15B6SHS1W8RyUtKri76QBHO1UCFl8nxaCD8dRoLrv8VgSmSq27mGP/AyBPlTRC1Qx3fWP/Pfpl9pdPklIb5yRRr0jOTFEmz/54GmsDKugOp3J/ZVJV880wlgWerFTKelPSoM4+6KN7d2UctWlsKkLgEI7fdWsYhdv6UMw6fY9SVnX3bH+jgQKuv3pPvweSrsCnbvC5gjmHC4LJWRKDmSRHemnTNtQp+ti9hEjQpt4Y0QG6BJUbbbKDsTR+LdH1Uk/xnjGoO/NgKV1/W0Cx9fNMO48esNkKH6O4lWSUwTYfrSBPvWLWxxOlYa+Uo+Iaiy47MYo1Epcqi/TY5tZiRwHDn94Wb6/9X30WJSQPKWQ5n4mEgB6NgejOtEYFJly9POW4jRvj5OU5L3o6ANG3076CvldUqPYiJ2CPNitaBA0LhkCVvj+af+t+ZhjGwMsF0vf4j6fLJlC3OqcaWiz8fJTqtjwYqGYsRe5pEApsK3QvdLrceC+NziEmji0jGbdAqqFCpY8FloKEO922cw2MAVDrI4FE4+hUimzZnuNBsctbZnf0X+sd/O+XTP1Qn5Ldub6XK8+NK9Urn06Y22UhJe5ZnpTXjdHWlpYGqm/k9gXVFlOdWAwWrlK5EPT+uD85kF6KBl6m+xabi0ALIhpl5uFeVECy9s7W+jek=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR03MB6078.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(42112799006)(38070700021)(261028144727099003)(260925021311599003)(260925021911599003)(260925022911599003)(4143699003)(11063799006)(261022105027099003)(261021121427099003)(56012099006)(261022075727099003)(261009223027099003)(261026121527099003)(261026140227099003)(261102123227099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?S1NyYkphOHB1RUxZaXhKVDFYOGE5ejNzNW14aWJSUEtEUHorMFpyQ09Tb3Ru?=
 =?utf-8?B?aWJQWWFhR3lCWng5Z2FTS05sM3R2aXc2c3hGenRpRUtCZ3RyQWxjNnNrM1Zv?=
 =?utf-8?B?QU1wblQ0ZUlIcGVHditBTnF4UlliQ0h6U2h1d094RVEvSHJTQkFLMUI0clNx?=
 =?utf-8?B?U1JUZkxFbkpHYVdSNmZYaU1mVzNIOHRQZ0ZWL2pSTlcra2JxMkN3ZXpYVmlN?=
 =?utf-8?B?bmJ3ZGNjekFXck1IcnE5SUtLL3RabkU4Vk1BRTk1Y3FVc3U3dVZtUTRuN2lE?=
 =?utf-8?B?eFBJZmg4dGhoTnlOcW1UQ3lnR2ZhT1kvdTRzZG9oN3o0ZU9yYzhOMjlFcXpM?=
 =?utf-8?B?dXcwQTF3dGRnNUoveWs5Z0lXYWdCYy84NGtaZ1hPQm9qVFk0eXpXTTBKUTJh?=
 =?utf-8?B?T0Z5UUVPV0Jla1BRRk1qK3RSSTN4MzBta3FYVHRia2FaUWxjWGdQaTMxQnY4?=
 =?utf-8?B?eFI0ZVczZzU3TFdvem9tWGRUYlZnQVh2SURrOVlTU3d1cklScUEvWWxXUVFV?=
 =?utf-8?B?ZGZpQ3JjckF6UmhsejExZDA1VWtuaW16RlNqQ0Q5aDFrbWIxNXpkRHlLSG9y?=
 =?utf-8?B?OHdacklmNW1DSjhIc0Z4clVzRUJ1MjcwOStKcThERWdxckpFNTFtaTVaL2dQ?=
 =?utf-8?B?N09YeTl2TmlsMHFobmhPVGVybGoya082TlFHM0hwYWgvd3N3YmxHVUc0RXpY?=
 =?utf-8?B?RkhSRjE5aUsxSVI1SlB1bGhrWFgyODhJelVwNW8yQWkvWGNLZXFlQnUvbTND?=
 =?utf-8?B?cjBSaklNU2dsQUpuMjliOGdRZzZ4aVhPSEFHYUVBSFhwRDJxNjJqSTBiOUdO?=
 =?utf-8?B?WE9vNmxtUC81Zy9BTlhLM2Z1UEJHOHZVazdOaEVLdGYvRnJ6RVkwbzZWM21N?=
 =?utf-8?B?OE1LVVV5TEliYjNaTUdMbkZteTBnZjFYa3lIOEpzclorTGppOVRTVVFaYkNp?=
 =?utf-8?B?aFJkRzQxNzFGYWRiTkFmbVpjSy9LNWI2YTJRd2dFb2lEREticmlISWsxb1Vz?=
 =?utf-8?B?NEZUd2piV2pFdXRNbVVjMDQ3MjVCZk8xZUxCT2RPbkh0MjlpUnlCRHRoTDJj?=
 =?utf-8?B?NGpwRUM3K3N2WnEya082aGM3TE9ZNHJyVjR6c2wwcmE5N1p4SXYvZDNrNjZZ?=
 =?utf-8?B?TURteTNaRlJqQzc0S1NQZzM5bzVKT1VyVXJNQzlSaitIVFIvR1JTS0x5dEYw?=
 =?utf-8?B?WTBwSXNVQjkvSmFyZ3F2bDA2dXhjT1g2T20vTHVOZHlraGFLN2hVR01wNzJs?=
 =?utf-8?B?Tmp0eld6RllWcDBmV0hiNURNNkl3MSthd1cwOE1uMVJSQXhRcnhUcFcvUXFx?=
 =?utf-8?B?Sks4cTZ4SCs2SEIzMTZUWVl3dUpiSjZEYUdqY2hkL1NJcFN6QzhwTEsvMUFC?=
 =?utf-8?B?S2M3REZlRUVnUjYrQlpvNXl4bjBWeDU3RkMyVC8rU1kxTXZZVnhzUXVzb2FI?=
 =?utf-8?B?TTVFeHkyTldqb0pjK09HdDhPV3JUdllLVCtXSmdBNWJYZjQ1VEFmYXRKTXNT?=
 =?utf-8?B?M0xiRHNjN0s0UXY1Y1pwaGVYZFkxSldMQVd0N1YwMWJIbnpwQlBHSFF6YVAz?=
 =?utf-8?B?Z1h3NEtxQS9wZm5XcGVueUdIQzZ6UFgxR1lNdElLV25PaTVEbnhnZ1pqWnZu?=
 =?utf-8?B?OVdlY2NpOXRGU1RXbnBpbGlRNXBjaWhBQ3g5WVR0bFRaY0NGTjV5b25FVlYx?=
 =?utf-8?B?SFBLaFo1aXA4QmZ3bitRenFEcmxZZitqOTRwVzZwWlpIcWFBUTFiVjJKbXdv?=
 =?utf-8?B?RXAxZjV6cnNvcTI1YUsyNERHRW40UDZBbkNxRS9VUHNkUDNHdkM2TUh2NFFr?=
 =?utf-8?B?TlVpb2FvS3A5OTdQdnYxSDVlREJZNHgwVkZPTDQwSXRXNlpFM3JjWVByLzAw?=
 =?utf-8?B?NlkrdGRrdEM3NWlWMkZhcFVjTHFpbG1RcDl2ajUxLzNZeHJJeVhQZkVEczd5?=
 =?utf-8?B?cVNObkpzZFJBNHpUMGRDaWllOW1KaXNPdnpzbHJodlZLSytRWEc4NW4yQysx?=
 =?utf-8?B?aHFpVE83TEFIS1kvMjZMeTJUeXlKNXhsQW93MXFHcEtEd0VXdHZwS0Z6SENk?=
 =?utf-8?B?L0tIVnNLWHhETnIxK1cxQkl5c2xNcHFDbGZhTCtpdlR2RWFrNkE3UHkzcU1o?=
 =?utf-8?B?ZzU1T1FJcGl1eStYZGF2VDFTcGF5aktRM05lK3loREJrZGVzS3NMYlU1YWFW?=
 =?utf-8?B?ZEhDc0YxV2FzZmJRTmZ4ZHVNcmdJRHRxcFZsOS9lY1NFK1loSWNteU1FZ0Nr?=
 =?utf-8?B?WmFWUnZHd3ZYN2VTeTBubHlHRWJ3MXBrMThNUTh1akZNbUNxbDZtdkNIZ1kw?=
 =?utf-8?B?b21NV2lrUzB4d3pHRlF3dE0wTjMrQkFpTHdCMVJXZlVVU3c2WUdjTlljWHdk?=
 =?utf-8?Q?hDBFoIV18badQIuQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6078.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f1faca1-ee9c-4d10-fadb-08df3eba97a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2026 23:38:43.8834
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5tQM7fpzY62VUWzuEFnJo34Qdj2koRz0FBh1ExUmrdadO6hdQn9okTLxRE4mhVgTbVicW3hlQNYu6flhJYI+Zup9TWgYlu5w0cSYr5Dbf+Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR03MB10567
X-purgate-ID: tlsNG-16d1c6/1794267527-FD00977B-0ECDB1BD/0/0
X-purgate-type: clean
X-purgate-size: 6636
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGksDQoNCk15a3l0YSBQb3R1cmFpIDxNeWt5dGFfUG90dXJhaUBlcGFtLmNvbT4gd3JpdGVzOg0K
DQo+IFNpZ25lZC1vZmYtYnk6IE15a3l0YSBQb3R1cmFpIDxteWt5dGFfcG90dXJhaUBlcGFtLmNv
bT4NCg0KUmV2aWV3ZWQtYnk6IFZvbG9keW15ciBCYWJjaHVrIDx2b2xvZHlteXJfYmFiY2h1a0Bl
cGFtLmNvbT4NCg0KPiAtLS0NCj4gdjEwLT52MTE6DQo+ICogc3luYyB3aXRoIGxhdGVzdCBjaGFu
Z2VzDQo+DQo+IHY5LT52MTA6DQo+ICogZXhwbGFpbiB0aGUgYWN0dWFsIElUUyBpbmNvbXBhdGli
aWxpdHkNCj4gKiBzYXkgRkZBIGFuZCBURUUgYXJlIGluY29tcGF0aWJsZSwgbWF0Y2hpbmcgdGhl
IEtjb25maWcgZGVwZW5kZW5jeQ0KPg0KPiB2OC0+djk6DQo+ICogbm8gY2hhbmdlcw0KPg0KPiB2
Ny0+djg6DQo+ICogcmVtb3ZlIHN1cHBvcnQgc3RhdHVzIHVwZGF0ZQ0KPiAqIHVwZGF0ZSBjb25m
aWcgb3B0aW9uIG5hbWUNCj4NCj4gdjYtPnY3Og0KPiAqIGFkZCB0ZXN0aW5nIGFuZCBsaW1pdGF0
aW9ucw0KPg0KPiB2NS0+djY6DQo+ICogbm8gY2hhbmdlcw0KPg0KPiB2NC0+djU6DQo+ICogcy9z
dXBwb3J0ZWQvaW1wbGVtZW50ZWQvDQo+ICogdXBkYXRlIFNVUFBPUlQubWQNCj4NCj4gdjMtPnY0
Og0KPiAqIHVwZGF0ZSBjb25maWd1cmF0aW9uIHNlY3Rpb24NCj4NCj4gdjItPnYzOg0KPiAqIHBh
dGNoIGludHJvZHVjZWQNCj4gLS0tDQo+ICBkb2NzL21pc2MvY3B1LWhvdHBsdWcudHh0IHwgMTAy
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMTAyIGluc2VydGlvbnMoKykNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkb2NzL21pc2MvY3B1
LWhvdHBsdWcudHh0DQo+DQo+IGRpZmYgLS1naXQgYS9kb2NzL21pc2MvY3B1LWhvdHBsdWcudHh0
IGIvZG9jcy9taXNjL2NwdS1ob3RwbHVnLnR4dA0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBp
bmRleCAwMDAwMDAwMDAwLi5lMWI0NzRjYTY5DQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvZG9j
cy9taXNjL2NwdS1ob3RwbHVnLnR4dA0KPiBAQCAtMCwwICsxLDEwMiBAQA0KPiArQ1BVIEhvdHBs
dWcNCj4gKz09PT09PT09PT09DQo+ICsNCj4gK0NQVSBob3RwbHVnIGlzIGEgZmVhdHVyZSB0aGF0
IGFsbG93cyBwQ1BVIGNvcmVzIHRvIGJlIGFkZGVkIHRvIG9yIHJlbW92ZWQgZnJvbSBhDQo+ICty
dW5uaW5nIHN5c3RlbSB3aXRob3V0IHJlcXVpcmluZyBhIHJlYm9vdC4gSXQgaXMgaW1wbGVtZW50
ZWQgb24geDg2IGFuZCBBcm02NA0KPiArYXJjaGl0ZWN0dXJlcy4NCj4gKw0KPiArSW1wbGVtZW50
YXRpb24gRGV0YWlscw0KPiArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiArDQo+ICtDUFUgaG90
cGx1ZyBpcyBpbXBsZW1lbnRlZCB0aHJvdWdoIHRoZSBgWEVOX1NZU0NUTF9DUFVfSE9UUExVR18q
YCBzeXNjdGwgY2FsbHMuDQo+ICtUaGUgc3BlY2lmaWMgY2FsbHMgYXJlOg0KPiArDQo+ICstIGBY
RU5fU1lTQ1RMX0NQVV9IT1RQTFVHX09OTElORWA6IEJyaW5ncyBhIHBDUFUgb25saW5lDQo+ICst
IGBYRU5fU1lTQ1RMX0NQVV9IT1RQTFVHX09GRkxJTkVgOiBUYWtlcyBhIHBDUFUgb2ZmbGluZQ0K
PiArLSBgWEVOX1NZU0NUTF9DUFVfSE9UUExVR19TTVRfRU5BQkxFYDogRW5hYmxlcyBTTVQgdGhy
ZWFkcyAoeDg2IG9ubHkpDQo+ICstIGBYRU5fU1lTQ1RMX0NQVV9IT1RQTFVHX1NNVF9ESVNBQkxF
YDogRGlzYWJsZXMgU01UIHRocmVhZHMgKHg4NiBvbmx5KQ0KPiArDQo+ICtBbGwgY29yZXMgY2Fu
IGJlIGRpc2FibGVkLCBhc3N1bWluZyBoYXJkd2FyZSBzdXBwb3J0LCBleGNlcHQgZm9yIHRoZSBi
b290IGNvcmUuDQo+ICtTeXNjdGwgY2FsbHMgYXJlIHJvdXRlZCB0byB0aGUgYm9vdCBjb3JlIGJl
Zm9yZSBkb2luZyBhbnkgYWN0dWFsIHVwL2Rvd24NCj4gK29wZXJhdGlvbnMgb24gb3RoZXIgY29y
ZXMuDQo+ICsNCj4gK0lmIHRoZXJlIGFyZSBYZW4tYm91bmQgaW50ZXJydXB0cyBwaW5uZWQgdG8g
dGhlIHBDUFUgYmVpbmcgb2ZmbGluZWQsIHRoZXkgd2lsbA0KPiArYmUgYXV0b21hdGljYWxseSBt
aWdyYXRlZCB0byBvdGhlciBvbmxpbmUgcENQVXMuIEludGVycnVwdHMgdXNlZCBieSBndWVzdA0K
PiArZG9tYWlucyBhcmUgaGFuZGxlZCBieSB0aGUgc2NoZWR1bGVyIHdoZW4gaXQgcmVzY2hlZHVs
ZXMgdGhlIHZDUFVzIHRvIGEgbmV3LA0KPiArb25saW5lLCBwQ1BVLiBXaGVuIGEgcENQVSBpcyBi
ZWluZyBvbmxpbmVkLCBzb21lIFhlbi1ib3VuZCBpbnRlcnJ1cHRzIHdpbGwgZ2V0DQo+ICtyZWRp
c3RyaWJ1dGVkIHRvIHRoZSBuZXdseSBvbmxpbmVkIHBDUFUgdG8gcHJldmVudCBpbWJhbGFuY2Uu
DQo+ICsNCj4gK0lmIHBDUFUgYmVpbmcgb2ZmbGluZWQgaGFzIHNvbWUgdkNQVXMgcGlubmVkIHRv
IGl0LCB0aGV5IHdpbGwgYmUgYXV0b21hdGljYWxseQ0KPiArdW5waW5uZWQgYW5kIG1pZ3JhdGVk
IHRvIG90aGVyIG9ubGluZSBwQ1BVcy4NCj4gKw0KPiArTGltaXRhdGlvbnMNCj4gKy0tLS0tLS0t
LS0tDQo+ICsNCj4gK09uIEFybTY0IGNwdSBob3RwbHVnIGlzIGN1cnJlbnRseSBub3QgY29tcGF0
aWJsZSB3aXRoIHRoZSBJVFM6IHRoZSBwZXItQ1BVIExQSQ0KPiArcGVuZGluZyB0YWJsZSBhbmQg
R0lDUl9DVExSLkVuYWJsZUxQSXMgYXJlIHNldCB1cCBvbmNlIGF0IGJvb3QgYW5kIGFyZSBub3QN
Cj4gK3JlLXVzYWJsZSwgc28gb25saW5pbmcgYSBwQ1BVIGEgc2Vjb25kIHRpbWUgZmFpbHMuDQo+
ICsNCj4gK09uIEFybTY0IGl0IGlzIGFsc28gbm90IGNvbXBhdGlibGUgd2l0aCB0aGUgRkZBIGFu
ZCBURUUgbWVkaWF0b3JzLCBhcyBib3RoIHVzZQ0KPiArbm9uLXN0YXRpYyBJUlEgYWN0aW9ucy4N
Cj4gKw0KPiArQ29uZmlndXJhdGlvbg0KPiArLS0tLS0tLS0tLS0tLQ0KPiArDQo+ICtDUFUgaG90
cGx1ZyBzdXBwb3J0IGluIFhlbiBpcyBjb250cm9sbGVkIGJ5IHRoZSBDT05GSUdfQ1BVX09OTElO
RV9PRkZMSU5FDQo+ICtLY29uZmlnIG9wdGlvbiwgd2hpY2ggcmVxdWlyZXMgRVhQRVJUIGFuZCBk
ZXBlbmRzIG9uIEhBU19DUFVfT05MSU5FX09GRkxJTkUuDQo+ICtIQVNfQ1BVX09OTElORV9PRkZM
SU5FIGlzIHNlbGVjdGVkIGJ5IHg4NiwgYW5kIGJ5IEFybTY0IHdoZW4gbmVpdGhlciBJVFMgbm9y
DQo+ICtURUUgc3VwcG9ydCBpcyBlbmFibGVkLiBUaGUgb3B0aW9uIGlzIGVuYWJsZWQgYnkgZGVm
YXVsdCBvbiB4ODYgYW5kIGRpc2FibGVkDQo+ICtieSBkZWZhdWx0IG9uIEFybTY0Lg0KPiArDQo+
ICtUaGUgeGVuLWhwdG9vbCB1c2Vyc3BhY2UgdG9vbCBpcyBidWlsdCB1bmNvbmRpdGlvbmFsbHku
DQo+ICsNCj4gK1VzYWdlDQo+ICstLS0tLQ0KPiArDQo+ICtEaXNhYmxlIGNvcmU6DQo+ICsNCj4g
KyQgeGVuLWhwdG9vbCBjcHUtb2ZmbGluZSAyDQo+ICtQcmVwYXJlIHRvIG9mZmxpbmUgQ1BVIDIN
Cj4gKyhYRU4pIFJlbW92aW5nIGNwdSAyIGZyb20gcnVucXVldWUgMA0KPiArQ1BVIDIgb2ZmbGlu
ZWQgc3VjY2Vzc2Z1bGx5DQo+ICsNCj4gK0VuYWJsZSBjb3JlOg0KPiArDQo+ICskIHhlbi1ocHRv
b2wgY3B1LW9ubGluZSAyDQo+ICtQcmVwYXJlIHRvIG9ubGluZSBDUFUgMg0KPiArKFhFTikgQnJp
bmdpbmcgdXAgQ1BVMg0KPiArKFhFTikgR0lDdjM6IENQVTI6IEZvdW5kIHJlZGlzdHJpYnV0b3Ig
aW4gcmVnaW9uIDAgQDAwMDAwYTAwNDAwNWMwMDANCj4gKyhYRU4pIENQVTI6IEd1ZXN0IGF0b21p
Y3Mgd2lsbCB0cnkgMSB0aW1lcyBiZWZvcmUgcGF1c2luZyB0aGUgZG9tYWluDQo+ICsoWEVOKSBD
UFUgMiBib290ZWQuDQo+ICsoWEVOKSBBZGRpbmcgY3B1IDIgdG8gcnVucXVldWUgMA0KPiArQ1BV
IDIgb25saW5lZCBzdWNjZXNzZnVsbHkNCj4gKw0KPiArRGlzYWJsaW5nIGEgY29yZSB3aXRoIHBp
bm5lZCB2Q1BVczoNCj4gKw0KPiArJCB4bCB2Y3B1LXBpbiAwIDMgMyAzDQo+ICskIHhsIHZjcHUt
cGluIDAgMiAzIDMNCj4gKyQgeGwgdmNwdS1waW4gMCAxIDMgMw0KPiArJCB4bCB2Y3B1LXBpbiAw
IDAgMyAzDQo+ICskIHhlbi1ocHRvb2wgY3B1LW9mZmxpbmUgMw0KPiArUHJlcGFyZSB0byBvZmZs
aW5lIENQVSAzDQo+ICsoWEVOKSBCcmVha2luZyBhZmZpbml0eSBmb3IgZDB2MA0KPiArKFhFTikg
QnJlYWtpbmcgYWZmaW5pdHkgZm9yIGQwdjENCj4gKyhYRU4pIEJyZWFraW5nIGFmZmluaXR5IGZv
ciBkMHYyDQo+ICsoWEVOKSBCcmVha2luZyBhZmZpbml0eSBmb3IgZDB2Mw0KPiArKFhFTikgUmVt
b3ZpbmcgY3B1IDMgZnJvbSBydW5xdWV1ZSAwDQo+ICtDUFUgMyBvZmZsaW5lZCBzdWNjZXNzZnVs
bHkNCj4gKw0KPiArVGVzdGluZw0KPiArLS0tLS0tLQ0KPiArDQo+ICtUaGUgQ1BVIGhvdHBsdWcg
ZmVhdHVyZSBoYXMgYmVlbiB0ZXN0ZWQgb24gYm90aCB4ODYgYW5kIEFybTY0IFFFTVUgc2V0dXBz
IGFuZCBvbg0KPiArUi1DYXIgR2VuNSAoQXJtNjQpIGhhcmR3YXJlLg0KPiArDQo+ICtUaGUgdGVz
dHMgaW5jbHVkZWQ6DQo+ICstIE9mZmxpbmluZyBhbmQgb25saW5pbmcgY29yZXMgd2l0aCBubyBw
aW5uZWQgdkNQVXMNCj4gKy0gT2ZmbGluaW5nIGNvcmVzIHdpdGggcGlubmVkIHZDUFVzDQo+ICst
IE9mZmxpbmluZyBjb3JlcyB3aXRoIFhlbi1ib3VuZCBpbnRlcnJ1cHRzDQo+ICstIE9mZmxpbmlu
ZyBhbGwgY29yZXMgZXhjZXB0IHRoZSBib290IGNvcmUNCj4gKy0gT2ZmbGluaW5nIHRoZSBib290
IGNvcmUgKGV4cGVjdGVkIHRvIGZhaWwpDQo+ICstIEVuYWJsaW5nIGFuZCBkaXNhYmxpbmcgU01U
IHRocmVhZHMgKHg4NiBvbmx5KQ0KPiArLSBPZmZsaW5pbmcgY29yZXMgdG8gd2hpY2ggZ3Vlc3Rz
IHdpdGggcGFzc3Rocm91Z2ggZGV2aWNlcyBhcmUgcGlubmVkDQoNCi0tIA0KV0JSLCBWb2xvZHlt
eXI=

