Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0DF606A321
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2026 11:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=cx9xcBhJ
Received: from list by lists.xenproject.org with outflank-mailman.1502123.1698116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWB6F-0000gL-QG; Wed, 25 Nov 2026 11:23:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1502123.1698116; Wed, 25 Nov 2026 11:23:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWB6F-0000gE-NI; Wed, 25 Nov 2026 11:23:43 +0000
Received: by outflank-mailman (input) for mailman id 1502123;
 Wed, 25 Nov 2026 11:23:42 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1xWB6E-0000g0-CC
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 11:23:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWB6D-00CmIa-P3
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 12:23:41 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6b06c525-2eae-0a2a0a5409dd-0a2a450abdc6-48
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 12:23:41 +0100
Received: from [52.101.69.74]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6b06c53d-f2d2-0a2a450a0019-3465454a232b-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 12:23:41 +0100
Received: from AS2PR03MB9076.eurprd03.prod.outlook.com (2603:10a6:20b:5fb::5)
 by DB3PR03MB10190.eurprd03.prod.outlook.com (2603:10a6:10:429::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Wed, 25 Nov
 2026 11:23:38 +0000
Received: from AS2PR03MB9076.eurprd03.prod.outlook.com
 ([fe80::bfe6:8f84:2f09:349c]) by AS2PR03MB9076.eurprd03.prod.outlook.com
 ([fe80::bfe6:8f84:2f09:349c%3]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 11:23:38 +0000
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
 b=mVWj396F5lGUamMVDaKPqvnjU3pxNOBFYGbU7u0y57ixXKSkKNQfG+JeNnSiwkKspryeDo/dCkTxbPm5VcMgW+MUb3tXFBfGWX2gVmRARGBijOS7OBsdQueutIOVYYC7pXhaJmtZxLGyBuFl3do51iHK0QJD/CSGCg1ctTMtJD0EXoSdVORHo9eq3U43mI0CHcLh9d5Pr/iXvqQgRbWphNCp8FR410P7aD55xbvf5b5EISAYNadOnoABCv0ugRiy+t/9yfJcnCKvXDCXGdPNzcIWBvshtB5f22dWH+letyhNGSPcWudLf4BYUhenZCVyc7Ia4hhec+LwcKrs1YRJfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v+cVqBTAnXwyXS+zxCYI/DEC88b1jE5trSOxQFEKFzk=;
 b=dy9O2FG4TUKSqqv5jKxliMACYmnVkUM8C2MV84+k+BQYG1UDaNJLlq0vK5q+iz5zmf6cWF2N6BM/qqr+JTQxV5XkO+zSWM2UxXvR/HdyBYoWSzoP1fyV1+ysAszCSaOUBexExOD/96G3ePKQOcTht03ILXsDmApVn4H0SupJj2av47xbpj8sFqGy12Be6jqrIeW0P/q27pgvynvOl/kJPqOVF0+0KrrYLM18y6VnBgBBLKEZwb8y3NPORBFqVM9qeXPWZR5bLNE6FvPXLHM4LsqEiMSKfpFMtifg1GvBwXWrgFAjqj0aZksu75u/grGl3ZkCW1nrWUaP3crGD7feRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v+cVqBTAnXwyXS+zxCYI/DEC88b1jE5trSOxQFEKFzk=;
 b=cx9xcBhJ1MEsZdVFUlo/0XrfAs4Qz9n1XEA2T21ShaXdsOCxWSKWXEPySS+QHmiMHEwYGoZYg2byHkZVNTdKfo/Op7i4GEZuh6bCJtLCG23HXyWvCshI0t51TbdkN10StfZTjHa6tbWOuyLCRBPnfmnetog+nm+0ty07kG/V0CtlRErZC72HRQ/dK7uYWF7v2026XYi5f3/pCHhHIqk5lrYMGcLkN/FS3xaZ2UheU75zfXuOS0Y3NiHRg0x3S4IsViA4/33wHwZT3mjf6WY+1IR0OS+vNVdLer2rQChf2hZ0j0bg1ap58l/rKijZzaeDX3L74+HYkGRl7LLvDBQVgQ==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger@xenproject.org>, Stewart
 Hildebrand <stewart.hildebrand@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Oleksii
 Kurochko <oleksii.kurochko@gmail.com>, Community Manager
	<community.manager@xenproject.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger@xenproject.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v5 0/5] Implement SR-IOV support for PVH
Thread-Topic: [PATCH v5 0/5] Implement SR-IOV support for PVH
Thread-Index: AQHdfM9rxhAvHtXtfkCPKDTfe/L7xg==
Date: Wed, 25 Nov 2026 11:23:38 +0000
Message-ID: <cover.1795603723.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB9076:EE_|DB3PR03MB10190:EE_
x-ms-office365-filtering-correlation-id: e56a45f1-990c-4176-ec79-08df4ae68d90
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|366016|6133799003|18002099003|260925021311599003|260925021911599003|261022105027099003|261028144727099003|261021121427099003|261026121527099003|11063799006|261102123227099003|261009223027099003|261102130727099003|261022075727099003|261021123027099003|56012099006|38070700021|10067099003|261026140227099003|260925022911599003;
x-microsoft-antispam-message-info:
 UpDKUP/La8jYb8W67bbbPEXoKuIoKbKoxbKP2FB24LxEV+dr+JH/IsS2B5owucAGeFpS56AmwbIbvciecNKS8QOdkiimf1jHx6sAUmOEHklsIhROZvfTbyVkFgDoMfaMcF5//0E338okOUg65P6gadKsQBfhkeUP2yfGM6FS+oGaGvmbZIi71lB1fMlmYSHvoXqF7m8PxL+FTIpR60Ucv2JGFCWxJSEtS2xcslAstxJf9sqrmLfC2AzhTIo80+Cl/G+BQhMxXbqWvt7TrUYDt6Byt1cRvivY6wzIiEhJGUyH8Vvfdz3pbHcZ5OaxrFcW36iVUaH3WP4E732G+BWv+cxYYhotW5uelfib1DLIr2eGikfrVmrwNarCN3ATsPgNSRzLBRCxwB1rJFU/kUjmL4/B0dxDByYhSVtL9YNkLZ32OmAsRq5ArGZ+oUjnnbrUU4Ftkp9BcdfLHukIehGmDjxbnIs1VSsffAcVIbtpdt0eZANkj4nn262rJ/7+FFCt847pDafwkApmfzZOFkhRYjoukNjZtLNP8L/YylYO5m3QyJNtb9vvcI1zWKuUMfQpAgP+fRY+DQ7enQwLacMuAmn4YXkHDDw2oJqAj0cRb2cANGhXcCz42uJGxYwJGRSSIy2EjK/BjBEN6hC76bWYJKvIc7RGRWSgGyojhvqm9qY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9076.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(366016)(6133799003)(18002099003)(260925021311599003)(260925021911599003)(261022105027099003)(261028144727099003)(261021121427099003)(261026121527099003)(11063799006)(261102123227099003)(261009223027099003)(261102130727099003)(261022075727099003)(261021123027099003)(56012099006)(38070700021)(10067099003)(261026140227099003)(260925022911599003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Z2NUT1BXV0JYVllZWDErWFo4V1AycGZkTFloOFVVeitlWStPRFNsMzNrTWVF?=
 =?utf-8?B?OEx1RXI3eEZSSVNMbTRWUXgyOGg0dlptZGpsSS95a3dRUllyeWhiZTJFejJt?=
 =?utf-8?B?M1YvWXRhQzlNY2puYlVMU09PQ2xSNFhSak5ITVhaUmFadkNkMFdNTSswZnB1?=
 =?utf-8?B?enNCd0E0MzNUVmt6elZhRW4rOUxNK1ozMW9kL0lBcXYxelZWRUdMOEMrQnVt?=
 =?utf-8?B?NUVNUEQ3RE9DZCtCU3hJQUtYOUJFVEtveWhvcW9HNCtmTTMxM1UrYTh3bUht?=
 =?utf-8?B?djk5b21ISkJPT3FFcXpBOGI3cWpVeTRJZ1JORzB5a256RHlvNkZBV3lHRHd2?=
 =?utf-8?B?alFYbnJGQlF1aG5PM2JLQytMU0k4RTdVdzRjSUliNU52STRoRnBKM0pWeTFF?=
 =?utf-8?B?d0FBU0ZKSEtWdlEwc2tXd3RnZUcvS3ZoMkd3Z0pjUWhqOHdkbGVRVXpQTHls?=
 =?utf-8?B?NThLaktNM0c2OTNobm8zb3ZKa1Z0b1J6QmZyVHRoV3dpZ1BwZW9ENDd4a3V4?=
 =?utf-8?B?Q0hoMmJNU0ZFaEQwNzUxYXFpdmtXMXBoMVNIbHZ4Q0JENjVGbUZBOTVJemR6?=
 =?utf-8?B?UW5vSHR4amRYTXNMbDA4eW1wVENQVlhaN2ZzZ1UxQ2dncVZGV2xjWFJCb2g0?=
 =?utf-8?B?VE5Ua2NBUVBFM0hMZU5mRGxjSFhNK1Q0dCtJR1U5bjh0bXdBUlZ2ZDRRM0FH?=
 =?utf-8?B?TWpTdWNFSmwyT21qSmVVQXpVQzhVMTIraW5Ua1ZPMFFacWp2QTU4dGlUNkxz?=
 =?utf-8?B?cUtlKytsdlBlcHFEOCtDWE5uWGU3eXRHRmdCanpnZjFBb0V0UzZZMVpHNUky?=
 =?utf-8?B?WVNueUZCRnB6Szg1bUVTU1d1b1NTM2syRG15MlZuS0hFSlBvMEJoalRGYVRs?=
 =?utf-8?B?YjhlWkoyTy8yZmh3SkpMUnlvbS9zS0dnVnJPRnJ5V2xEai9lWFowNGprODdX?=
 =?utf-8?B?dnREbSt3ZWVqS3lwTjVqYUh4OStaTTBqczhpbFVMcUd2Yjh3c1ppdjcvMm1S?=
 =?utf-8?B?Qk9PMytvZmhhR0x1Z25PS0Z3eWw1SEFwQVB5VjVCK2NyZ1F3NnpXaytmRm9Q?=
 =?utf-8?B?OWo2d0M2cWlmY2EyS0wwYlpoSldVS0ZiL1Q5SVk3clVFeCt0VFZGK0FKVytR?=
 =?utf-8?B?MURJL01VU3FLTEpyVkFBT1pNWk8wYWJGWm55UDlRcUdjNDNaTHVlbXhtRGds?=
 =?utf-8?B?MnpjT2N5Sis1Y1VKNVhqNHNSWnFZbzRtMFRqM1VDeERyNjE5UVd6bCtzenBK?=
 =?utf-8?B?ZnJNV0dJT1JJTTV5dCtQUzQ3VWRscWdraGJqbE44NlBZZWtVZWMvWWM5cUlZ?=
 =?utf-8?B?WkJEOXM4TmZTMUZER1ExZHJTS1p2T0UwYVlyL0tERFh6ZXVoN1Y4WWRyRjZT?=
 =?utf-8?B?WDZNQ293OWMxNVNyR1JUdTNTNXY2QW5VVXM1anZHdkI0OHovdXFqZDJiRFk4?=
 =?utf-8?B?OUNMV0hETVJBak1Mdm1Ca2kvM1dVc3dLSlpyT0ppamFDQUpRMVp4YTQwbWsx?=
 =?utf-8?B?OHB1Z1NUUk9xTEtIQjBhbEY5US9EWlJKTm10UkR6aXFMRldpNFJkZTd5cGp1?=
 =?utf-8?B?OEtldzJZMExwelhpSmRldnlkZFRlbUV1REt1U2RpRGJHcUNSdjFCQU1rK0F1?=
 =?utf-8?B?cTVnVjQzdEtHMHMwMDVPVGNJTG8vU0FJbi9SdmQxTGkzbFhtMW9HbXg4Y2xH?=
 =?utf-8?B?Wkh5VUZYbUliandKeFlGQ1JIcG13WGxNTWR1WmlCWUN0aDU1bFg3T3o2RFNN?=
 =?utf-8?B?QTdDZG50bDFERXRwOHN0R2l2K2h2WGJMQVdoalljVXVWUW9mejBveXVwSUhO?=
 =?utf-8?B?b3VXQVhuVU1STjBqSXdxZG5YblpIbkhBNlF3OWdRTUxjWjh2U2R0ZUtlQndI?=
 =?utf-8?B?N0VhUThQeHJJTGo5WjM1Q2ZFRVZybHRqemsxSTlNSVcvbzFsVEZGVkJpcTB1?=
 =?utf-8?B?b3RNKzZ0N2o0aUcvcDhNTW5xQStGbjU1OXZ6MVV6MkNRUnBuSkFvTWh1QkRi?=
 =?utf-8?B?MXBqbndYVC9ic3UwL3RUVFpKNGRHKzRrYTQ5cnVWc3dLUkE1NnJUUnZhM2tp?=
 =?utf-8?B?d0FiNlJSb09xV2FDSnUxSm5SZjNoMFprM2k0YUdVYnNqbDZmaXZNZFNFc0lE?=
 =?utf-8?B?ZExUNGtUNEZnM2tWNlcvRjZmWUxxRlZ0Q25CK3JBdzFHWU05YnZ4T1ltL09I?=
 =?utf-8?B?TWg3MFo1bjBEZHlINnpjMS9aKy90TU9oTXREa0k3UE5INXV1RDBvYVBsSHBZ?=
 =?utf-8?B?Ti9DUXl2NlRwbXV0MktWRTMrOXZmRUNFTE95eHZEWHQvUVI4WU1RVzRGRnNz?=
 =?utf-8?B?Uk4xQjhOV1FDc1VLYkR1LzhIRmg4QW9WNTlRRFFlVWVKdkFYZ3pjZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <071F746422C7B14A94B0E340C54DD5FB@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9076.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e56a45f1-990c-4176-ec79-08df4ae68d90
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2026 11:23:38.7362
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RuOGxU1TQVAocyayVZbmq1d6qbvcB5naiyUjiTKuyP0unbmYr2oRua2FKjjZnDEs+DoYQCiDMVIYnZbxZpdjYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR03MB10190
X-purgate-ID: tlsNG-4011c0/1795605821-4B4D7CFC-35A4525F/0/0
X-purgate-type: clean
X-purgate-size: 3914
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhpcyBzZXJpZXMgZW5hYmxlcyBzdXBwb3J0IGZvciBQQ0kgU1ItSU9WIGNhcGFiaWxpdHkgZm9y
IFBWSCBkb21haW5zLg0KSXQgYWxsb3dzIERvbTAgdG8gZW5hYmxlIGFuZCB1c2UgU1ItSU9WIHZp
cnR1YWwgZnVuY3Rpb25zIGFuZCBmb3IgdGhlc2UNCmZ1bmN0aW9ucyB0byBiZSBwYXNzZWQgdG8g
Z3Vlc3RzLg0KDQpUbyBhY2hpZXZlIHRoaXMsIGFkZCBoYW5kbGVycyBmb3IgU1JJT1ZfQ09OVFJP
TCByZWdpc3RlcnMgYW5kIHNpbXBsaWZpZWQNCmhhbmRsZXJzIGZvciBWRiBoZWFkZXJzLiBEb20w
IGVuYWJsZXMgU1ItSU9WOyBYZW4gdGhlbiBkaXNjb3ZlcnMgdGhlIFZGcw0KaXRzZWxmLCB0ZXJt
aW5hdGluZyBjb25maWcgc3BhY2UgYWNjZXNzZXMgdG8gdGhlbSBmb3IgMTAwbXMgYXMgdGhlIHNw
ZWMNCnBlcm1pdHMsIGFuZCBhZGRpbmcgZWFjaCBWRiBvbiB0aGUgZmlyc3QgYWNjZXNzIHBhc3Qg
dGhhdCB3aW5kb3cuIE5vDQpoeXBlcmNhbGwgZnJvbSBkb20wIGlzIGludm9sdmVkLg0KDQpDb3Jl
IGZ1bmN0aW9uYWxpdHkgaXMgYmFzZWQgb24gcHJldmlvdXMgd29ya1sxXS4NCg0KVGVzdGVkIG9u
IFItQ2FyIFNwaWRlciBib2FyZCB3aXRoIFNhbXN1bmcgTlZNZSBTU0QgQ29udHJvbGxlciA5ODAg
YW5kIEludGVsDQpYNTUwVCBldGhlcm5ldCBjYXJkLg0KDQpbMV06IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL3hlbi1kZXZlbC8yMDE4MDcxNzA5NDgzMC41NDgwNi0xLXJvZ2VyLnBhdUBjaXRyaXgu
Y29tLw0KDQp2NC0+djU6DQoqIHJlLWNoZWNrIHBlbmRpbmcgVkZzIHVuZGVyIHBjaWRldnNfbG9j
aygpDQoqIGtlZXAgUEhZU0RFVk9QX3BjaV9kZXZpY2VfYWRkIHdvcmtpbmcgZm9yIFZGcyBvbiBQ
ViBkb20wDQoqIGdhdGUgdGhlIFNSLUlPViBjYXBhYmlsaXR5IG9uIHRoZSBoYXJkd2FyZSBkb21h
aW4gaW5zdGVhZCBvZiBYU00NCiogZHJvcCB0aGUgY2xhc3MvcmV2aXNpb24gaGFuZGxlciBmcm9t
IHRoZSBEb21VIHBhdGNoDQoqIHNlZSBpbmRpdmlkdWFsIHBhdGNoZXMNCg0KdjMtPnY0Og0KKiBy
ZXdvcmsgdGhlIHNlcmllcyBmb3IgVkYgZGlzY292ZXJ5IGluIFhlbg0KKiBzcXVhc2ggZXhwb3J0
IHBhdGNoZXMNCiogZHJvcCAidnBjaTogVXNlIHBlcnZjcHUgcmFuZ2VzIGZvciBCQVIgbWFwcGlu
ZyI7IHJhbmdlc2V0cyBhcmUgbm93DQogIGFsbG9jYXRlZCBwZXIgbWFwcGluZyB0YXNrDQoqIHNw
bGl0IHRoZSBub24tZnVuY3Rpb25hbCBjaHVybiBpbnRvICJ2cGNpOiB1c2UgYSBsb2NhbCB2YXJp
YWJsZSBmb3INCiAgdGhlIEJBUiByYW5nZXNldCINCiogZm9sZCB0aGUgZG9jdW1lbnRhdGlvbiBw
YXRjaCBpbnRvICJhZGQgU1ItSU9WIHN1cHBvcnQgZm9yIFBWSCBEb20wIg0KKiBzZWUgaW5kaXZp
ZHVhbCBwYXRjaGVzDQoNCnYyLT52MzoNCiogcmV3b3JrIHRoZSBzZXJpZXMgZm9yIFZGIGRpc2Nv
dmVyeSBieSBEb20wDQoqIGRyb3AgcGNpL2lvbW11OiBDaGVjayB0aGF0IElPTU1VIHN1cHBvcnRz
IHJlbW92aW5nIGRldmljZXMsIHNlZSBbMl0NCiogZHJvcCB2cGNpOiBhZGQgYSB3YWl0IG9wZXJh
dGlvbiB0byB0aGUgdnBjaSB2Y3B1IHBlbmRpbmcgYWN0aW9ucw0KKiBhZGQgdnBjaTogYWxsb3cg
cXVldWVpbmcgb2YgbWFwcGluZyBvcGVyYXRpb25zDQoqIG1pbm9yIGNoYW5nZXMgaW4gaW5kaXZp
ZHVhbCBwYXRjaGVzDQoNClsyXTogaHR0cHM6Ly9wYXRjaGV3Lm9yZy9YZW4vYTU5YzJkYTBkNGM3
MmRlYjQyOTUwZTlhOGUzOTgyZmJkZWU2MDY2OC4xNzc1NTU1NzY2LmdpdC5teWt5dGEuXzVGcG90
dXJhaUBlcGFtLmNvbS8NCnYxLT52MjoNCiogcmV3b3JrIHRoZSBzZXJpZXMgZm9yIFZGIGRpc2Nv
dmVyeSBpbiBYZW4NCiogc2VwYXJhdGUgZG9jIGNoYW5nZXMgaW50byB0aGUgbGFzdCBwYXRjaA0K
DQpNeWt5dGEgUG90dXJhaSAoMSk6DQogIHZwY2k6IHVzZSBhIGxvY2FsIHZhcmlhYmxlIGZvciB0
aGUgQkFSIHJhbmdlc2V0DQoNClN0ZXdhcnQgSGlsZGVicmFuZCAoNCk6DQogIHZwY2k6IEV4cG9y
dCBmdW5jdGlvbnMgcmVxdWlyZWQgZm9yIFNSLUlPViBzdXBwb3J0DQogIHZwY2k6IGFsbG93IHF1
ZXVlaW5nIG9mIG1hcHBpbmcgb3BlcmF0aW9ucw0KICB2cGNpOiBhZGQgU1ItSU9WIHN1cHBvcnQg
Zm9yIFBWSCBEb20wDQogIHZwY2k6IGFkZCBTUi1JT1Ygc3VwcG9ydCBmb3IgRG9tVXMNCg0KIENI
QU5HRUxPRy5tZCAgICAgICAgICAgICAgICAgIHwgICAyICsNCiBTVVBQT1JULm1kICAgICAgICAg
ICAgICAgICAgICB8ICAgMiAtDQogdG9vbHMvdGVzdHMvdnBjaS9lbXVsLmggICAgICAgfCAgIDYg
Kw0KIHhlbi9jb21tb24vZG9tYWluLmMgICAgICAgICAgIHwgICAyICsNCiB4ZW4vZHJpdmVycy9w
YXNzdGhyb3VnaC9wY2kuYyB8ICA0NiArKysNCiB4ZW4vZHJpdmVycy9wY2kvcGh5c2Rldi5jICAg
ICB8ICAgMyArDQogeGVuL2RyaXZlcnMvdnBjaS9NYWtlZmlsZSAgICAgfCAgIDEgKw0KIHhlbi9k
cml2ZXJzL3ZwY2kvaGVhZGVyLmMgICAgIHwgMzA2ICsrKysrKysrKysrKy0tLS0tLS0NCiB4ZW4v
ZHJpdmVycy92cGNpL3ByaXZhdGUuaCAgICB8ICAzNiArKysNCiB4ZW4vZHJpdmVycy92cGNpL3Ny
aW92LmMgICAgICB8IDU2MCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQogeGVu
L2RyaXZlcnMvdnBjaS92cGNpLmMgICAgICAgfCAgNDQgKystDQogeGVuL2luY2x1ZGUveGVuL3Bj
aS5oICAgICAgICAgfCAgIDMgKw0KIHhlbi9pbmNsdWRlL3hlbi92cGNpLmggICAgICAgIHwgIDQw
ICsrLQ0KIDEzIGZpbGVzIGNoYW5nZWQsIDkyMyBpbnNlcnRpb25zKCspLCAxMjggZGVsZXRpb25z
KC0pDQogY3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi9kcml2ZXJzL3ZwY2kvc3Jpb3YuYw0KDQotLSAN
CjIuNTYuMQ0K

